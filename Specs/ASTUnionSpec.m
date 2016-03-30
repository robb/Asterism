//
//  ASTUnionSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

QuickSpecBegin(ASTUnionSpec)

describe(@"for arrays", ^{
    it(@"should return a array of unique objects present in both arrays", ^{
        NSArray *result = ASTUnion(@[ @1, @2 ], @[ @2, @3, @4 ]);

        expect(@(result.count)).to(equal(@4));

        expect(result).to(contain(@1));
        expect(result).to(contain(@2));
        expect(result).to(contain(@3));
        expect(result).to(contain(@4));
    });

    it(@"should maintain order", ^{
        NSArray *result = ASTUnion(@[ @2 ], @[ @1 ]);

        expect(result).to(equal((@[ @2, @1 ])));
    });
});

describe(@"for sets", ^{
    it(@"should return a set of objects present in both sets", ^{
        NSSet *a = [NSSet setWithArray:@[ @1, @2, @3 ]];
        NSSet *b = [NSSet setWithArray:@[ @5, @4, @3 ]];

        NSSet *result = ASTUnion(a, b);

        expect(result).to(equal(([NSSet setWithArray:@[ @1, @2, @3, @4, @5 ]])));
    });
});

describe(@"for ordered sets", ^{
    it(@"should return an ordered of unique objects present in both sets", ^{
        NSOrderedSet *a = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
        NSOrderedSet *b = [NSOrderedSet orderedSetWithArray:@[ @5, @4, @3 ]];

        NSOrderedSet *result = ASTUnion(a, b);

        expect(result).to(equal(([NSOrderedSet orderedSetWithArray:@[ @1, @2, @3, @5, @4 ]])));
    });
});

QuickSpecEnd
