//
//  ASTFindTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTFindTests : XCTestCase
@property (nonatomic,copy) NSArray *array;
@property (nonatomic,copy) NSDictionary *dictionary;
@property (nonatomic,strong) id<NSFastEnumeration> collection;
@end

@implementation ASTFindTests

- (void)setUp {
    [super setUp];
    _array = @[ @1, @2, @3, @4, @5, @6 ];
    _dictionary = @{ @"foo": @"bar", @"baz": @"qux" };
    _collection = @[ @1, @2, @3 ];
}

- (void)testShouldReturnFirstArrayObjectThatPassesTest {

    NSNumber *result = ASTFind(_array, ^BOOL (NSNumber *number){
        return number.integerValue % 2 == 0;
    });

    XCTAssertEqual(result.intValue, 2, @"should return the first object that passes the test for array");
}

- (void)testShouldReturnNilIfNoArrayObjectPassesTest {
    NSArray *array = @[ @1, @3, @5 ];

    NSNumber *result = ASTFind(array, ^BOOL (NSNumber *number){
        return number.integerValue % 2 == 0;
    });
    XCTAssertNil(result, @"should return nil if no object passes the test for array");
}

- (void)testShouldOptionallyPassInTheIndexForArray {
    NSNumber *result = ASTFind(_array, ^BOOL (NSNumber *number, NSUInteger index){
        return index == 3;
    });

    XCTAssertEqualObjects(result, @4, @"should optionally pass in the index for array: %@", result);
}

- (void)testShouldReturnFirstDictionaryObjectThatPassesTest {
    NSString *result = ASTFind(_dictionary, ^BOOL(NSString *string) {
        return [string characterAtIndex:0] == 'b';
    });
    XCTAssertEqualObjects(result, @"bar", @"should return the first object that passes the test for dictionary: %@", result);
}

- (void)testShouldReturnNilIfNoDictionaryObjectPassesTest {
    NSString *result = ASTFind(_dictionary, ^BOOL (NSString *string){
        return [string characterAtIndex:0] == 'Y';
    });
    XCTAssertNil(result, @"should return nil if no object passes the test for dictionary");
}

- (void)testShouldOptionallyPassKeyForDictionary {
    NSString *result = ASTFind(_dictionary, ^BOOL (NSString *key, NSString *value){
        return [key characterAtIndex:0] == 'f';
    });

    XCTAssertEqualObjects(result, @"bar", @"should optionally pass in the key for dictionary: %@", result);
}

- (void)testShouldReturnFirstCollectionObjectThatPassesTest {
    NSString *result = ASTFind(_collection, ^BOOL (NSNumber *number){
        return [number integerValue] % 2 == 0;
    });

    XCTAssertEqualObjects(result, @(2), @"should return the first object that passes the test for NSFastEnumeration: %@", result);
}

- (void)testShouldReturnNilIfNoCollectionObjectPassesTest {
    NSString *result = ASTFind(_collection, ^BOOL (NSNumber *number){
        return [number integerValue] > 9;
    });
    XCTAssertNil(result, @"should return nil if no object passes the test for NSFastEnumeration");
}

@end
