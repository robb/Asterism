//
//  ASTMapTests.m
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTMapTests : XCTestCase
@end

@implementation ASTMapTests

- (void)testShouldNotCallTheBlockWhenGivenAnEmptyArray {
    __block NSUInteger calls = 0;

    ASTMap(@[], ^(id obj) {
        return @(calls++);
    });

    XCTAssertEqual(calls, 0,  @"should not call the block when given an empty array");
}

- (void)testShouldReplaceTheObjectsInArrayWithResultOfBlock {
    NSArray *before = @[ @1, @2, @3 ];

    NSArray *after = ASTMap(before, ^(id obj) {
        return [obj description];
    });

    XCTAssertEqualObjects(after, (@[ @"1", @"2", @"3" ]), @"should replace the objects in array with the result of the block");
}

- (void)testShouldRemoveAllElementsFromArrayWhereBlockReturnsNill {
    NSArray *even = ASTMap(@[ @0, @1, @2, @3 ], ^(NSNumber *number) {
        return number.integerValue % 2 == 0 ? number : nil;
    });

    XCTAssertEqualObjects(even, (@[ @0, @2 ]), @"should remove all elements in array for which the block returns nil");
}

- (void)testShouldCallTheBlockOnceForEveryObjectInArray {
    __block NSUInteger calls = 0;

    ASTMap(@[ @0, @1, @2 ], ^(id obj) {
        return @(calls++);
    });

    XCTAssertEqual(calls, 3, @"should call the block once for every object in array");
}

- (void)testShouldOptionallyPassInTheIndexForArray {
    ASTMap(@[ @0, @1, @2 ], ^(id obj, NSUInteger idx) {
        XCTAssertEqualObjects(obj, @(idx), @"should optionally pass in the index for array");

        return @(idx);
    });
}

- (void)testShouldMaintainOrderInArray {
    NSArray *before = @[ @1, @2, @3, @4 ];

    NSArray *after = ASTMap(before, ^(id obj) { return obj; });

    XCTAssertEqualObjects(after, before, @"should maintain order in array");
}

- (void)testShouldNotCallTheBlockWhenGivenAnEmptyDictionary {
    __block NSUInteger calls = 0;

    ASTMap(@{}, ^(id obj) {
        return @(calls++);
    });

    XCTAssertEqual(calls, 0, @"should not call the block when given an empty dictionary");
}

- (void)testShouldReplaceTheValuesOfDictionaryWithResultOfTheBlock {
    NSDictionary *before = @{@"fr": @"Bonjour",
                             @"en": @"Hello"};

    NSDictionary *after = ASTMap(before, ^(NSString *string) {
        return string.uppercaseString;
    });

    NSDictionary *expected = @{@"fr":@"BONJOUR",@"en":@"HELLO"};
    XCTAssertEqualObjects(after, expected, @"should replace the values of dictionary with the result of the block");
}

- (void)testShouldRemoveAllElementsFromDictionaryForWhichTheBlockReturnsNil {
    NSDictionary *before = @{@"fr": @"Bonjour",
                             @"en": @"Hello"};

    NSDictionary *after = ASTMap(before, ^(NSString *string) {
        return [string isEqual:@"Bonjour"] ? string : nil;
    });

    XCTAssertEqualObjects(after, @{@"fr": @"Bonjour"}, @"should remove all elements from dictionary for which the block returns nil");
}

- (void)testShouldCallTheBlockOnceForEveryObjectInDictionary {
    __block NSUInteger calls = 0;

    NSDictionary *dictionary = @{
        @"fr": @"Bonjour",
        @"en": @"Hello"
    };

    ASTMap(dictionary, ^(id obj) {
        return @(calls++);
    });

    XCTAssertEqual(calls, 2, @"should call the block once for every key-value-pair in dictionary");
}

- (void)testShouldOptionallyPassInTheKeyForDictionary {
    ASTMap(@{ @"foo": @"FOO" }, ^(id key, id obj) {
        XCTAssertEqualObjects([key uppercaseString], obj, @"should optionally pass in the key for dictionary");

        return obj;
    });
}

- (void)testShouldNotCallTheBlockWhenGivenAnEmptySet {
    __block NSUInteger calls = 0;

    ASTMap([[NSSet alloc] init], ^(id obj) {
        return @(calls++);
    });

    XCTAssertEqual(calls, 0, @"should not call the block when given an empty set");
}

- (void)testShouldReplaceTheObjectsInSetWithTheResultOfBlock {
    NSSet *before = [NSSet setWithArray:@[ @1, @2, @3 ]];

    NSSet *after = ASTMap(before, ^(id obj) {
        return [obj description];
    });

    NSSet *expected = [NSSet setWithArray:@[@"1", @"2", @"3"]];
    XCTAssertEqualObjects(after, expected, @"should replace the objects in set with the result of the block");
}

- (void)testShouldRemoveAllElementsFromSetForWhichBlockReturnsNil {
    NSSet *numbers = [NSSet setWithArray:@[ @0, @1, @2, @3 ]];

    NSSet *even = ASTMap(numbers, ^(NSNumber *number) {
        return number.integerValue % 2 == 0 ? number : nil;
    });

    XCTAssertEqualObjects(even, ([NSSet setWithArray:@[ @0, @2 ]]), @"should remove all elements from set for which the block returns nil");
}

- (void)testShouldCallTheBlockOnceForEveryObjectInSet {
    __block NSUInteger calls = 0;

    NSSet *set = [NSSet setWithArray:@[ @1, @2, @3 ]];

    ASTMap(set, ^(id obj) {
        return @(calls++);
    });

    XCTAssertEqual(calls, 3, @"should not call the block when given an empty set");
}

- (void)testShouldNotCallBlockWhenGivenAnEmptyOrderedSet {
    __block NSUInteger calls = 0;

    ASTMap([NSOrderedSet orderedSet], ^(id obj) {
        return @(calls++);
    });

    XCTAssertEqual(calls, 0, @"should not call the block when given an empty ordered set");
}

- (void)testShouldReplaceTheObjectsInOrderedSetWithTheResultOfBlock {
    NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

    NSOrderedSet *after = ASTMap(before, ^(id obj) {
        return [obj description];
    });

    XCTAssertEqualObjects(after, ([NSOrderedSet orderedSetWithArray:@[ @"1", @"2", @"3" ]]), @"should replace the objects in ordered set with the result of the block");
}

- (void)testShouldRemoveAllElementsFromOrderedSetForWhichBlockReturnsNil {
    NSOrderedSet *numbers = [NSOrderedSet orderedSetWithArray:@[ @0, @1, @2, @3 ]];

    NSOrderedSet *even = ASTMap(numbers, ^(NSNumber *number) {
        return number.integerValue % 2 == 0 ? number : nil;
    });

    XCTAssertEqualObjects(even, ([NSOrderedSet orderedSetWithArray:@[ @0, @2 ]]), @"should remove all elements from ordered set for which the block returns nil");
}

- (void)testShouldCallTheBlockOnceForEveryObjectInOrderedSet {
    NSOrderedSet *numbers = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
    __block NSUInteger calls = 0;

    ASTMap(numbers, ^(id obj) {
        return @(calls++);
    });

    XCTAssertEqual(calls, 3, @"should call the block once for every object in ordered set");
}

- (void)testShouldOptionallyPassInTheIndexForOrderedSet {
    NSOrderedSet *numbers = [NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]];

    ASTMap(numbers, ^(id obj, NSUInteger idx) {
        XCTAssertEqualObjects(obj, @(idx), @"should optionally pass in the index for ordered set");

        return @(idx);
    });
}

- (void)testShouldMaintainOrderInOrderedSet {
    NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

    NSOrderedSet *after = ASTMap(before, ^(id obj) { return obj; });

    XCTAssertEqualObjects(after, before, @"should maintain order in ordered set");
}

@end
