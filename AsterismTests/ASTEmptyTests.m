//
//  ASTEmptyTests.m
//  Asterism
//
//  Created by Robert Böhnke on 8/5/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTEmptyTests : XCTestCase
@end

@implementation ASTEmptyTests

- (void)testShouldReturnTrueForEmptyArray {
    XCTAssertTrue(ASTEmpty(@[]), @"should return YES for an empty array");
}

- (void)testShouldReturnFalseForNonEmptyArray {
    XCTAssertFalse(ASTEmpty(@[ @1 ]), @"should return NO for a non-empty array");
}

- (void)testShouldReturnTrueForEmptyDictionary {
    XCTAssertTrue(ASTEmpty(@{}), @"should return YES for an empty dictionary");
}

- (void)testShouldReturnFalseForNonEmptyDictionary {
    XCTAssertFalse(ASTEmpty(@{ @1: @2 }), @"should return NO for a non-empty dictionary");
}

- (void)testShouldReturnTrueForEmptySet {
    XCTAssertTrue(ASTEmpty([NSSet set]), @"should return YES for an empty set");
}

- (void)testShouldReturnFalseForNonEmptySet {
    XCTAssertFalse(ASTEmpty([NSSet setWithObject:@1]), @"should return NO for a non-empty set");
}

- (void)testShouldReturnTrueForEmptyOrderedSet {
    XCTAssertTrue(ASTEmpty([NSOrderedSet orderedSet]), @"should return YES for an empty ordered set");
}

- (void)testShouldReturnFalseForNonEmptyOrderedSet {
    XCTAssertFalse(ASTEmpty([NSOrderedSet orderedSetWithObject:@1]), @"should return NO for a non-empty ordered set");
}

- (void)testShouldReturnTrueForEmptyCollection {
    id<NSFastEnumeration> collection = @[];
    XCTAssertTrue(ASTEmpty(collection), @"should return YES for empty collections");
}

- (void)testShouldReturnFalseForNonEmptyCollection {
    id<NSFastEnumeration> collection = @[ @1 ];
    XCTAssertFalse(ASTEmpty(collection), @"should return NO for non-empty collections");
}

@end
