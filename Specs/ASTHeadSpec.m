//
//  ASTHeadSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTHead.h"

SpecBegin(ASTHead)

it(@"should return nil if the array is empty", ^{
    expect(ASTHead(@[])).to.beNil();
});

it(@"should return the first element", ^{
    expect(ASTHead(@[ @1, @2 ])).to.equal(@1);
});

SpecEnd
