//
//  ASTSizeSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 08/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

QuickSpecBegin(ASTSizeSpec)

describe(@"for arrays", ^{
    it(@"should return the number of elements", ^{
        expect(@(ASTSize((NSArray *)nil))).to(equal(@0));
        expect(@(ASTSize(@[]))).to(equal(@0));
        expect(@(ASTSize(@[ @1 ]))).to(equal(@1));
        expect(@(ASTSize(@[ @1, @2 ]))).to(equal(@2));
    });
});

describe(@"for dictionaries", ^{
    it(@"should return the number of elements", ^{
        expect(@(ASTSize((NSDictionary *)nil))).to(equal(@0));
        expect(@(ASTSize(@{}))).to(equal(@0));
        expect(@(ASTSize(@{ @"foo": @1 }))).to(equal(@1));
        expect(@(ASTSize(@{ @"foo": @1, @"bar": @2 }))).to(equal(@2));
    });
});

describe(@"for sets", ^{
    it(@"should return the number of elements", ^{
        expect(@(ASTSize((NSSet *)nil))).to(equal(@0));
        expect(@(ASTSize([NSSet set]))).to(equal(@0));
        expect(@(ASTSize([NSSet setWithObject:@1]))).to(equal(@1));
        expect(@(ASTSize([NSSet setWithObjects:@1, @2, nil]))).to(equal(@2));
    });
});

describe(@"for ordered sets", ^{
    it(@"should return the number of elements", ^{
        expect(@(ASTSize((NSOrderedSet *)nil))).to(equal(@0));
        expect(@(ASTSize([NSOrderedSet orderedSet]))).to(equal(@0));
        expect(@(ASTSize([NSOrderedSet orderedSetWithObject:@1]))).to(equal(@1));
        expect(@(ASTSize([NSOrderedSet orderedSetWithObjects:@1, @2, nil]))).to(equal(@2));
    });
});

describe(@"for objects implementing <NSFastEnumeration>", ^{
    id<NSFastEnumeration> collection = @[ @1, @2, @3 ];

    expect(@(ASTSize((id<NSFastEnumeration>)nil))).to(equal(@0));
    expect(@(ASTSize(collection))).to(equal(@3));
});

QuickSpecEnd
