//
//  ASTGroupSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismLift.h"

#import "ASTGroup.h"

SpecBegin(ASTGroup)

NSArray *array = @[  @"Hello", @"Bonjour", @"Hallo", @"Hej" ];

it(@"should return a dictionary of sets, grouped by the blocks return value", ^{
    NSDictionary *dictionary = ASTGroup(array, lift0(length));

    expect(dictionary).to.haveCountOf(3);

    expect(dictionary[@3]).to.contain(@"Hej");
    expect(dictionary[@5]).to.contain(@"Hello");
    expect(dictionary[@5]).to.contain(@"Hallo");
    expect(dictionary[@7]).to.contain(@"Bonjour");
});

SpecEnd
