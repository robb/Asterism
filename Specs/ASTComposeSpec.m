//
//  ASTComposeSpec.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 7/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTCompose.h"

#import "ASTLift.h"
#import "ASTPartial.h"

SpecBegin(ASTCompose)

id (^identity)(id) = ^(id x) {
    return x;
};

describe(@"ASTCompose", ^{
    it(@"should return a block of the correct arity", ^{
        id (^six)(id, id, id, id, id, id) = ASTCompose(identity, ^id(id a, id b, id c, id d, id e, id f) {
            return @6;
        });
        expect(six).notTo.beNil();

        id (^five)(id, id, id, id, id) = ASTCompose(identity, ASTPartial(six, nil));
        expect(five).notTo.beNil();

        id (^four)(id, id, id, id) = ASTCompose(identity, ASTPartial(five, nil));
        expect(four).notTo.beNil();

        id (^three)(id, id, id) = ASTCompose(identity, ASTPartial(four, nil));
        expect(three).notTo.beNil();

        id (^two)(id, id)= ASTCompose(identity, ASTPartial(three, nil));
        expect(two).notTo.beNil();

        id (^one)(id) = ASTCompose(identity, ASTPartial(two, nil));
        expect(one).notTo.beNil();
    });

    it(@"should compose two functions", ^{
        NSDictionary *dict = @{ @"foo": @"bar" };
        NSNumber *(^lengthOfObjectForKeyFoo)(NSDictionary *) = ASTCompose(
            ASTLift0(length),
            ASTPartialRight(ASTLift(objectForKey:), @"foo")
        );
        expect(lengthOfObjectForKeyFoo(dict)).to.equal([[dict objectForKey:@"foo"] length]);
    });
});

SpecEnd
