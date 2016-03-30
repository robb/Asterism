//
//  ASTHeadSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

QuickSpecBegin(ASTHeadSpec)

describe(@"for arrays", ^{
    it(@"should return nil if the array is empty", ^{
        expect(ASTHead(@[])).to(beNil());
    });

    it(@"should return the first element", ^{
        expect(ASTHead(@[ @1, @2 ])).to(equal(@1));
    });
});

describe(@"for ordered sets", ^{
    it(@"should return nil if the set is empty", ^{
        expect(ASTHead([NSOrderedSet orderedSet])).to(beNil());
    });

    it(@"should return the first element", ^{
        expect(ASTHead([NSOrderedSet orderedSetWithArray:@[ @1, @2 ]])).to(equal(@1));
    });
});

QuickSpecEnd
