//
//  ASTIndexBySpec.m
//  Asterism
//
//  Created by Robert Böhnke on 24/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

QuickSpecBegin(ASTIndexBySpec)

NSArray *array = @[ @"Hello", @"Bonjour", @"Hej" ];

describe(@"with blocks", ^{
    it(@"should index elements by the return value", ^{
        NSDictionary *dictionary = ASTIndexBy(array, ^(NSString *string) {
            return @(string.length);
        });

        expect(@(dictionary.count)).to(equal(@3));

        expect(dictionary[@3]).to(contain(@"Hej"));
        expect(dictionary[@5]).to(contain(@"Hello"));
        expect(dictionary[@7]).to(contain(@"Bonjour"));
    });
});

describe(@"with keypaths", ^{
    it(@"should index elements by the return value", ^{
        NSDictionary *dictionary = ASTIndexBy(array, @"length");

        expect(@(dictionary.count)).to(equal(@3));

        expect(dictionary[@3]).to(contain(@"Hej"));
        expect(dictionary[@5]).to(contain(@"Hello"));
        expect(dictionary[@7]).to(contain(@"Bonjour"));
    });
});

it(@"should use the values of dictionaries", ^{
    NSDictionary *dict = @{ @"foo": @"Hello" };

    NSDictionary *blockResult = ASTIndexBy(dict, ^(NSString *string) {
        return @(string.length);
    });

    expect(blockResult[@5]).to(contain(@"Hello"));

    NSDictionary *keyPathResult = ASTIndexBy(dict, @"length");

    expect(keyPathResult[@5]).to(contain(@"Hello"));
});

QuickSpecEnd
