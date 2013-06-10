//
//  ASTTailSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTTail.h"

SpecBegin(ASTTail)

it(@"should return an empty array when given an empty array", ^{
    expect(ASTTail(@[])).to.equal(@[]);
});

it(@"should return an empty array when given an array with one element", ^{
    expect(ASTTail(@[ @1 ])).to.equal(@[]);
});

it(@"should return all elements after the first element", ^{
    expect((ASTTail(@[ @1, @2, @3 ]))).to.equal((@[ @2, @3 ]));
});

SpecEnd
