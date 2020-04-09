//
//  ASTPickSpec.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 2/19/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTPickTests : XCTestCase

@end

@implementation ASTPickTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"should pick only the given keys" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dict = @{ @"foo": @"foo", @"bar": @"bar" };
        NSArray *keys = @[ @"foo" ];

        XCTAssertEqualObjects(ASTPick(dict, keys), @{ @"foo": @"foo" });
    }];
}

@end
