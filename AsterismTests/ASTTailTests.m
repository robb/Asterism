//
//  ASTTailTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTTailTests : XCTestCase
@end

@implementation ASTTailTests

- (void)testShouldReturnEmptyArrayGivenEmptyArray {
    NSArray *result = ASTTail(@[]);
    XCTAssertEqualObjects(result, @[], @"should return an empty array when given an empty array: %@", result);
}

- (void)testShouldReturnEmptyArrayGivenArrayOfOne {
    NSArray *result = ASTTail(@[ @1 ]);
    XCTAssertEqualObjects(result, @[], @"should return an empty array when given an array with one element: %@", result);
}

- (void)testShouldReturnRemainingArrayElementsAfterFirst {
    NSArray *result = ASTTail(@[ @1, @2, @3 ]);
    XCTAssertEqualObjects(result, (@[ @2, @3 ]), @"should return all array elements after the first element: %@", result);
}

- (void)testShouldReturnEmptyOrderedSetGivenEmptyOrderedSet {
    NSOrderedSet *result = ASTTail([NSOrderedSet orderedSet]);
    XCTAssertEqualObjects(result, [NSOrderedSet orderedSet], @"should return an empty ordered set when given an empty ordered set: %@", result);
}

- (void)testShouldReturnEmptyOrderdSetGivenOrderedSetOfOne {
    NSOrderedSet *result = ASTTail([NSOrderedSet orderedSetWithObject:@1]);
    XCTAssertEqualObjects(result, [NSOrderedSet orderedSet], @"should return an empty ordered set when given an ordered set with one element: %@", result);
}

- (void)testShouldReturnRemainingOrdereddSetElementsAfterFirst {
    NSOrderedSet *result = ASTTail([NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]]);
    XCTAssertEqualObjects(result, ([NSOrderedSet orderedSetWithArray:@[ @2, @3 ]]), @"should return all ordered set elements after the first element: %@", result);
}

@end
