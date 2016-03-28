//
//  ASTGroupByTests.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTGroupByTests : XCTestCase
@property (nonatomic,copy) NSArray *array;
@end

@implementation ASTGroupByTests

- (void)setUp {
    [super setUp];
    _array = @[ @"Hello", @"Bonjour", @"Hallo", @"Hej" ];
}

- (void)testShouldReturnDictionaryOfSetsGroupedByBlockValue {
    NSString *message = @"should return a dictionary of sets, grouped by the blocks return value";
    NSDictionary *dictionary = ASTGroupBy(_array, ^(NSString *string) {
        return @(string.length);
    });
    XCTAssertEqual(dictionary.count, 3, @"%@: count is not 3 - (%d)", message, (int)dictionary.count);
    XCTAssertTrue([dictionary[@3] containsObject:@"Hej"], @"%@: key '3' = %@", message, dictionary[@3]);
    XCTAssertTrue([dictionary[@5] containsObject:@"Hello"], @"%@: key '5' = %@", message, dictionary[@5]);
    XCTAssertTrue([dictionary[@5] containsObject:@"Hallo"], @"%@: key '5' = %@", message, dictionary[@5]);
    XCTAssertTrue([dictionary[@7] containsObject:@"Bonjour"], @"%@: key '7' = %@", message, dictionary[@7]);
}

- (void)testShouldRemoveElementsGroupedByNil {
    NSString *message = @"should remove elements that grouped by `nil`";
    NSDictionary *dictionary = ASTGroupBy(@[ @[ @1 ], @[ @2, @3 ], @[] ], ^(NSArray *array) {
        return array.firstObject;
    });

    NSArray *expected1 = @[@1];
    XCTAssertEqual(dictionary.count, 2, @"%@: count is not 2 - (%d)", message, (int)dictionary.count);
    XCTAssertTrue([dictionary[@1] containsObject:expected1], @"%@: key '1' = %@", message, dictionary[@1]);
    NSArray *expected2 = @[@2,@3];
    XCTAssertTrue([dictionary[@2] containsObject:expected2], @"%@: key '2' = %@", message, dictionary[@2]);
}

- (void)testShouldReturnDictionaryOfSetsGroupedByKeyPath {
    NSString *message = @"should return a dictionary of sets, grouped by their value for a key path";
    NSDictionary *dictionary = ASTGroupBy(_array, @"length");

    XCTAssertEqual(dictionary.count, 3, @"%@: count is not 3 - (%d)", message, (int)dictionary.count);
    XCTAssertTrue([dictionary[@3] containsObject:@"Hej"], @"%@: key '3' = %@", message, dictionary[@3]);
    XCTAssertTrue([dictionary[@5] containsObject:@"Hello"], @"%@: key '5' = %@", message, dictionary[@5]);
    XCTAssertTrue([dictionary[@5] containsObject:@"Hallo"], @"%@: key '5' = %@", message, dictionary[@5]);
    XCTAssertTrue([dictionary[@7] containsObject:@"Bonjour"], @"%@: key '7' = %@", message, dictionary[@7]);
}

- (void)testShouldUseTheValuesOfDictionaries {
    NSString *message = @"should use the values of dictionaries";
    NSDictionary *dict = @{ @"foo": @"Hello" };

    NSDictionary *blockResult = ASTGroupBy(dict, ^(NSString *string) {
        return @(string.length);
    });
    XCTAssertTrue([blockResult[@5] containsObject:@"Hello"], @"%@: key '5' = %@", message, blockResult[@5]);

    NSDictionary *keyPathResult = ASTGroupBy(dict, @"length");
    XCTAssertTrue([keyPathResult[@5] containsObject:@"Hello"], @"%@: key '5' = %@", message, keyPathResult[@5]);
}

@end
