//
//  ASTEachTests.m
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTEachTests : XCTestCase
@end

@implementation ASTEachTests

- (void)testShouldNotCallBlockForEmptyArray {
    __block NSUInteger calls = 0;

    ASTEach(@[], ^(id obj) {
        calls++;
    });

    XCTAssertEqual(calls, 0, @"should not call the block when given an empty array");
}

- (void)testShouldCallBlockOnceForEachObjectInArray {
    __block NSUInteger calls = 0;

    ASTEach(@[ @0, @1, @2 ], ^(id obj) {
        calls++;
    });

    XCTAssertEqual(calls, 3, @"should call the block once for every object in array");
}

- (void)testShouldOptionallyPassInTheIndexInArray {
    ASTEach(@[ @0, @1, @2 ], ^(id obj, NSUInteger idx) {
        XCTAssertEqualObjects(obj, @(idx), @"should optionally pass in the index in array");
    });
}

- (void)testShouldIterateOverArrayInOrder {
    __block NSUInteger calls = 0;

    ASTEach(@[ @0, @1, @2 ], ^(id obj, NSUInteger idx) {
        XCTAssertEqual(calls++, idx, @"should iterate over the array in order");
    });
}

- (void)testShouldNotCallBlockForEmptyDictionary {
    __block NSUInteger calls = 0;

    ASTEach(@{}, ^(id obj) {
        calls++;
    });

    XCTAssertEqual(calls, 0, @"should not call the block when given an empty dictionary");
}

- (void)testShouldCallBlockOnceForEachObjectInDictionary {
    __block NSUInteger calls = 0;

    NSDictionary *dictionary = @{
        @"foo": @"FOO",
        @"bar": @"BAR"
    };

    ASTEach(dictionary, ^(id obj) {
        calls++;
    });

    XCTAssertEqual(calls, 2, @"should call the block once for every key-value-pair");
}

- (void)testShouldOptionallyPassInDictionaryKey {
    ASTEach(@{ @"foo": @"FOO" }, ^(id key, id obj) {
        XCTAssertEqualObjects([key uppercaseString], obj, @"should optionally pass in the key");
    });
}

- (void)testShouldNotCallBlockForEmptyOrderedSet {
    __block NSUInteger calls = 0;

    ASTEach([NSOrderedSet orderedSet], ^(id obj) {
        calls++;
    });

    XCTAssertEqual(calls, 0, @"should not call the block when given an empty ordered set");
}

- (void)testShouldCallBlockOnceForEachObjectInOrderedSet {
    __block NSUInteger calls = 0;

    ASTEach([NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]], ^(id obj) {
        calls++;
    });

    XCTAssertEqual(calls, 3, @"should call the block once for every object in ordered set");
}

- (void)testShouldOptionallyPassInTheIndexInOrderedSet {
    ASTEach([NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]], ^(id obj, NSUInteger idx) {
        XCTAssertEqualObjects(obj, @(idx), @"should optionally pass in the index in ordreed set");
    });
}

- (void)testShouldIterateOverOrderedSetInOrder {
    __block NSUInteger calls = 0;

    ASTEach([NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]], ^(id obj, NSUInteger idx) {
        XCTAssertEqual(calls++, idx, @"should iterate over the ordered set in order");
    });
}

- (void)testShouldNotCallBlockForEmptyCollection {
    __block NSUInteger calls = 0;

    id<NSFastEnumeration> enumerable = @[];

    ASTEach(enumerable, ^(id obj) {
        calls++;
    });

    XCTAssertEqual(calls, 0, @"should not call the block when given an empty collection");
}

- (void)testShouldCallBlockOnceForEachObjectInOrderedSetInCollection {
    __block NSUInteger calls = 0;

    id<NSFastEnumeration> enumerable = @[ @1, @2, @3 ];

    ASTEach(enumerable, ^(id obj) {
        calls++;
    });

    XCTAssertEqual(calls, 3,  @"should call the block once for every object in collection");
}

@end
