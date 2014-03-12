//
//  ASTTailSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTTail)

describe(@"for arrays", ^{
    it(@"should return an empty array when given an empty array", ^{
        expect(ASTTail(@[])).to.equal(@[]);
    });

    it(@"should return an empty array when given an array with one element", ^{
        expect(ASTTail(@[ @1 ])).to.equal(@[]);
    });

    it(@"should return all elements after the first element", ^{
        expect((ASTTail(@[ @1, @2, @3 ]))).to.equal((@[ @2, @3 ]));
    });
});

describe(@"for ordered sets", ^{
    it(@"should return an empty array when given an empty array", ^{
        expect(ASTTail([NSOrderedSet orderedSet])).to.equal([NSOrderedSet orderedSet]);
    });

    it(@"should return an empty array when given an array with one element", ^{
        expect(ASTTail([NSOrderedSet orderedSetWithObject:@1])).to.equal([NSOrderedSet orderedSet]);
    });

    it(@"should return all elements after the first element", ^{
        expect((ASTTail([NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]]))).to.equal(([NSOrderedSet orderedSetWithArray:@[ @2, @3 ]]));
    });
});

SpecEnd
