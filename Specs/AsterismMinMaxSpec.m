//
//  AsterismMinMaxSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismMinMax.h"

SpecBegin(AsterismMinMax)

NSArray *array = @[ @2, @3, @9, @4, @-1 ];

describe(@"min", ^{
    describe(@"without a comparator block", ^{
        it(@"should return the minimum by calling compare:", ^{
            expect(min(array)).to.equal(-1);
        });
    });

    describe(@"with a block returning an NSComparisonResult", ^{
        it(@"should return the minimum", ^{
            NSNumber *minimum = min(array, ^NSComparisonResult(id obj1, id obj2) {
                return [obj1 compare:obj2];
            });

            expect(minimum).to.equal(-1);
        });
    });

    describe(@"with a block returning an NSNumber", ^{
        it(@"should return the minimum", ^{
            NSNumber *minimum = min(array, ^NSNumber *(id obj1, id obj2) {
                return @([obj1 compare:obj2]);
            });
            
            expect(minimum).to.equal(-1);
        });
    });
});

describe(@"max", ^{
    describe(@"without a comparator block", ^{
        it(@"should return the maximum by calling compare:", ^{
            expect(max(array)).to.equal(9);
        });
    });

    describe(@"with a block returning an NSComparisonResult", ^{
        it(@"should return the maximum", ^{
            NSNumber *maximum = max(array, ^NSComparisonResult(id obj1, id obj2) {
                return [obj1 compare:obj2];
            });

            expect(maximum).to.equal(9);
        });
    });

    describe(@"with a block returning an NSNumber", ^{
        it(@"should return the maximum", ^{
            NSNumber *maximum = max(array, ^NSNumber *(id obj1, id obj2) {
                return @([obj1 compare:obj2]);
            });
            
            expect(maximum).to.equal(9);
        });
    });
});

SpecEnd
