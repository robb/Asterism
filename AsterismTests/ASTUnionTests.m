//
//  ASTUnionTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTUnionTests : XCTestCase
@end

@implementation ASTUnionTests

- (void)testShouldReturnUnionOfArrayObjects {
    NSArray *result = ASTUnion(@[ @1, @2 ], @[ @2, @3, @4 ]);
    XCTAssertEqual(result.count, 4, @"should return a array of unique objects present in both arrays");

    XCTAssertTrue([result containsObject:@1], @"Should contain contents 1");
    XCTAssertTrue([result containsObject:@2], @"Should contain contents 2");
    XCTAssertTrue([result containsObject:@3], @"Should contain contents 3");
    XCTAssertTrue([result containsObject:@4], @"Should contain contents 4");
}

- (void)testShouldMaintainOrderOfArrayUnion {
    NSArray *result = ASTUnion(@[ @2 ], @[ @1 ]);
    XCTAssertEqualObjects(result, (@[ @2, @1 ]), @"should maintain order");
}

- (void)testShouldReturnUnionOfSetObjects {
    NSSet *a = [NSSet setWithArray:@[ @1, @2, @3 ]];
    NSSet *b = [NSSet setWithArray:@[ @5, @4, @3 ]];

    NSSet *result = ASTUnion(a, b);

    XCTAssertEqualObjects(result, ([NSSet setWithArray:@[ @1, @2, @3, @4, @5 ]]), @"should return a set of objects present in both sets");
}

- (void)testShouldReturnUnionOfOrderedSetObjects {
    NSOrderedSet *a = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
    NSOrderedSet *b = [NSOrderedSet orderedSetWithArray:@[ @5, @4, @3 ]];

    NSOrderedSet *result = ASTUnion(a, b);

    XCTAssertEqualObjects(result, ([NSOrderedSet orderedSetWithArray:@[ @1, @2, @3, @5, @4 ]]), @"should return a set of objects present in both sets");
}

@end
