//
//  ASTGroupBySpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTGroupBy)

NSArray *array = @[ @"Hello", @"Bonjour", @"Hallo", @"Hej" ];

it(@"should return a dictionary of sets, grouped by the blocks return value", ^{
    NSDictionary *dictionary = ASTGroupBy(array, ^(NSString *string) {
        return @(string.length);
    });

    expect(dictionary).to.haveCountOf(3);

    expect(dictionary[@3]).to.contain(@"Hej");
    expect(dictionary[@5]).to.contain(@"Hello");
    expect(dictionary[@5]).to.contain(@"Hallo");
    expect(dictionary[@7]).to.contain(@"Bonjour");
});

it(@"should remove elements that grouped by `nil`", ^{
    NSDictionary *dictionary = ASTGroupBy(@[ @[ @1 ], @[ @2, @3 ], @[] ], ^(NSArray *array) {
        return array.firstObject;
    });

    expect(dictionary).to.haveCountOf(2);

    expect(dictionary[@1]).to.contain(@[ @1 ]);
    expect(dictionary[@2]).to.contain(( @[ @2, @3 ] ));
});

it(@"should return a dictionary of sets, grouped by their value for a key path", ^{
    NSDictionary *dictionary = ASTGroupBy(array, @"length");

    expect(dictionary).to.haveCountOf(3);

    expect(dictionary[@3]).to.contain(@"Hej");
    expect(dictionary[@5]).to.contain(@"Hello");
    expect(dictionary[@5]).to.contain(@"Hallo");
    expect(dictionary[@7]).to.contain(@"Bonjour");
});

it(@"should use the values of dictionaries", ^{
    NSDictionary *dict = @{ @"foo": @"Hello" };

    NSDictionary *blockResult = ASTGroupBy(dict, ^(NSString *string) {
        return @(string.length);
    });

    expect(blockResult[@5]).to.contain(@"Hello");

    NSDictionary *keyPathResult = ASTGroupBy(dict, @"length");

    expect(keyPathResult[@5]).to.contain(@"Hello");
});

SpecEnd
