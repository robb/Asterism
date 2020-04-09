//
//  ASTAllSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTAllTests : XCTestCase

@end

@implementation ASTAllTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"should return NO for empty collections" block:^(id<XCTActivity> _Nonnull activity){
        XCTAssertFalse(ASTAll((id<NSFastEnumeration>)nil, ^(id obj){ return NO; }));

        XCTAssertFalse(ASTAll(@[], ^(id obj){ return NO; }));
    }];

    BOOL (^isEven)(NSNumber *) = ^BOOL (NSNumber *number) {
        return number.integerValue % 2 == 0;
    };

    [XCTContext runActivityNamed:@"should return YES if all elements pass the test" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *numbers = @[ @2, @4, @6, @8 ];

        XCTAssertTrue(ASTAll(numbers, isEven));
    }];

    [XCTContext runActivityNamed:@"should return NO if one element fails the test" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *numbers = @[ @2, @4, @6, @8, @9 ];

        XCTAssertFalse(ASTAll(numbers, isEven));
    }];

    [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dict = @{ @"foo": @2 };

        XCTAssertTrue(ASTAll(dict, isEven));
    }];
}

@end
