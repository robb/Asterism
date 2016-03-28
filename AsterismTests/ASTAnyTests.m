//
//  ASTAnyTests.m
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTAnyTests : XCTestCase
@end

BOOL (^isOdd)(NSNumber *) = ^BOOL (NSNumber *number) {
    return number.integerValue % 2 == 1;
};

@implementation ASTAnyTests

- (void)testShouldReturnFalseForEmptyCollections {
    XCTAssertFalse(ASTAny((id<NSFastEnumeration>)nil, ^(id obj){ return NO; }), @"should return NO for empty collections");

    XCTAssertFalse(ASTAny(@[], ^(id obj){ return NO; }), @"should return NO for empty collections");
}

- (void)testShouldReturnTrueIfOneElementPasses {
    NSArray *numbers = @[ @2, @4, @6, @8, @9 ];

    XCTAssertTrue(ASTAny(numbers, isOdd), @"should return YES if one element passes the test");
}

- (void)testShouldReturnFalseIfAllElementsFail {
    NSArray *numbers = @[ @2, @4, @6, @8 ];

    XCTAssertFalse(ASTAny(numbers, isOdd), @"should return NO if all elements fail the test");
}

- (void)testShouldUseTheValuesOfDictionaries {
    NSDictionary *dict = @{ @"foo": @1 };

    XCTAssertTrue(ASTAny(dict, isOdd), @"should use the values of dictionaries");
}

@end
