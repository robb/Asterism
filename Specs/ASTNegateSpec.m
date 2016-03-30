//
//  ASTNegateSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

QuickSpecBegin(ASTNegateSpec)

BOOL (^block)(id) = ^BOOL(id obj) {
    return YES;
};

it(@"should return a block", ^{
    expect(ASTNegate(block)).toNot(beNil());
});

it(@"should return a block that returns the opposite of the original block", ^{
    expect(@(block(nil))).to(beTruthy());
    expect(@(ASTNegate(block)(nil))).to(beFalsy());
});

QuickSpecEnd
