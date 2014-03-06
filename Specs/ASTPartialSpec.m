//
//  ASTPartialSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/8/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTMap.h"

#import "ASTPartial.h"

typedef id (^ZeroArguments)();
typedef id (^OneArguments)(id);
typedef id (^TwoArguments)(id, id);
typedef id (^ThreeArguments)(id, id, id);
typedef id (^FourArguments)(id, id, id, id);
typedef id (^FiveArguments)(id, id, id, id, id);
typedef id (^SixArguments)(id, id, id, id, id, id);

SpecBegin(ASTPartial)

SixArguments six = ^(id a, id b, id c, id d, id e, id f) {
    return @6;
};

TwoArguments concat = ^(NSString *a, NSString *b) {
    return [a stringByAppendingString:b];
};

describe(@"partial", ^{
    it(@"should return a block of reduced arity", ^{
        FiveArguments five = ASTPartial(six, nil);
        expect(five).notTo.beNil();

        FourArguments four = ASTPartial(five, nil);
        expect(four).notTo.beNil();

        ThreeArguments three = ASTPartial(four, nil);
        expect(three).notTo.beNil();

        TwoArguments two = ASTPartial(three, nil);
        expect(two).notTo.beNil();

        OneArguments one = ASTPartial(two, nil);
        expect(one).notTo.beNil();

        ZeroArguments zero = ASTPartial(one, nil);
        expect(zero).notTo.beNil();
    });

    it(@"should partially evaluate the block with the object as the first parameter", ^{
        OneArguments appendToFoo = ASTPartial(concat, @"foo");

        expect(appendToFoo(@"bar")).to.equal(@"foobar");
    });
});

describe(@"partialRight", ^{
    it(@"should return a block of reduced arity", ^{
        FiveArguments five = ASTPartialRight(six, nil);
        expect(five).notTo.beNil();

        FourArguments four = ASTPartialRight(five, nil);
        expect(four).notTo.beNil();

        ThreeArguments three = ASTPartialRight(four, nil);
        expect(three).notTo.beNil();

        TwoArguments two = ASTPartialRight(three, nil);
        expect(two).notTo.beNil();

        OneArguments one = ASTPartialRight(two, nil);
        expect(one).notTo.beNil();

        ZeroArguments zero = ASTPartialRight(one, nil);
        expect(zero).notTo.beNil();
    });

    it(@"should partially evaluate the block with the object as the last parameter", ^{
        OneArguments prependToBar = ASTPartialRight(concat, @"bar");

        expect(prependToBar(@"foo")).to.equal(@"foobar");
    });
});

SpecEnd
