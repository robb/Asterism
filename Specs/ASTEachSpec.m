//
//  ASTEachSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTEachTests : XCTestCase

@end

@implementation ASTEachTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should not call the block when given an empty array" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTEach(@[], ^(id obj) {
                calls++;
            });

            XCTAssertEqualObjects(@(calls), @0);
        }];

        [XCTContext runActivityNamed:@"should call the block once for every object" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTEach(@[ @0, @1, @2 ], ^(id obj) {
                calls++;
            });

            XCTAssertEqualObjects(@(calls), @3);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the index" block:^(id<XCTActivity> _Nonnull activity){
            ASTEach(@[ @0, @1, @2 ], ^(id obj, NSUInteger idx) {
                XCTAssertEqualObjects(obj, @(idx));
            });
        }];

        [XCTContext runActivityNamed:@"should iterate over the array in order" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTEach(@[ @0, @1, @2 ], ^(id obj, NSUInteger idx) {
                XCTAssertEqualObjects(@(calls++), @(idx));
            });
        }];
    }];

    [XCTContext runActivityNamed:@"for dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should not call the block when given an empty dictionary" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTEach(@{}, ^(id obj) {
                calls++;
            });

            XCTAssertEqualObjects(@(calls), @0);
        }];

        [XCTContext runActivityNamed:@"should call the block once for every key-value-pair" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            NSDictionary *dictionary = @{
                @"foo": @"FOO",
                @"bar": @"BAR"
            };

            ASTEach(dictionary, ^(id obj) {
                calls++;
            });

            XCTAssertEqualObjects(@(calls), @2);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the key" block:^(id<XCTActivity> _Nonnull activity){
            ASTEach(@{ @"foo": @"FOO" }, ^(id key, id obj) {
                XCTAssertEqualObjects([key uppercaseString], obj);
            });
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should not call the block when given an empty set" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTEach([NSOrderedSet orderedSet], ^(id obj) {
                calls++;
            });

            XCTAssertEqualObjects(@(calls), @0);
        }];

        [XCTContext runActivityNamed:@"should call the block once for every object" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTEach([NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]], ^(id obj) {
                calls++;
            });

            XCTAssertEqualObjects(@(calls), @3);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the index" block:^(id<XCTActivity> _Nonnull activity){
            ASTEach([NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]], ^(id obj, NSUInteger idx) {
                XCTAssertEqualObjects(obj, @(idx));
            });
        }];

        [XCTContext runActivityNamed:@"should iterate over the array in order" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTEach([NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]], ^(id obj, NSUInteger idx) {
                XCTAssertEqualObjects(@(calls++), @(idx));
            });
        }];
    }];


    [XCTContext runActivityNamed:@"for objects implementing <NSFastEnumeration>" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should not call the block when given an empty collection" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            id<NSFastEnumeration> enumerable = @[];

            ASTEach(enumerable, ^(id obj) {
                calls++;
            });

            XCTAssertEqualObjects(@(calls), @0);
        }];

        [XCTContext runActivityNamed:@"should call the block once for every object" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            id<NSFastEnumeration> enumerable = @[ @1, @2, @3 ];

            ASTEach(enumerable, ^(id obj) {
                calls++;
            });

            XCTAssertEqualObjects(@(calls), @3);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the index" block:^(id<XCTActivity> _Nonnull activity){
             id<NSFastEnumeration> enumerable = @[ @0, @1, @2 ];

             ASTEach(enumerable, ^(id obj, NSUInteger idx) {
                XCTAssertEqualObjects(obj, @(idx));
            });
        }];
    }];
}

@end
