//
//  ASTExtendTests.m
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTExtendTests : XCTestCase
@end

@implementation ASTExtendTests

- (void)testShouldReturnUnionOfDictionaries {
    NSDictionary *dict   = @{ @1: @"foo" };
    NSDictionary *source = @{ @2: @"baz" };

    NSDictionary *result = @{@1: @"foo",
                             @2: @"baz"};

    XCTAssertEqualObjects(ASTExtend(dict, source), result, @"should return the union of both dictionaries");
}

- (void)testShouldPreferValuesFromExtensioneOverValuesFromInitial {
    NSDictionary *initial   = @{ @1: @"foo" };
    NSDictionary *extension = @{ @1: @"bar" };

    XCTAssertEqualObjects(ASTExtend(initial, extension), extension, @"should prefer values from extension over values from initial dictionary");
}

@end
