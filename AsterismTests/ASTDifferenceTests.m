//
//  ASTDifferenceTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTDifferenceTests : XCTestCase
@end

@implementation ASTDifferenceTests

- (void)testShouldReturnAllValuesFromTheFirstArrayThatAreNotPresentInTheOther {
    NSArray *before = @[ @1, @2, @3, @4 ];
    NSArray *result = ASTDifference(before, @[ @3, @4 ]);
    XCTAssertEqualObjects(result, (@[ @1, @2 ]), @"should return all values from the first array that are not present in the other");
}

- (void)testShouldPeserveTheOrderOfTheFirstArray {
    NSArray *before = @[ @1, @2, @3, @4 ];
    NSArray *result = ASTDifference(before, @[ @2, @4 ]);
    XCTAssertEqualObjects(result, (@[ @1, @3 ]), @"should preserve the order of the first array");
}

- (void)testShouldReturnAllValuesFromTheFirstSetThatAreNotPresentInTheOther {
    NSSet *before = [NSSet setWithArray:@[ @1, @2, @3, @4 ]];
    NSSet *result = ASTDifference(before, [NSSet setWithArray:@[ @3, @4 ]]);
    XCTAssertEqualObjects(result, ([NSSet setWithArray:@[ @1, @2 ]]), @"should return all values from the first set that are not present in the other");
}

- (void)testShouldReturnAllValuesFromTheFirstOrderedSetThatAreNotPresentInTheOther {
    NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3, @4 ]];
    NSOrderedSet *result = ASTDifference(before, [NSOrderedSet orderedSetWithArray:@[ @3, @4 ]]);
    XCTAssertEqualObjects(result, ([NSOrderedSet orderedSetWithArray:@[ @1, @2 ]]), @"should return all values from the first ordered set that are not present in the other");
}

@end
