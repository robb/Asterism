//
//  AsterismPluckSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismPluck.h"

SpecBegin(AsterismPluck)

describe(@"for arrays", ^{
    it(@"should return an array containing the objects' values for the given key path", ^{
        NSArray *before = @[ @"a", @"ab", @"abc" ];

        expect(pluck(before, @"length")).to.equal((@[ @1, @2, @3 ]));
    });
});

describe(@"for sets", ^{
    it(@"should return an array containing the objects' values for the given key path", ^{
        NSSet *before = [NSSet setWithArray:@[ @"a", @"ab", @"abc" ]];
        NSSet *after = pluck(before, @"length");

        expect(after).to.equal(([NSSet setWithArray:@[ @1, @2, @3 ]]));
    });
});

SpecEnd
