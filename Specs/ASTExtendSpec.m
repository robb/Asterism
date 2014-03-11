//
//  ASTExtendSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTExtend)

it(@"should return the union of both dictionaries", ^{
    NSDictionary *dict   = @{ @1: @"foo" };
    NSDictionary *source = @{ @2: @"baz" };

    NSDictionary *result = @{
        @1: @"foo",
        @2: @"baz"
    };

    expect(ASTExtend(dict, source)).to.equal(result);
});

it(@"should prefer values from source over values from dict", ^{
    NSDictionary *dict   = @{ @1: @"foo" };
    NSDictionary *source = @{ @1: @"bar" };

    expect(ASTExtend(dict, source)).to.equal(source);
});

SpecEnd
