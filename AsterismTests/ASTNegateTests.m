//
//  ASTNegateTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTNegateTests : XCTestCase
@end

BOOL (^block)(id) = ^BOOL(id obj) {
    return YES;
};

@implementation ASTNegateTests

- (void)testShouldReturnBlock {
    id result = ASTNegate(block);
    XCTAssertNotNil(result, @"should return a block");
}

- (void)testShouldReturnBlockThatReturnsTheOppositeOfOriginalBlock {
    XCTAssertTrue((block(nil)), @"should return a block that returns the opposite of the original block");
    XCTAssertFalse((ASTNegate(block))(nil), @"should return a block that returns the opposite of the original block");
}

@end
