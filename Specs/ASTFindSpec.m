//
//  ASTFindSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTFind.h"

SpecBegin(ASTFind)

describe(@"for arrays", ^{
    it(@"should return the first object that passes the test", ^{
        NSArray *array = @[ @1, @2, @3, @4, @5, @6 ];

        NSNumber *result = ASTFind(array, ^BOOL (NSNumber *number){
            return number.integerValue % 2 == 0;
        });

        expect(result).to.equal(2);
    });

    it(@"should return nil if no object passes the test", ^{
        NSArray *array = @[ @1, @3, @5 ];

        NSNumber *result = ASTFind(array, ^BOOL (NSNumber *number){
            return number.integerValue % 2 == 0;
        });

        expect(result).to.beNil();
    });

    it(@"should optionally pass in the index", ^{
        NSArray *array = @[ @1, @2, @3, @4, @5, @6 ];

        NSNumber *result = ASTFind(array, ^BOOL (NSNumber *number, NSUInteger index){
            return index == 3;
        });

        expect(result).to.equal(4);
    });
});

describe(@"for dictionaries", ^{
    NSDictionary *dictionary = @{ @"foo": @"bar", @"baz": @"qux" };

    it(@"should return the first object that passes the test", ^{
        NSString *result = ASTFind(dictionary, ^BOOL(NSString *string) {
            return [string characterAtIndex:0] == 'b';
        });

        expect(result).to.equal(@"bar");
    });

    it(@"should return nil if no object passes the test", ^{
        NSString *result = ASTFind(dictionary, ^BOOL (NSString *string){
            return [string characterAtIndex:0] == 'Y';
        });

        expect(result).to.beNil();
    });

    it(@"should optionally pass in the key", ^{
        NSString *result = ASTFind(dictionary, ^BOOL (NSString *key, NSString *value){
            return [key characterAtIndex:0] == 'f';
        });

        expect(result).to.equal(@"bar");
    });
});

describe(@"for objects implementing <NSFastEnumeration>", ^{
    id<NSFastEnumeration> collection = @[ @1, @2, @3 ];

    it(@"should return the first object that passes the test", ^{
        NSString *result = ASTFind(collection, ^BOOL (NSNumber *number){
            return [number integerValue] % 2 == 0;
        });

        expect(result).to.equal(2);
    });

    it(@"should return nil if no object passes the test", ^{
        NSString *result = ASTFind(collection, ^BOOL (NSNumber *number){
            return [number integerValue] > 9;
        });

        expect(result).to.beNil();
    });
});

SpecEnd
