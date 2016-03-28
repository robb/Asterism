//
//  ASTPluckTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTPluckTests : XCTestCase
@end

@implementation ASTPluckTests

- (void)testShouldReturnArrayContainingObjectValuesForKeyPath {
    NSArray *before = @[ @"a", @"ab", @"abc" ];
    NSArray *result = ASTPluck(before, @"length");
    XCTAssertEqualObjects(result, (@[ @1, @2, @3 ]), @"should return an array containing the objects' values for the given key path: %@", result);
}

- (void)testShouldUseTheValuesOfDictionaries {
    NSDictionary *before = @{ @"a": @"a", @"ab": @"ab", @"abc":@"abc" };
    NSDictionary *result = ASTPluck(before, @"length");
    XCTAssertEqualObjects(result, (@{ @"a": @1, @"ab": @2, @"abc":@3 }), @"should use the values of dictionaries: %@", result);
}

@end
