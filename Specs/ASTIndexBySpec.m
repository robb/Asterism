//
//  ASTIndexBySpec.m
//  Asterism
//
//  Created by Robert Böhnke on 24/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import "ASTIndexBy.h"

SpecBegin(ASTIndexBy)

NSArray *array = @[ @"Hello", @"Bonjour", @"Hej" ];

describe(@"with blocks", ^{
    it(@"should index elements by the return value", ^{
        NSDictionary *dictionary = ASTIndexBy(array, ^(NSString *string) {
            return @(string.length);
        });

        expect(dictionary).to.haveCountOf(3);

        expect(dictionary[@3]).to.equal(@"Hej");
        expect(dictionary[@5]).to.equal(@"Hello");
        expect(dictionary[@7]).to.equal(@"Bonjour");
    });
});

describe(@"with keypaths", ^{
    it(@"should index elements by the return value", ^{
        NSDictionary *dictionary = ASTIndexBy(array, @"length");

        expect(dictionary).to.haveCountOf(3);

        expect(dictionary[@3]).to.equal(@"Hej");
        expect(dictionary[@5]).to.equal(@"Hello");
        expect(dictionary[@7]).to.equal(@"Bonjour");
    });
});

SpecEnd
