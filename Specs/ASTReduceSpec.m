//
//  ASTReduceSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 5/26/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTLift.h"

#import "ASTReduce.h"

SpecBegin(ASTReduce)

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
                id result = ASTReduce(@[ @1, @2, @3 ], @4, ^(NSNumber *memo, NSNumber *obj) {
                    return @(memo.doubleValue + obj.doubleValue);
                });

                expect(result).to.equal(10);
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
                id result = ASTReduce(@[ @1, @2, @3 ], ^(NSNumber *memo, NSNumber *obj) {
                    return @(memo.doubleValue + obj.doubleValue);
                });

                expect(result).to.equal(6);
            });
        });

        it(@"should reduce arrays in order", ^{
            id result = ASTReduce(@[ @"a", @"b", @"c" ], ASTLift(stringByAppendingString:));

            expect(result).to.equal(@"abc");
        });
    });
});

SpecEnd
