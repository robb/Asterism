//
//  AsterismPartialSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/8/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTMap.h"
#import "ASTLift.h"

#import "AsterismPartial.h"

typedef id (^ZeroArguments)();
typedef id (^OneArguments)(id);
typedef id (^TwoArguments)(id, id);
typedef id (^ThreeArguments)(id, id, id);
typedef id (^FourArguments)(id, id, id, id);
typedef id (^FiveArguments)(id, id, id, id, id);
typedef id (^SixArguments)(id, id, id, id, id, id);

SpecBegin(AsterismPartial)

SixArguments six = ^(id a, id b, id c, id d, id e, id f) {
    return @6;
};

TwoArguments concat = ASTLift(stringByAppendingString:);

describe(@"partial", ^{
    it(@"should return a block of reduced arity", ^{
        FiveArguments five = partial(six, nil);
        expect(five).notTo.beNil();

        FourArguments four = partial(five, nil);
        expect(four).notTo.beNil();

        ThreeArguments three = partial(four, nil);
        expect(three).notTo.beNil();

        TwoArguments two = partial(three, nil);
        expect(two).notTo.beNil();

        OneArguments one = partial(two, nil);
        expect(one).notTo.beNil();

        ZeroArguments zero = partial(one, nil);
        expect(zero).notTo.beNil();
    });

    it(@"should partially evaluate the block with the object as the first parameter", ^{
        OneArguments appendToFoo = partial(concat, @"foo");

        expect(appendToFoo(@"bar")).to.equal(@"foobar");
    });
});

describe(@"partialRight", ^{
    it(@"should return a block of reduced arity", ^{
        FiveArguments five = partialRight(six, nil);
        expect(five).notTo.beNil();

        FourArguments four = partialRight(five, nil);
        expect(four).notTo.beNil();

        ThreeArguments three = partialRight(four, nil);
        expect(three).notTo.beNil();

        TwoArguments two = partialRight(three, nil);
        expect(two).notTo.beNil();

        OneArguments one = partialRight(two, nil);
        expect(one).notTo.beNil();

        ZeroArguments zero = partialRight(one, nil);
        expect(zero).notTo.beNil();
    });

    it(@"should partially evaluate the block with the object as the last parameter", ^{
        OneArguments prependToBar = partialRight(concat, @"bar");

        expect(prependToBar(@"foo")).to.equal(@"foobar");
    });
});

SpecEnd
