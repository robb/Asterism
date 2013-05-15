//
//  AsterismEachSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismEach.h"

SpecBegin(AsterismEach)

describe(@"for arrays", ^{
    it(@"should not call the block when given an empty array", ^{
        __block NSUInteger calls = 0;

        each(@[], ^(id obj) {
            calls++;
        });

        expect(calls).to.equal(0);
    });

    describe(@"when iterating over a non-empty array", ^{
        it(@"should call the block once for every object", ^{
            __block NSUInteger calls = 0;

            each(@[@0, @1, @2], ^(id obj) {
                calls++;
            });

            expect(calls).to.equal(3);
        });

        it(@"should optionally pass in the index", ^{
            each(@[@0, @1, @2], ^(id obj, NSUInteger idx) {
                expect(obj).to.equal(@(idx));
            });
        });

        it(@"should iterate over the array in order", ^{
            __block NSUInteger calls = 0;

            each(@[@0, @1, @2], ^(id obj, NSUInteger idx) {
                expect(calls++).to.equal(idx);
            });
        });
    });;
});

describe(@"for dictionaries", ^{
    it(@"should not call the block when given an empty dictionary", ^{
        __block NSUInteger calls = 0;

        each(@{}, ^(id obj) {
            calls++;
        });

        expect(calls).to.equal(0);
    });

    describe(@"when iterating oer a non-empty dictionary", ^{
        it(@"should call the block once for every key-value-pair", ^{
            __block NSUInteger calls = 0;

            NSDictionary *dictionary = @{
                @"foo": @"FOO",
                @"bar": @"BAR"
            };

            each(dictionary, ^(id obj) {
                calls++;
            });

            expect(calls).to.equal(2);
        });

        it(@"should optionally pass in the key", ^{
            each(@{ @"foo": @"FOO" }, ^(id key, id obj) {
                expect([key uppercaseString]).to.equal(obj);
            });
        });
    });
});

SpecEnd
