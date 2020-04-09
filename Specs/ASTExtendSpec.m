//
//  ASTExtendSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTExtendTests : XCTestCase

@end

@implementation ASTExtendTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"should return the union of both dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dict   = @{ @1: @"foo" };
        NSDictionary *source = @{ @2: @"baz" };

        NSDictionary *result = @{
            @1: @"foo",
            @2: @"baz"
        };

        XCTAssertEqualObjects(ASTExtend(dict, source), result);
    }];

    [XCTContext runActivityNamed:@"should prefer values from source over values from dict" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dict   = @{ @1: @"foo" };
        NSDictionary *source = @{ @1: @"bar" };

        XCTAssertEqualObjects(ASTExtend(dict, source), source);
    }];
}

@end
