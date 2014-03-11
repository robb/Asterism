//
//  ASTEmptySpec.m
//  Asterism
//
//  Created by Robert Böhnke on 8/5/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTEmpty)

describe(@"for arrays", ^{
    it(@"should return YES for an empty array", ^{
        expect(ASTEmpty(@[])).to.beTruthy();
    });

    it(@"should return NO for a non-empty array", ^{
        expect(ASTEmpty(@[ @1 ])).to.beFalsy();
    });
});

describe(@"for dictionaries", ^{
    it(@"should return YES for an empty dictionary", ^{
        expect(ASTEmpty(@{})).to.beTruthy();
    });

    it(@"should return NO for a non-empty dictionary", ^{
        expect(ASTEmpty(@{ @1: @2 })).to.beFalsy();
    });
});

describe(@"for sets", ^{
    it(@"should return YES for an empty set", ^{
        expect(ASTEmpty([NSSet set])).to.beTruthy();
    });

    it(@"should return NO for a non-empty set", ^{
        expect(ASTEmpty([NSSet setWithObject:@1])).to.beFalsy();
    });
});

describe(@"for ordered sets", ^{
    it(@"should return YES for an empty set", ^{
        expect(ASTEmpty([NSOrderedSet orderedSet])).to.beTruthy();
    });

    it(@"should return NO for a non-empty set", ^{
        expect(ASTEmpty([NSOrderedSet orderedSetWithObject:@1])).to.beFalsy();
    });
});

describe(@"for objects that implement NSFastEnumeration", ^{
    it(@"should return YES for empty collections", ^{
        id<NSFastEnumeration> collection = @[];

        expect(ASTEmpty(collection)).to.beTruthy();
    });

    it(@"should return NO for non-empty collections", ^{
        id<NSFastEnumeration> collection = @[ @1 ];

        expect(ASTEmpty(collection)).to.beFalsy();
    });
});

SpecEnd
