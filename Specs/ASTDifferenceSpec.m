//
//  ASTDifferenceSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTDifference.h"

SpecBegin(ASTDifference)

describe(@"for arrays", ^{
    it(@"should return all values from the first array that are not present in the other", ^{
        NSArray *before = @[ @1, @2, @3, @4 ];

        NSArray *result = ASTDifference(before, @[ @3, @4 ]);

        expect(result).to.equal((@[ @1, @2 ]));
    });

    it(@"should preserve the order of the first array", ^{
        NSArray *before = @[ @1, @2, @3, @4 ];

        NSArray *result = ASTDifference(before, @[ @2, @4 ]);

        expect(result).to.equal((@[ @1, @3 ]));
    });
});

describe(@"for sets", ^{
    it(@"should return all values from the first set that are not present in the other", ^{
        NSSet *before = [NSSet setWithArray:@[ @1, @2, @3, @4 ]];

        NSSet *result = ASTDifference(before, [NSSet setWithArray:@[ @3, @4 ]]);

        expect(result).to.equal(([NSSet setWithArray:@[ @1, @2 ]]));
    });
});

SpecEnd
