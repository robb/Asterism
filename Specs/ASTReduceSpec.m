//
//  ASTReduceSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 5/26/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "Asterism.h"

SpecBegin(ASTReduce)

NSNumber *(^add)(NSNumber *, NSNumber *) = ^(NSNumber *memo, NSNumber *obj) {
    return @(memo.doubleValue + obj.doubleValue);
};

describe(@"reduce", ^{
    describe(@"for objects implementing <NSFastEnumeration>", ^{
        describe(@"when given an intial value", ^{
            it(@"should return the initial value when reducing an empty collection", ^{
                NSString *initial = @"initial";

                id result = ASTReduce(@[], initial, ^id(id memo, id obj) {
                    return nil;
                });

                expect(result).to.equal(initial);
            });

            it(@"should use the inital value in the first iteration", ^{
                id result = ASTReduce(@[ @1, @2, @3 ], @4, add);

                expect(result).to.equal(10);
            });

            it(@"should  use the values of dictionaries", ^{
                NSDictionary *dict = @{ @"a": @1, @"b": @2, @"c": @3 };

                expect(ASTReduce(dict, @4, add)).to.equal(10);
            });
        });

        describe(@"without an inital value", ^{
            it(@"should return nil when reducing an empty collection", ^{
                id result = ASTReduce(@[], ^id(id memo, id obj) {
                    return nil;
                });

                expect(result).to.beNil();
            });

            it(@"should return the single value of a collection with one member", ^{
                id result = ASTReduce(@[ @1 ], ^id(id memo, id obj) {
                    return nil;
                });

                expect(result).to.equal(1);
            });

            it(@"should reduce the collection starting from the first value", ^{
                id result = ASTReduce(@[ @1, @2, @3 ], add);

                expect(result).to.equal(6);
            });

            it(@"should  use the values of dictionaries", ^{
                NSDictionary *dict = @{ @"a": @1, @"b": @2, @"c": @3 };

                expect(ASTReduce(dict, add)).to.equal(6);
            });
        });

        it(@"should reduce arrays in order", ^{
            id result = ASTReduce(@[ @"a", @"b", @"c" ], ^(NSString *memo, NSString *obj) {
                return [memo stringByAppendingString:obj];
            });

            expect(result).to.equal(@"abc");
        });
    });
});

SpecEnd
