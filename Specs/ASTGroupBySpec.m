//
//  ASTGroupBySpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTGroupByTests : XCTestCase

@end

@implementation ASTGroupByTests

- (void)testEverything {
    NSArray *array = @[ @"Hello", @"Bonjour", @"Hallo", @"Hej" ];

    [XCTContext runActivityNamed:@"should return a dictionary of sets, grouped by the blocks return value" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dictionary = ASTGroupBy(array, ^(NSString *string) {
            return @(string.length);
        });

        XCTAssertEqualObjects(@(dictionary.count), @3);

        XCTAssertTrue([dictionary[@3] containsObject:@"Hej"]);
        XCTAssertTrue([dictionary[@5] containsObject:@"Hello"]);
        XCTAssertTrue([dictionary[@5] containsObject:@"Hallo"]);
        XCTAssertTrue([dictionary[@7] containsObject:@"Bonjour"]);
    }];

    [XCTContext runActivityNamed:@"should remove elements that grouped by `nil`" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dictionary = ASTGroupBy(@[ @[ @1 ], @[ @2, @3 ], @[] ], ^(NSArray *array) {
            return array.firstObject;
        });

        XCTAssertEqualObjects(@(dictionary.count), @2);

        XCTAssertTrue([dictionary[@1] containsObject:@[ @1 ]]);
        XCTAssertTrue([dictionary[@2] containsObject:( @[ @2, @3 ] )]);
    }];

    [XCTContext runActivityNamed:@"should return a dictionary of sets, grouped by their value for a key path" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dictionary = ASTGroupBy(array, @"length");

        XCTAssertEqualObjects(@(dictionary.count), @3);

        XCTAssertTrue([dictionary[@3] containsObject:@"Hej"]);
        XCTAssertTrue([dictionary[@5] containsObject:@"Hello"]);
        XCTAssertTrue([dictionary[@5] containsObject:@"Hallo"]);
        XCTAssertTrue([dictionary[@7] containsObject:@"Bonjour"]);
    }];

    [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dict = @{ @"foo": @"Hello" };

        NSDictionary *blockResult = ASTGroupBy(dict, ^(NSString *string) {
            return @(string.length);
        });

        XCTAssertTrue([blockResult[@5] containsObject:@"Hello"]);

        NSDictionary *keyPathResult = ASTGroupBy(dict, @"length");

        XCTAssertTrue([keyPathResult[@5] containsObject:@"Hello"]);
    }];
}

@end
