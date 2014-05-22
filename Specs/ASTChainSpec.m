//
//  ASTChainSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 22/05/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTChain)

describe(@"with one argument", ^{
    it(@"should be transparent", ^{
        NSArray *objects = @[];

        expect(ASTChain(ASTSize(objects))).to.equal(ASTSize(objects));
    });
});

describe(@"with multiple arguments", ^{
    it(@"should pass the result of the previous statement into _", ^{
        NSUInteger result = ASTChain(
            ASTWithout(@[ @1, @2, @3, @4 ], @1),
            ASTWithout(_, @2),
            ASTWithout(_, @3),
            ASTSize(_),
            (_ + 2)
        );

        expect(result).to.equal(3);
    });

    it(@"should allow blocks withing ASTChain statements", ^{
        NSUInteger result = ASTChain(
            ASTTail(@[ @"Bonjour" @"Hej", @"Hallo", @"Hello" ]),
            ASTFilter(_, ^BOOL(NSString *greeting) {
                return greeting.length == 5;
            }),
            ASTSize(_)
        );

        expect(result).to.equal(2);
    });

    it(@"should support normal objective-c messaging", ^{
        NSString *result = ASTChain(
            [NSString string],
            [_ stringByAppendingString:@"Hello "],
            [_ stringByAppendingString:@"World!"]
        );

        expect(result).to.equal(@"Hello World!");
    });
});

SpecEnd
