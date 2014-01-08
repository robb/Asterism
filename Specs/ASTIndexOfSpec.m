//
//  ASTIndexOfSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTIndexOf.h"

SpecBegin(ASTIndexOf)

describe(@"for arrays", ^{
    NSArray *array = @[ @1, @2, @3, @2 ];

    it(@"should return NSNotFound if the element could not be found", ^{
        expect(ASTIndexOf(array, nil)).to.equal(NSNotFound);
    });

    it(@"should return the index of the element in the array", ^{
        expect(ASTIndexOf(array, @3)).to.equal(2);
    });

    it(@"should return the lowest index if multiple elements match", ^{
        expect(ASTIndexOf(array, @1)).to.equal(0);
    });
});

describe(@"for ordered sets", ^{
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

    it(@"should return NSNotFound if the element could not be found", ^{
        expect(ASTIndexOf(set, nil)).to.equal(NSNotFound);
    });

    it(@"should return the index of the element in the array", ^{
        expect(ASTIndexOf(set, @3)).to.equal(2);
    });
});

describe(@"for objects implementing <NSFastEnumeration>", ^{
    id<NSFastEnumeration> collection = @[ @1, @2, @3, @2 ];

    it(@"should return NSNotFound if the element could not be found", ^{
        expect(ASTIndexOf(collection, nil)).to.equal(NSNotFound);
    });

    it(@"should return the index of the element in the array", ^{
        expect(ASTIndexOf(collection, @3)).to.equal(2);
    });

    it(@"should return the lowest index if multiple elements match", ^{
        expect(ASTIndexOf(collection, @1)).to.equal(0);
    });
});

SpecEnd
