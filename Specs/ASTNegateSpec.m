//
//  ASTNegateSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTNegateTests : XCTestCase

@end

@implementation ASTNegateTests

- (void)testEverything {
    BOOL (^block)(id) = ^BOOL(id obj) {
        return YES;
    };

    [XCTContext runActivityNamed:@"should return a block" block:^(id<XCTActivity> _Nonnull activity){
        XCTAssertNotNil(ASTNegate(block));
    }];

    [XCTContext runActivityNamed:@"should return a block that returns the opposite of the original block" block:^(id<XCTActivity> _Nonnull activity){
        XCTAssertTrue(block(nil));
        XCTAssertFalse(ASTNegate(block)(nil));
    }];
}

@end
