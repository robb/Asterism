//
//  ASTWithoutSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 19/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTWithout.h"

SpecBegin(ASTWithout)

describe(@"for arrays", ^{
    NSArray *before = @[ @1, @2, @3 ];

    it(@"should remove all objects that match the value", ^{
        expect(ASTWithout(before, @1)).to.equal((@[ @2, @3 ]));
    });
});

describe(@"for sets", ^{
    NSSet *before = [NSSet setWithArray:@[ @1, @2, @3 ]];

    it(@"should remove all objects that match the value", ^{
        expect(ASTWithout(before, @1)).to.equal(([NSSet setWithArray:@[ @2, @3 ]]));
    });
});

describe(@"for ordered sets", ^{
    NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

    it(@"should remove all objects that match the value", ^{
        expect(ASTWithout(before, @1)).to.equal(([NSOrderedSet orderedSetWithArray:@[ @2, @3 ]]));
    });
});

SpecEnd
