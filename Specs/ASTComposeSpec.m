//
//  ASTComposeSpec.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 7/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTCompose.h"

SpecBegin(ASTCompose)

typedef NSNumber *(^fun)(NSNumber *);

fun addTwo = ^(NSNumber *n) {
    return @(n.intValue + 2);
};

fun multiplyByTwo = ^(NSNumber *n) {
    return @(n.intValue * 2);
};

it(@"should compose two functions", ^{
    fun multiplyByTwoAndAddTwo = ASTCompose(addTwo, multiplyByTwo);
    expect(multiplyByTwoAndAddTwo(@4)).to.equal(10);
});

SpecEnd
