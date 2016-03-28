//
//  ASTWithoutTests.m
//  Asterism
//
//  Created by Robert Böhnke on 19/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTWithoutTests : XCTestCase
@end

@implementation ASTWithoutTests

- (void)testShouldRemoveAllObjectsFromArrayThatMatchValue {
    NSArray *before = @[ @1, @2, @3 ];
    NSArray *output = ASTWithout(before, @1);
    NSArray *expected =  @[ @2, @3 ];
    XCTAssertEqualObjects(output,expected, @"should remove all objects that match the value");
}

- (void)testShouldRemoveAllObjectsFromSetThatMatchValue {
    NSSet *before = [NSSet setWithArray:@[ @1, @2, @3 ]];
    NSSet *output = ASTWithout(before, @1);
    NSSet *expected = [NSSet setWithArray:@[ @2, @3 ]];
    XCTAssertEqualObjects(output, expected, @"should remove all objects that match the value");
}

- (void)testShouldRemoveAllObjectsFromOrderedSetThatMatchValue {
    NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
    NSOrderedSet *output = ASTWithout(before, @1);
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:@[ @2, @3 ]];
    XCTAssertEqualObjects(output, expected, @"should remove all objects that match the value");
}

@end
