//
//  ASTPickTests.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 2/19/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTPickTests : XCTestCase
@end

@implementation ASTPickTests

- (void)testShouldPickOnlyTheGivenKeys {
    NSDictionary *dict = @{ @"foo": @"foo", @"bar": @"bar" };
    NSArray *keys = @[ @"foo" ];
    NSDictionary *result = ASTPick(dict, keys);
    XCTAssertEqualObjects(result, @{ @"foo": @"foo" }, @"should pick only the given keys: %@", result);
}

@end
