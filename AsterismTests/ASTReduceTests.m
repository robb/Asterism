//
//  ASTReduceTests.m
//  Asterism
//
//  Created by Robert Böhnke on 5/26/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTReduceTests : XCTestCase
@end

NSNumber *(^add)(NSNumber *, NSNumber *) = ^(NSNumber *memo, NSNumber *obj) {
    return @(memo.doubleValue + obj.doubleValue);
};

@implementation ASTReduceTests

- (void)testShouldReturnInitialValueWhenReducingEmptyCollection {
    NSString *initial = @"initial";

    id result = ASTReduce(@[], initial, ^id(id memo, id obj) {
        return nil;
    });

    XCTAssertEqualObjects(result, initial, @"should return the initial value when reducing an empty collection: %@", result);
}

- (void)testShouldUseTheInitialReductionValueInFirstIteration {
    id result = ASTReduce(@[ @1, @2, @3 ], @4, add);

    XCTAssertEqualObjects(result, @(10), @"should use the inital value in the first iteration: %@", result);
}

- (void)testShouldUseInitialReductionValueWithRemainingDictionaryValues {
    NSDictionary *dict = @{ @"a": @1, @"b": @2, @"c": @3 };

    NSNumber *result = ASTReduce(dict, @4, add);
    XCTAssertEqualObjects(result, @(10), @"should use the values of dictionaries with initial value: %@", result);

}

- (void)testShouldReturnNilWhenReducingEmptyCollectionWithNoInitialValue {
    id result = ASTReduce(@[], ^id(id memo, id obj) {
        return nil;
    });
    XCTAssertNil(result, @"should return nil when reducing an empty collection without initial value");
}

- (void)testReduceCollectionToOneResultWithNoInitialValue {
    id result = ASTReduce(@[ @1 ], ^id(id memo, id obj) {
        return nil;
    });

    XCTAssertEqualObjects(result, @(1), @"should return the single value of a collection with one member without initial value: %@", result);
}

- (void)testShouldReduceCollectionValuesWithoutInitialValues {
    id result = ASTReduce(@[ @1, @2, @3 ], add);
    XCTAssertEqualObjects(result, @(6), @"should reduce the collection starting from the first value without initial value: %@", result);
}

- (void)testReduceDictionaryToOneResultWithNoInitialValue {
    NSDictionary *dict = @{ @"a": @1, @"b": @2, @"c": @3 };
    NSNumber *result = ASTReduce(dict, add);
    XCTAssertEqualObjects(result, @(6), @"should  use the values of dictionaries without initial value: %@", result);
}

- (void)testShouldReduceArrayInOrder {
    id result = ASTReduce(@[ @"a", @"b", @"c" ], ^(NSString *memo, NSString *obj) {
        return [memo stringByAppendingString:obj];
    });

    XCTAssertEqualObjects(result, @"abc", @"should reduce arrays in order");
}

@end
