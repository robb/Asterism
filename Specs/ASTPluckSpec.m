//
//  ASTPluckSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTPluckTests : XCTestCase

@end

@implementation ASTPluckTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"should return an array containing the objects' values for the given key path" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *before = @[ @"a", @"ab", @"abc" ];

        XCTAssertEqualObjects(ASTPluck(before, @"length"), (@[ @1, @2, @3 ]));
    }];

    [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *before = @{ @"a": @"a", @"ab": @"ab", @"abc":@"abc" };

        XCTAssertEqualObjects(ASTPluck(before, @"length"), (@{ @"a": @1, @"ab": @2, @"abc":@3 }));
    }];
}

@end
