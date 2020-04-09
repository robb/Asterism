//
//  ASTAnySpec.m
//  Asterism
//
//  Created by Robert Böhnke on 01/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

BOOL (^isOdd)(NSNumber *) = ^BOOL (NSNumber *number) {
    return number.integerValue % 2 == 1;
};

@interface ASTAnyTests : XCTestCase

@end

@implementation ASTAnyTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"should return NO for empty collections" block:^(id<XCTActivity> _Nonnull activity){
        XCTAssertFalse(ASTAny((id<NSFastEnumeration>)nil, ^(id obj){ return NO; }));

        XCTAssertFalse(ASTAny(@[], ^(id obj){ return NO; }));
    }];

    [XCTContext runActivityNamed:@"should return YES if one element passes the test" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *numbers = @[ @2, @4, @6, @8, @9 ];

        XCTAssertTrue(ASTAny(numbers, isOdd));
    }];

    [XCTContext runActivityNamed:@"should return NO if all elements fail the test" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *numbers = @[ @2, @4, @6, @8 ];

        XCTAssertFalse(ASTAny(numbers, isOdd));
    }];

    [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dict = @{ @"foo": @1 };

        XCTAssertTrue(ASTAny(dict, isOdd));
    }];
}

@end
