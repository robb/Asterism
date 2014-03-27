//
//  ASTPluckSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTPluck)

it(@"should return an array containing the objects' values for the given key path", ^{
    NSArray *before = @[ @"a", @"ab", @"abc" ];

    expect(ASTPluck(before, @"length")).to.equal((@[ @1, @2, @3 ]));
});

it(@"should use the values of dictionaries", ^{
    NSDictionary *before = @{ @"a": @"a", @"ab": @"ab", @"abc":@"abc" };

    expect(ASTPluck(before, @"length")).to.equal((@{ @"a": @1, @"ab": @2, @"abc":@3 }));
});

SpecEnd
