//
//  ASTIntersectionSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTIntersection.h"

SpecBegin(ASTIntersection)

describe(@"for arrays", ^{
    it(@"should return all values present in both arrays", ^{
        NSArray *result = ASTIntersection(@[ @1, @2, @3 ], @[ @3, @4, @5 ]);

        expect(result).to.equal((@[ @3 ]));
    });

    it(@"should maintain order", ^{
        NSArray *result = ASTIntersection(@[ @1, @2, @3 ], @[ @1, @2, @3 ]);

        expect(result).to.equal((@[ @1, @2, @3 ]));
    });
});

describe(@"for sets", ^{
    it(@"should return all values present in both sets", ^{
        NSSet *a = [NSSet setWithArray:@[ @1, @2, @3 ]];
        NSSet *b = [NSSet setWithArray:@[ @5, @4, @3 ]];

        NSSet *result = ASTIntersection(a, b);

        expect(result).to.equal(([NSSet setWithArray:@[ @3 ]]));
    });
});

SpecEnd
