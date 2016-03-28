//
//  ASTHeadTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTHeadTests : XCTestCase
@end

@implementation ASTHeadTests

- (void)testShouldReturnNilForEmptyArray {
    XCTAssertNil(ASTHead(@[]), @"should return nil if the array is empty");
}

- (void)testShouldReturnFirstElementOfArray {
    NSNumber *output = ASTHead(@[ @1, @2 ]);
    XCTAssertEqualObjects(output, @1, @"should return the first element of the array: %@", output);
}

- (void)testShouldReturnNilForEmptyOrderedSet {
    XCTAssertNil(ASTHead([NSOrderedSet orderedSet]), @"should return nil if the ordered set is empty");
}

- (void)testShouldReturnFirstElementOfOrderedSet {
    NSNumber *output = ASTHead([NSOrderedSet orderedSetWithArray:@[ @1, @2 ]]);
    XCTAssertEqualObjects(output, @1, @"should return the first element of the ordered set: %@", output);
}

@end