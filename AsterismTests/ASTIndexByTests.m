//
//  ASTIndexByTests.m
//  Asterism
//
//  Created by Robert Böhnke on 24/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTIndexByTests : XCTestCase
@property (nonatomic,copy) NSArray *array;
@end

@implementation ASTIndexByTests

- (void)setUp {
    [super setUp];
    _array = @[ @"Hello", @"Bonjour", @"Hej" ];
}

- (void)testShouldIndexElementsByTheReturnValueWithUsingBlocks {
    NSString *message = @"should index elements by the return value";
    NSDictionary *dictionary = ASTIndexBy(_array, ^(NSString *string) {
        return @(string.length);
    });

    XCTAssertEqual(dictionary.count, 3, @"%@: count is not 3 - (%d)", message, (int)dictionary.count);
    XCTAssertEqualObjects(dictionary[@3], @"Hej", @"%@: key '3' = %@", message, dictionary[@3]);
    XCTAssertEqualObjects(dictionary[@5], @"Hello", @"%@: key '5' = %@", message, dictionary[@5]);
    XCTAssertEqualObjects(dictionary[@7], @"Bonjour", @"%@: key '7' = %@", message, dictionary[@7]);
}

- (void)testShouldIndexElementsByTheReturnValueWithUsingKeyPath {
    NSString *message = @"should index elements by the return value";
    NSDictionary *dictionary = ASTIndexBy(_array, @"length");

    XCTAssertEqual(dictionary.count, 3, @"%@: count is not 3 - (%d)", message, (int)dictionary.count);
    XCTAssertEqualObjects(dictionary[@3], @"Hej", @"%@: key '3' = %@", message, dictionary[@3]);
    XCTAssertEqualObjects(dictionary[@5], @"Hello", @"%@: key '5' = %@", message, dictionary[@5]);
    XCTAssertEqualObjects(dictionary[@7], @"Bonjour", @"%@: key '7' = %@", message, dictionary[@7]);
}

- (void)testShouldUseTheValuesOfDictionaries {
    NSString *message = @"should use the values of dictionaries";
    NSDictionary *dict = @{ @"foo": @"Hello" };

    NSDictionary *blockResult = ASTIndexBy(dict, ^(NSString *string) {
        return @(string.length);
    });
    XCTAssertEqualObjects(blockResult[@5], @"Hello", @"%@: key '5' = %@", message, blockResult[@5]);

    NSDictionary *keyPathResult = ASTIndexBy(dict, @"length");
    XCTAssertEqualObjects(keyPathResult[@5], @"Hello", @"%@: key '5' = %@", message, keyPathResult[@5]);
}

@end
