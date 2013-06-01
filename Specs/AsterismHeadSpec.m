//
//  AsterismHeadSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismHead.h"

SpecBegin(AsterismHead)

it(@"should return nil if the array is empty", ^{
    expect(head(@[])).to.beNil();
});

it(@"should return the first element", ^{
    expect(head(@[ @1, @2 ])).to.equal(@1);
});

SpecEnd
