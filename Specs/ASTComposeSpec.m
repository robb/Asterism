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

typedef id (^ZeroArguments)();
typedef id (^OneArgument)(id);
typedef id (^TwoArguments)(id, id);
typedef id (^ThreeArguments)(id, id, id);
typedef id (^FourArguments)(id, id, id, id);
typedef id (^FiveArguments)(id, id, id, id, id);
typedef id (^SixArguments)(id, id, id, id, id, id);

SpecBegin(ASTCompose)

id (^identity)(id) = ^(id x) {
    return x;
};

SixArguments six = ^(id a, id b, id c, id d, id e, id f) {
    return @6;
};

FiveArguments five = ASTPartial(six, nil);
FourArguments four = ASTPartial(five, nil);
ThreeArguments three = ASTPartial(four, nil);
TwoArguments two = ASTPartial(three, nil);
OneArgument one = ASTPartial(two, nil);

describe(@"ASTCompose", ^{
    it(@"should return a block of the correct arity", ^{
        SixArguments six_ = ASTCompose(identity, six);
        expect(six_).notTo.beNil();

        FiveArguments five_ = ASTCompose(identity, five);
        expect(five_).notTo.beNil();

        FourArguments four_ = ASTCompose(identity, four);
        expect(four_).notTo.beNil();

        ThreeArguments three_ = ASTCompose(identity, three);
        expect(three_).notTo.beNil();

        TwoArguments two_ = ASTCompose(identity, two);
        expect(two_).notTo.beNil();

        OneArgument one_ = ASTCompose(identity, one);
        expect(one_).notTo.beNil();
    });

    it(@"should compose two functions", ^{
        NSNumber *(^lengthOfObjectForKeyFoo)(NSDictionary *) = ASTCompose(
            ASTLift0(length),
            ASTPartialRight(ASTLift(objectForKey:), @"foo")
        );
        expect(lengthOfObjectForKeyFoo(@{ @"foo": @"bar" })).to.equal(@3);
    });
});

SpecEnd
