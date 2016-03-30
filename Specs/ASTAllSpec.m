//
//  ASTAllSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

QuickSpecBegin(ASTAllSpec)

it(@"should return NO for empty collections", ^{
    expect(@(ASTAll((id<NSFastEnumeration>)nil, ^(id obj){ return NO; }))).to(beFalsy());

    expect(@(ASTAll(@[], ^(id obj){ return NO; }))).to(beFalsy());
});

BOOL (^isEven)(NSNumber *) = ^BOOL (NSNumber *number) {
    return number.integerValue % 2 == 0;
};

it(@"should return YES if all elements pass the test", ^{
    NSArray *numbers = @[ @2, @4, @6, @8 ];

    expect(@(ASTAll(numbers, isEven))).to(beTruthy());
});

it(@"should return NO if one element fails the test", ^{
    NSArray *numbers = @[ @2, @4, @6, @8, @9 ];

    expect(@(ASTAll(numbers, isEven))).to(beFalsy());
});

it(@"should use the values of dictionaries", ^{
    NSDictionary *dict = @{ @"foo": @2 };

    expect(@(ASTAll(dict, isEven))).to(beTruthy());
});

QuickSpecEnd
