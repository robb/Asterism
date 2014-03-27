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

NSDictionary *dict = @{ @"foo": @2, @"bar": @9, @"baz": @-1 };

NSComparator comparator = ^NSComparisonResult(id obj1, id obj2) {
    // Reverse the result to make sure the block is actually invoked
    switch ([obj1 compare:obj2]) {
        case NSOrderedAscending:
            return NSOrderedDescending;

        case NSOrderedSame:
            return NSOrderedSame;

        case NSOrderedDescending:
            return NSOrderedAscending;
    }
};

describe(@"ASTMin", ^{
    describe(@"without a comparator block", ^{
        it(@"should return the minimum by calling compare:", ^{
            expect(ASTMin(array)).to.equal(-1);
        });

        it(@"should use the values of dictionaries", ^{
            expect(ASTMin(dict)).to.equal(-1);
        });
    });

    describe(@"with a block returning an NSComparisonResult", ^{
        it(@"should return the minimum", ^{
            expect(ASTMin(array, comparator)).to.equal(9);
        });

        it(@"should use the values of dictionaries", ^{
            expect(ASTMin(dict, comparator)).to.equal(9);
        });
    });
});

describe(@"ASTMax", ^{
    describe(@"without a comparator block", ^{
        it(@"should return the maximum by calling compare:", ^{
            expect(ASTMax(array)).to.equal(9);
        });

        it(@"should use the values of dictionaries", ^{
            expect(ASTMax(dict)).to.equal(9);
        });
    });

    describe(@"with a block returning an NSComparisonResult", ^{
        it(@"should return the maximum", ^{
             expect(ASTMax(array, comparator)).to.equal(-1);
        });

        it(@"should use the values of dictionaries", ^{
            expect(ASTMax(dict, comparator)).to.equal(-1);
        });
    });
});

SpecEnd
