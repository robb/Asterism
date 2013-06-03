//
//  AsterismNegateSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismNegate.h"

SpecBegin(AsterismNegate)

BOOL (^block)(id) = ^BOOL(id obj) {
    return YES;
};

it(@"should return a block", ^{
    expect(negate(block)).notTo.beNil();
});

it(@"should return a block that returns the opposite of the original block", ^{
    expect(block(nil)).to.beTruthy();
    expect(negate(block)(nil)).to.beFalsy();
});

SpecEnd
