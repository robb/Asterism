//
//  ASTFilterTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTFilterTests : XCTestCase
@property (nonatomic,copy) NSArray *arrayBefore;
@property (nonatomic,copy) NSDictionary *dictBefore;
@property (nonatomic,copy) NSSet *setBefore;
@property (nonatomic,copy) NSOrderedSet *orderedSetBefore;
@end

@implementation ASTFilterTests

- (void)setUp {
    [super setUp];
    _arrayBefore = @[ @1, @2, @3 ];;
    _dictBefore = @{
        @"en": @"Hello",
        @"fr": @"Bonjour"
    };
    _setBefore = [NSSet setWithArray:@[ @1, @2, @3 ]];
    _orderedSetBefore = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
}

- (void)testShouldRemoveAllObjectsFromArrayThatFailTest {
    NSArray *after = ASTFilter(_arrayBefore, ^BOOL(NSNumber *obj) {
        return obj.integerValue % 2 == 1;
    });

    XCTAssertEqualObjects(after, (@[ @1, @3 ]), @"should remove all objects that fail the test for arrays");
}

- (void)testShouldOptionallyPassInTheIndexForArray {
    NSArray *after = ASTFilter(_arrayBefore, ^BOOL(NSNumber *obj, NSUInteger idx) {
        return idx < 2;
    });

    XCTAssertEqualObjects(after, (@[ @1, @2 ]), @"should optionally pass in the index for arrays");
}

- (void)testShouldMaintainOrderOfArray {
    NSArray *after = ASTFilter(_arrayBefore, ^BOOL(NSNumber *obj) { return YES; });

    XCTAssertEqualObjects(after, _arrayBefore, @"should maintain order for arrays");
}

- (void)testShouldRemoveAllObjectsFromDictionaryThatFailTest {
    NSDictionary *after = ASTFilter(_dictBefore, ^BOOL(NSString *obj) {
        return [obj isEqualToString:@"Bonjour"];
    });

    XCTAssertEqualObjects(after, (@{ @"fr": @"Bonjour" }), @"should remove all objects that fail the test for dictionaries");
}

- (void)testShouldOptionallyPassInTheKeyForDictionary {
    NSDictionary *after = ASTFilter(_dictBefore, ^BOOL(NSString *key, NSString *obj) {
        return [key isEqualToString:@"fr"];
    });

    XCTAssertEqualObjects(after, (@{ @"fr": @"Bonjour" }), @"should optionally pass in the key for dictionaries");
}

- (void)testShouldRemoveAllObjectsFromSetThatFailTest {
    NSSet *after = ASTFilter(_setBefore, ^BOOL(NSNumber *obj) {
        return obj.integerValue % 2 == 1;
    });

    XCTAssertEqualObjects(after, ([NSSet setWithArray:@[ @1, @3 ]]), @"should remove all objects that fail the test for sets");
}

- (void)testShouldOptionallyPassInTheIndexForOrderdSet {
    NSOrderedSet *after = ASTFilter(_orderedSetBefore, ^BOOL(NSNumber *obj, NSUInteger idx) {
        return idx < 2;
    });

    XCTAssertEqualObjects(after, ([NSOrderedSet orderedSetWithArray:@[ @1, @2 ]]), @"should optionally pass in the index for ordered sets");
}

- (void)testShouldRemoveAllObjectsFromOrderedSetThatFailTest {
    NSOrderedSet *after = ASTFilter(_orderedSetBefore, ^BOOL(NSNumber *obj) {
        return obj.integerValue % 2 == 1;
    });

    XCTAssertEqualObjects(after, ([NSOrderedSet orderedSetWithArray:@[ @1, @3 ]]), @"should remove all objects that fail the test for ordered sets");
}

@end
