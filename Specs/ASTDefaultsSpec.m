//
//  ASTDefaultsSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 21/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTDefaults)

it(@"should return the union of both dictionaries", ^{
    NSDictionary *dict     = @{ @1: @"foo" };
    NSDictionary *defaults = @{ @2: @"baz" };

    NSDictionary *result = @{
        @1: @"foo",
        @2: @"baz"
    };

    expect(ASTDefaults(dict, defaults)).to.equal(result);
});

it(@"should prefer values from dict over values from defaults", ^{
    NSDictionary *dict     = @{ @1: @"foo" };
    NSDictionary *defaults = @{ @1: @"bar" };

    expect(ASTDefaults(dict, defaults)).to.equal(dict);
});

SpecEnd
