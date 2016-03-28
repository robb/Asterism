//
//  ASTFlattenTests.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 11/24/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTFlattenTests : XCTestCase
@end

@implementation ASTFlattenTests

- (void)testShouldConcatenateArrayElements {
    NSArray *array = @[ @[ @1 ], @[ @2 ], @[ @3 ] ];
    NSArray *expected = @[ @1, @2, @3 ];
    NSArray *result = ASTFlatten(array);
    XCTAssertEqualObjects(result, expected, @"should concatenate all array elements: %@", result);
}

- (void)testShouldPreserveNonArrayElements {
    NSArray *array = @[ @[ @1, @2 ], @3, @[ @4, @5 ] ];
    NSArray *expected = @[ @1, @2, @3, @4, @5 ];
    NSArray *result = ASTFlatten(array);
    XCTAssertEqualObjects(result, expected, @"should preserve non-array elements: %@", result);
}

- (void)testShouldFlattenOnlyOneLevelOfArray {
    NSArray *array = @[ @[ @1 ], @[ @[ @2, @3 ] ], @[ @4 ] ];
    NSArray *expected = @[ @1, @[ @2, @3 ], @4 ];
    NSArray *result = ASTFlatten(array);
    XCTAssertEqualObjects(result, expected, @"should flatten the array only a single level: %@", result);
}

@end
