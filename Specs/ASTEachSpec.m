//
//  ASTEachSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

QuickSpecBegin(ASTEachSpec)

describe(@"for arrays", ^{
    it(@"should not call the block when given an empty array", ^{
        __block NSUInteger calls = 0;

        ASTEach(@[], ^(id obj) {
            calls++;
        });

        expect(@(calls)).to(equal(@0));
    });

    it(@"should call the block once for every object", ^{
        __block NSUInteger calls = 0;

        ASTEach(@[ @0, @1, @2 ], ^(id obj) {
            calls++;
        });

        expect(@(calls)).to(equal(@3));
    });

    it(@"should optionally pass in the index", ^{
        ASTEach(@[ @0, @1, @2 ], ^(id obj, NSUInteger idx) {
            expect(obj).to(equal(@(idx)));
        });
    });

    it(@"should iterate over the array in order", ^{
        __block NSUInteger calls = 0;

        ASTEach(@[ @0, @1, @2 ], ^(id obj, NSUInteger idx) {
            expect(@(calls++)).to(equal(@(idx)));
        });
    });
});

describe(@"for dictionaries", ^{
    it(@"should not call the block when given an empty dictionary", ^{
        __block NSUInteger calls = 0;

        ASTEach(@{}, ^(id obj) {
            calls++;
        });

        expect(@(calls)).to(equal(@0));
    });

    it(@"should call the block once for every key-value-pair", ^{
        __block NSUInteger calls = 0;

        NSDictionary *dictionary = @{
            @"foo": @"FOO",
            @"bar": @"BAR"
        };

        ASTEach(dictionary, ^(id obj) {
            calls++;
        });

        expect(@(calls)).to(equal(@2));
    });

    it(@"should optionally pass in the key", ^{
        ASTEach(@{ @"foo": @"FOO" }, ^(id key, id obj) {
            expect([key uppercaseString]).to(equal(obj));
        });
    });
});

describe(@"for ordered sets", ^{
    it(@"should not call the block when given an empty set", ^{
        __block NSUInteger calls = 0;

        ASTEach([NSOrderedSet orderedSet], ^(id obj) {
            calls++;
        });

        expect(@(calls)).to(equal(@0));
    });

    it(@"should call the block once for every object", ^{
        __block NSUInteger calls = 0;

        ASTEach([NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]], ^(id obj) {
            calls++;
        });

        expect(@(calls)).to(equal(@3));
    });

    it(@"should optionally pass in the index", ^{
        ASTEach([NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]], ^(id obj, NSUInteger idx) {
            expect(obj).to(equal(@(idx)));
        });
    });

    it(@"should iterate over the array in order", ^{
        __block NSUInteger calls = 0;

        ASTEach([NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]], ^(id obj, NSUInteger idx) {
            expect(@(calls++)).to(equal(@(idx)));
        });
    });
});


describe(@"for objects implementing <NSFastEnumeration>", ^{
    it(@"should not call the block when given an empty collection", ^{
        __block NSUInteger calls = 0;

        id<NSFastEnumeration> enumerable = @[];

        ASTEach(enumerable, ^(id obj) {
            calls++;
        });

        expect(@(calls)).to(equal(@0));
    });

    it(@"should call the block once for every object", ^{
        __block NSUInteger calls = 0;

        id<NSFastEnumeration> enumerable = @[ @1, @2, @3 ];

        ASTEach(enumerable, ^(id obj) {
            calls++;
        });

        expect(@(calls)).to(equal(@3));
    });
});

QuickSpecEnd
