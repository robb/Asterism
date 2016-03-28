//
//  ASTIndexOfTests.m
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTIndexOfTests : XCTestCase
@property (nonatomic,copy) NSArray *array;
@property (nonatomic,copy)  NSOrderedSet *set;
@property (nonatomic,copy)  id<NSFastEnumeration> collection;
@end

@implementation ASTIndexOfTests

- (void)setUp {
    [super setUp];
    _array = @[ @1, @2, @3, @2 ];
    _set = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
    _collection = @[ @1, @2, @3, @2 ];
}

- (void)testShouldReturnNotFoundIfNotFoundInArray {
    NSInteger result = ASTIndexOf(_array, nil);
    XCTAssertEqual(result, NSNotFound, @"should return NSNotFound if the element could not be found in array: %d", (int)result);
}

- (void)testShouldReturnIndexWhenFoundInArray {
    XCTAssertEqual(ASTIndexOf(_array, @3), 2, @"should return the index of the element in the array");
}

- (void)testShouldReturnFirstFoundIndexIfMultipleResultsInArray {
    XCTAssertEqual(ASTIndexOf(_array, @1), 0, @"should return the lowest index if multiple elements match in array");
}

- (void)testShouldReturnNotFoundIfNotFoundInOrderedSet {
    NSInteger result = ASTIndexOf(_set, nil);
    XCTAssertEqual(result, NSNotFound, @"should return NSNotFound if the element could not be found in orderd set: %d", (int)result);
}

- (void)testShouldReturnIndexWhenFoundInOrderedSet {
    XCTAssertEqual(ASTIndexOf(_set, @3), 2, @"should return the index of the element in ordered set");
}

- (void)testShouldReturnNotFoundIfNotFoundInCollection {
    NSInteger result = ASTIndexOf(_collection, nil);
    XCTAssertEqual(result, NSNotFound, @"should return NSNotFound if the element could not be found in collection: %d", (int)result);
}

- (void)testShouldReturnIndexWhenFoundInCollection {
    XCTAssertEqual(ASTIndexOf(_collection, @3), 2, @"should return the index of the element in collection");
}

- (void)testShouldReturnFirstFoundIndexIfMultipleResultsInCollection {
    XCTAssertEqual(ASTIndexOf(_collection, @1), 0, @"should return the lowest index if multiple elements match in collection");
}

@end
