//
//  ASTSizeTests.m
//  Asterism
//
//  Created by Robert Böhnke on 08/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTSizeTests : XCTestCase
@end

@implementation ASTSizeTests

- (void)testShouldReturnSizeOfArray {
    NSUInteger count = ASTSize((NSArray *)nil);
    XCTAssertEqual(count, 0, @"should return the number of elements in array: %d", (int)count);
    count = ASTSize(@[]);
    XCTAssertEqual(count, 0, @"should return the number of elements in array: %d", (int)count);
    count = ASTSize(@[@1]);
    XCTAssertEqual(count, 1, @"should return the number of elements in array: %d", (int)count);
    count = ASTSize(@[ @1, @2 ]);
    XCTAssertEqual(count, 2, @"should return the number of elements in array: %d", (int)count);
}

- (void)testShouldReturnSizeOfDictionary {
    NSUInteger count = ASTSize((NSDictionary *)nil);
    XCTAssertEqual(count, 0, @"should return the number of elements in dictionary: %d", (int)count);
    count = ASTSize(@{});
    XCTAssertEqual(count, 0, @"should return the number of elements in dictionary: %d", (int)count);
    count = ASTSize(@{@"foo":@1});
    XCTAssertEqual(count, 1, @"should return the number of elements in dictionary: %d", (int)count);
    count = ASTSize(@{ @"foo": @1, @"bar": @2 });
    XCTAssertEqual(count, 2, @"should return the number of elements in dictionary: %d", (int)count);
}

- (void)testShouldReturnSizeOfSet {
    NSUInteger count = ASTSize((NSSet *)nil);
    XCTAssertEqual(count, 0, @"should return the number of elements in set: %d", (int)count);
    count = ASTSize([NSSet set]);
    XCTAssertEqual(count, 0, @"should return the number of elements in set: %d", (int)count);
    count = ASTSize([NSSet setWithObject:@1]);
    XCTAssertEqual(count, 1, @"should return the number of elements in set: %d", (int)count);
    count = ASTSize([NSSet setWithObjects:@1, @2, nil]);
    XCTAssertEqual(count, 2, @"should return the number of elements in set: %d", (int)count);
}

- (void)testShouldReturnSizeOfOrderedSet {
    NSUInteger count = ASTSize((NSOrderedSet *)nil);
    XCTAssertEqual(count, 0, @"should return the number of elements in set: %d", (int)count);
    count = ASTSize([NSOrderedSet orderedSet]);
    XCTAssertEqual(count, 0, @"should return the number of elements in set: %d", (int)count);
    count = ASTSize([NSOrderedSet orderedSetWithObject:@1]);
    XCTAssertEqual(count, 1, @"should return the number of elements in set: %d", (int)count);
    count = ASTSize([NSOrderedSet orderedSetWithObjects:@1, @2, nil]);
    XCTAssertEqual(count, 2, @"should return the number of elements in set: %d", (int)count);
}

- (void)testShouldReturnSizeOfCollection {
    id<NSFastEnumeration> collection = @[ @1, @2, @3 ];
    NSUInteger count = ASTSize((id<NSFastEnumeration>)nil);
    XCTAssertEqual(count, 0, @"should return the number of elements in collection: %d", (int)count);
    count = ASTSize(collection);
    XCTAssertEqual(count, 3, @"should return the number of elements in collection: %d", (int)count);
}

@end
