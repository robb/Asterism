//
//  ASTMinMaxTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTMinMaxTests : XCTestCase
@property (nonatomic,copy) NSArray *array;
@property (nonatomic,copy) NSDictionary *dict;
@end

NSComparator comparator = ^NSComparisonResult(id obj1, id obj2) {
    // Reverse the result to make sure the block is actually invoked
    switch ([obj1 compare:obj2]) {
        case NSOrderedAscending:
            return NSOrderedDescending;

        case NSOrderedSame:
            return NSOrderedSame;

        case NSOrderedDescending:
            return NSOrderedAscending;
    }
};

@implementation ASTMinMaxTests

- (void)setUp {
    [super setUp];
    _array = @[ @2, @3, @9, @4, @-1 ];
    _dict = @{ @"foo": @2, @"bar": @9, @"baz": @-1};
}

- (void)testShouldReturnTheMinimumOfArrayWithoutComparator {
    NSNumber *result = ASTMin(_array);
    XCTAssertEqualObjects(result, @(-1), @"should return the minimum by calling compare: without comparator: %@", result);
}

- (void)testShouldReturnTheMinimumOfArrayWithComparator {
    NSNumber *result = ASTMin(_array, comparator);
    XCTAssertEqualObjects(result, @(9), @"should return the minimum with an NSComparisonResult block: %@", result);
}

- (void)testShouldReturnTheMaximumOfArrayWithoutComparator {
    NSNumber *result = ASTMax(_array);
    XCTAssertEqualObjects(result, @9, @"should return the maximum without comparator: %@", result);
}

- (void)testShouldReturnTheMaximumOfArrayWithComparator {
    NSNumber *result = ASTMax(_array, comparator);
    XCTAssertEqualObjects(result, @(-1), @"should return the maximum with an NSComparisonResult block: %@", result);
}

- (void)testShouldReturnTheMinimumOfDictionaryWithoutComparator {
    NSNumber *result = ASTMin(_dict);
    XCTAssertEqualObjects(result, @(-1), @"should use the minimum values of dictionaries without comparator: %@", result);
}

- (void)testShouldReturnTheMinimumOfDictionaryWithComparator {
    NSNumber *result = ASTMin(_dict, comparator);
    XCTAssertEqualObjects(result, @(9), @"should use the minimum values of dictionaries with an NSComparisonResult block: %@", result);
}

- (void)testShouldReturnTheMaximumOfDictionaryWithoutComparator {
    NSNumber *result = ASTMax(_dict);
    XCTAssertEqualObjects(result, @(9), @"should use the maximum values of dictionaries without comparator: %@", result);
}

- (void)testShouldReturnTheMaximumOfDictionaryWithComparator {
    NSNumber *result = ASTMax(_dict, comparator);
    XCTAssertEqualObjects(result, @(-1), @"should use the maximum values of dictionaries with an NSComparisonResult block: %@", result);
}

@end
