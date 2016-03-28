//
//  ASTSortTests.m
//  Asterism
//
//  Created by Robert Böhnke on 25/03/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTSortTests : XCTestCase
@end

@implementation ASTSortTests

- (void)testShouldSortTheArrayWithoutCustomComparator {
    NSArray *input = @[ @2, @4, @-2, @9 ];
    NSArray *expected = @[ @-2, @2, @4, @9 ];
    NSArray *result = ASTSort(input);
    XCTAssertEqualObjects(result, expected, @"should sort the array without custom comparator: %@", result);
}

- (void)testShouldSortTheArrayWithCustomComparator {
    NSArray *input = @[ @"AAA", @"B", @"CC", @"DDDD" ];
    NSArray *expected = @[ @"B", @"CC", @"AAA", @"DDDD" ];

    NSComparator sortByLength = ^(NSString *a, NSString *b) {
        return [@(a.length) compare:@(b.length)];
    };
    NSArray *result = ASTSort(input, sortByLength);
    XCTAssertEqualObjects(result, expected, @"should sort the array with custom comparator: %@", result);
}

- (void)testShouldSortTheOrderedSetWithoutCustomComparator {
    NSOrderedSet *input = [NSOrderedSet orderedSetWithArray:@[ @2, @4, @-2, @9 ]];
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:@[ @-2, @2, @4, @9 ]];
    NSOrderedSet *result = ASTSort(input);
    XCTAssertEqualObjects(result, expected, @"should sort the ordered set without custom comparator: %@", result);
}

- (void)testShouldSortTheOrderedSetWithCustomComparator {
    NSOrderedSet *input = [NSOrderedSet orderedSetWithArray:@[ @"AAA", @"B", @"CC", @"DDDD" ]];
    NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:@[ @"B", @"CC", @"AAA", @"DDDD" ]];

    NSComparator sortByLength = ^(NSString *a, NSString *b) {
        return [@(a.length) compare:@(b.length)];
    };
    NSOrderedSet *result = ASTSort(input, sortByLength);
    XCTAssertEqualObjects(result, expected, @"should sort the array with custom comparator: %@", result);
}

@end
