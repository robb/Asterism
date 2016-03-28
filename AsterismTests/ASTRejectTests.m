//
//  ASTRejectTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTRejectTests : XCTestCase
@property (nonatomic,copy) NSArray *arrayBefore;
@property (nonatomic,copy) NSDictionary *dictBefore;
@property (nonatomic,copy) NSSet *setBefore;
@property (nonatomic,copy) NSOrderedSet *orderSetBefore;
@end

@implementation ASTRejectTests

- (void)setUp {
    [super setUp];
    _arrayBefore = @[ @1, @2, @3 ];
    _dictBefore = @{@"en": @"Hello",
                    @"fr": @"Bonjour"};
    _setBefore = [NSSet setWithArray:@[ @1, @2, @3 ]];
    _orderSetBefore = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3]];
}

- (void)testShouldRemoveAllDictionaryObjectsThatPassTest {
    NSArray *after = ASTReject(_arrayBefore, ^BOOL(NSNumber *obj) {
        return obj.integerValue % 2 == 1;
    });

    XCTAssertEqualObjects(after, (@[ @2 ]), @"should remove all objects from array that pass the test: %@", after);
}

- (void)testShouldOptionallyPassInTheIndexForArray {
    NSArray *after = ASTReject(_arrayBefore, ^BOOL(NSNumber *obj, NSUInteger idx) {
        return idx < 2;
    });

    XCTAssertEqualObjects(after, (@[ @3 ]), @"should optionally pass in the index for array: %@", after);
}

- (void)testShouldMaintainOrderOfArray {
    NSArray *after = ASTReject(_arrayBefore, ^BOOL(NSNumber *obj) { return NO; });

    XCTAssertEqualObjects(after, _arrayBefore, @"should maintain order of array: %@", after);
}

- (void)testShouldRemoveAllDictionaryObjectsThatFailTest {
    NSDictionary *after = ASTReject(_dictBefore, ^BOOL(NSString *obj) {
        return [obj isEqualToString:@"Bonjour"];
    });

    XCTAssertEqualObjects(after, (@{ @"en": @"Hello" }), @"should remove all objects from dictionary that fail the test: %@", after);
}

- (void)testShouldOptionallyPassInKeyForDictionary {
    NSDictionary *after = ASTReject(_dictBefore, ^BOOL(NSString *key, NSString *obj) {
        return [key isEqualToString:@"fr"];
    });

    XCTAssertEqualObjects(after, (@{ @"en": @"Hello" }), @"should optionally pass in the key for dictionary: %@", after);
}

- (void)testShouldRemoveAllSetObjectsThatFailTest {
    NSSet *after = ASTReject(_setBefore, ^BOOL(NSNumber *obj) {
        return obj.integerValue % 2 == 1;
    });

    XCTAssertEqualObjects(after, ([NSSet setWithArray:@[ @2 ]]), @"should remove all objects from set that fail the test: %@", after);
}

- (void)testShouldRemoveAllOrderedSetObjectsThatPassTest {
    NSOrderedSet *after = ASTReject(_orderSetBefore, ^BOOL(NSNumber *obj) {
        return obj.integerValue % 2 == 1;
    });

    XCTAssertEqualObjects(after, [NSOrderedSet orderedSetWithObject:@2], @"should remove all objects from ordered set that pass the test: %@", after);
}

- (void)testShouldOptionallyPassInTheIndexForOrderedSet {
    NSOrderedSet *after = ASTReject(_orderSetBefore, ^BOOL(NSNumber *obj, NSUInteger idx) {
        return idx < 2;
    });

    XCTAssertEqualObjects(after, [NSOrderedSet orderedSetWithObject:@3], @"should optionally pass in the index for ordered set: %@", after);
}

- (void)testShouldMaintainOrderOfOrderedSet {
    NSOrderedSet *after = ASTReject(_orderSetBefore, ^BOOL(NSNumber *obj) { return NO; });

    XCTAssertEqualObjects(after, _orderSetBefore, @"should maintain order of ordered set: %@", after);
}

@end
