//
//  AsterismTailSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismTail.h"

SpecBegin(AsterismTail)

it(@"should return an empty array when given an empty array", ^{
    expect(tail(@[])).to.equal(@[]);
});

it(@"should return an empty array when given an array with one element", ^{
    expect(tail(@[ @1 ])).to.equal(@[]);
});

it(@"should return all elements after the first element", ^{
    expect((tail(@[ @1, @2, @3 ]))).to.equal((@[ @2, @3 ]));
});

SpecEnd
