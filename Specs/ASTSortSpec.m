//
//  ASTSortSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 25/03/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTSort)

describe(@"for arrays", ^{
    describe(@"without a comparator", ^{
        it(@"it should sort the array using -compare:", ^{
            NSArray *input = @[ @2, @4, @-2, @9 ];
            NSArray *expected = @[ @-2, @2, @4, @9 ];

            expect(ASTSort(input)).to.equal(expected);
        });
    });

    describe(@"with a comparator", ^{
        it(@"it should sort the array using -compare:", ^{
            NSArray *input = @[ @"AAA", @"B", @"CC", @"DDDD" ];
            NSArray *expected = @[ @"B", @"CC", @"AAA", @"DDDD" ];

            NSComparator sortByLength = ^(NSString *a, NSString *b) {
                return [@(a.length) compare:@(b.length)];
            };

            expect(ASTSort(input, sortByLength)).to.equal(expected);
        });
    });
});

describe(@"for ordered sets", ^{
    describe(@"without a comparator", ^{
        it(@"it should sort the array using -compare:", ^{
            NSOrderedSet *input = [NSOrderedSet orderedSetWithArray:@[ @2, @4, @-2, @9 ]];
            NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:@[ @-2, @2, @4, @9 ]];

            expect(ASTSort(input)).to.equal(expected);
        });
    });

    describe(@"with a comparator", ^{
        it(@"it should sort the array using -compare:", ^{
            NSOrderedSet *input = [NSOrderedSet orderedSetWithArray:@[ @"AAA", @"B", @"CC", @"DDDD" ]];
            NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:@[ @"B", @"CC", @"AAA", @"DDDD" ]];

            NSComparator sortByLength = ^(NSString *a, NSString *b) {
                return [@(a.length) compare:@(b.length)];
            };

            expect(ASTSort(input, sortByLength)).to.equal(expected);
        });
    });
});

SpecEnd
