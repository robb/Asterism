//
//  ASTFlattenSpec.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 11/24/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTFlatten.h"

SpecBegin(ASTFlatten)

it(@"should concatenate all array elements", ^{
    NSArray *array = @[ @[ @1 ], @[ @2 ], @[ @3 ] ];
    NSArray *result = @[ @1, @2, @3 ];

    expect(ASTFlatten(array)).to.equal(result);
});

it(@"should preserve non-array elements", ^{
    NSArray *array = @[ @[ @1, @2 ], @3, @[ @4, @5 ] ];
    NSArray *result = @[ @1, @2, @3, @4, @5 ];

    expect(ASTFlatten(array)).to.equal(result);
});

it(@"should flatten the array only a single level", ^{
    NSArray *array = @[ @[ @1 ], @[ @[ @2, @3 ] ], @[ @4 ] ];
    NSArray *result = @[ @1, @[ @2, @3 ], @4 ];

    expect(ASTFlatten(array)).to.equal(result);
});

SpecEnd
