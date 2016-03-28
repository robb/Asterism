//
//  ASTIntersectionTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTIntersectionTests : XCTestCase
@end

@implementation ASTIntersectionTests

- (void)testShouldReturnIntersectionOfArrays {
    NSArray *result = ASTIntersection(@[ @1, @2, @3 ], @[ @3, @4, @5 ]);
    XCTAssertEqualObjects(result, (@[ @3 ]), @"should return all values present in both arrays: %@", result);
}

- (void)testShouldMaintainOrderOfArray {
    NSArray *result = ASTIntersection(@[ @1, @2, @3 ], @[ @1, @2, @3 ]);
    XCTAssertEqualObjects(result, (@[ @1, @2, @3 ]), @"should maintain order of array intersection: %@", result);
}

- (void)testShouldReturnIntersectionOfSets {
    NSSet *a = [NSSet setWithArray:@[ @1, @2, @3 ]];
    NSSet *b = [NSSet setWithArray:@[ @5, @4, @3 ]];
    NSSet *result = ASTIntersection(a, b);
    XCTAssertEqualObjects(result, ([NSSet setWithArray:@[ @3 ]]), @"should return all values present in both sets: %@", result);
}

- (void)testShouldReturnIntersectionOfOrderedSets {
    NSOrderedSet *a = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
    NSOrderedSet *b = [NSOrderedSet orderedSetWithArray:@[ @5, @4, @3 ]];
    NSOrderedSet *result = ASTIntersection(a, b);
    XCTAssertEqualObjects(result, ([NSOrderedSet orderedSetWithArray:@[ @3 ]]), @"should return all values present in both ordered sets: %@", result);
}

- (void)testShouldMaintainOrderOfOrderedSet {
    NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
    NSOrderedSet *result = ASTIntersection(set, set);
    XCTAssertEqualObjects(result, ([NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]]), @"should should maintain order in ordered set: %@", result);
}

@end
