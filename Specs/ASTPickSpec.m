//
//  ASTPickSpec.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 2/19/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

QuickSpecBegin(ASTPickSpec)

it(@"should pick only the given keys", ^{
    NSDictionary *dict = @{ @"foo": @"foo", @"bar": @"bar" };
    NSArray *keys = @[ @"foo" ];

    expect(ASTPick(dict, keys)).to(equal(@{ @"foo": @"foo" }));
});

QuickSpecEnd
