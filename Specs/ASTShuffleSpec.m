//
//  ASTShuffleSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 16/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

QuickSpecBegin(ASTShuffleSpec)

describe(@"for arrays", ^{
    it(@"should shuffle the array", ^{
        NSArray *original = @[ @1, @2, @3, @4, @5, @6, @7, @8, @9, @10 ];

        NSArray *shuffled = ASTShuffle(original);

        for (NSNumber *number in original) {
            expect(shuffled).to(contain(number));
        }

        expect(original).toNot(equal(shuffled));
    });
});

describe(@"for ordered sets", ^{
    it(@"should shuffle the set", ^{
        NSOrderedSet *original = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3, @4, @5, @6, @7, @8, @9, @10 ]];

        NSOrderedSet *shuffled = ASTShuffle(original);

        for (NSNumber *number in original) {
            expect(@([shuffled containsObject:number])).to(beTruthy());
        }

        expect(original).toNot(equal(shuffled));
    });
});

QuickSpecEnd
