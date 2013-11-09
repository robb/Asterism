//
//  ASTPluckSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTPluck.h"

SpecBegin(ASTPluck)

describe(@"for arrays", ^{
    it(@"should return an array containing the objects' values for the given key path", ^{
        NSArray *before = @[ @"a", @"ab", @"abc" ];

        expect(ASTPluck(before, @"length")).to.equal((@[ @1, @2, @3 ]));
    });
});

describe(@"for sets", ^{
    it(@"should return an array containing the objects' values for the given key path", ^{
        NSSet *before = [NSSet setWithArray:@[ @"a", @"ab", @"abc" ]];
        NSSet *after = ASTPluck(before, @"length");

        expect(after).to.equal(([NSSet setWithArray:@[ @1, @2, @3 ]]));
    });
});

describe(@"for ordered sets", ^{
    it(@"should return an ordered set containing the objects' values for the given key path", ^{
        NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @"a", @"ab", @"abc" ]];
        NSOrderedSet *after = ASTPluck(before, @"length");

        expect(after).to.equal(([NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]]));
    });
});

SpecEnd
