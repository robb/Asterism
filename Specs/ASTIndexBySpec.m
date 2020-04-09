//
//  ASTIndexBySpec.m
//  Asterism
//
//  Created by Robert Böhnke on 24/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTIndexByTests : XCTestCase

@end

@implementation ASTIndexByTests

- (void)testEverything {
    NSArray *array = @[ @"Hello", @"Bonjour", @"Hej" ];

    [XCTContext runActivityNamed:@"with blocks" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should index elements by the return value" block:^(id<XCTActivity> _Nonnull activity){
            NSDictionary *dictionary = ASTIndexBy(array, ^(NSString *string) {
                return @(string.length);
            });

            XCTAssertEqualObjects(@(dictionary.count), @3);

            XCTAssertTrue([dictionary[@3] containsString:@"Hej"]);
            XCTAssertTrue([dictionary[@5] containsString:@"Hello"]);
            XCTAssertTrue([dictionary[@7] containsString:@"Bonjour"]);
        }];
    }];

    [XCTContext runActivityNamed:@"with keypaths" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should index elements by the return value" block:^(id<XCTActivity> _Nonnull activity){
            NSDictionary *dictionary = ASTIndexBy(array, @"length");

            XCTAssertEqualObjects(@(dictionary.count), @3);

            XCTAssertTrue([dictionary[@3] containsString:@"Hej"]);
            XCTAssertTrue([dictionary[@5] containsString:@"Hello"]);
            XCTAssertTrue([dictionary[@7] containsString:@"Bonjour"]);
        }];
    }];

    [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dict = @{ @"foo": @"Hello" };

        NSDictionary *blockResult = ASTIndexBy(dict, ^(NSString *string) {
            return @(string.length);
        });

        XCTAssertTrue([blockResult[@5] containsString:@"Hello"]);

        NSDictionary *keyPathResult = ASTIndexBy(dict, @"length");

        XCTAssertTrue([keyPathResult[@5] containsString:@"Hello"]);
    }];
}

@end
