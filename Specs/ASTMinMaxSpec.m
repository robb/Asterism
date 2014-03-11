//
//  ASTMinMaxSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTMinMax)

NSArray *array = @[ @2, @3, @9, @4, @-1 ];

describe(@"ASTMin", ^{
    describe(@"without a comparator block", ^{
        it(@"should return the minimum by calling compare:", ^{
            expect(ASTMin(array)).to.equal(-1);
        });
    });

    describe(@"with a block returning an NSComparisonResult", ^{
        it(@"should return the minimum", ^{
            NSNumber *minimum = ASTMin(array, ^NSComparisonResult(id obj1, id obj2) {
                return [obj1 compare:obj2];
            });

            expect(minimum).to.equal(-1);
        });
    });
});

describe(@"ASTMax", ^{
    describe(@"without a comparator block", ^{
        it(@"should return the maximum by calling compare:", ^{
            expect(ASTMax(array)).to.equal(9);
        });
    });

    describe(@"with a block returning an NSComparisonResult", ^{
        it(@"should return the maximum", ^{
            NSNumber *maximum = ASTMax(array, ^NSComparisonResult(id obj1, id obj2) {
                return [obj1 compare:obj2];
            });

            expect(maximum).to.equal(9);
        });
    });
});

SpecEnd
