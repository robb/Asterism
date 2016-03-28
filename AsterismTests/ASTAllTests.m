//
//  ASTAllTests.m
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTAllTests : XCTestCase
@end

BOOL (^isEven)(NSNumber *) = ^BOOL (NSNumber *number) {
    return number.integerValue % 2 == 0;
};

@implementation ASTAllTests

- (void)testShouldReturnFalseForEmptyCollections {
    XCTAssertFalse(ASTAll((id<NSFastEnumeration>)nil, ^(id obj){ return NO; }), @"should return NO for empty collections");

    XCTAssertFalse(ASTAll(@[], ^(id obj){ return NO; }), @"should return NO for empty collections");
}

- (void)testShouldReturnTrueIfAllElementPass {
    NSArray *numbers = @[ @2, @4, @6, @8 ];

    XCTAssertTrue(ASTAll(numbers, isEven), @"should return YES if all elements pass the test");
}

- (void)testShouldReturnFalseIfOneElementFails {
    NSArray *numbers = @[ @2, @4, @6, @8, @9 ];

    XCTAssertFalse(ASTAll(numbers, isEven), @"should return NO if one element fails the test");
}

- (void)testShouldUseTheValuesOfDictionaries {
    NSDictionary *dict = @{ @"foo": @2 };

    XCTAssertTrue(ASTAll(dict, isEven), @"should use the values of dictionaries");
}

@end
