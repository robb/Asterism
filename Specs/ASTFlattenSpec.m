//
//  ASTFlattenSpec.m
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 11/24/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTFlattenTests : XCTestCase

@end

@implementation ASTFlattenTests
- (void)testEverything {

    [XCTContext runActivityNamed:@"should concatenate all array elements" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *array = @[ @[ @1 ], @[ @2 ], @[ @3 ] ];
        NSArray *result = @[ @1, @2, @3 ];

        XCTAssertEqualObjects(ASTFlatten(array), result);
    }];

    [XCTContext runActivityNamed:@"should preserve non-array elements" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *array = @[ @[ @1, @2 ], @3, @[ @4, @5 ] ];
        NSArray *result = @[ @1, @2, @3, @4, @5 ];

        XCTAssertEqualObjects(ASTFlatten(array), result);
    }];

    [XCTContext runActivityNamed:@"should flatten the array only a single level" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *array = @[ @[ @1 ], @[ @[ @2, @3 ] ], @[ @4 ] ];
        NSArray *result = @[ @1, @[ @2, @3 ], @4 ];

        XCTAssertEqualObjects(ASTFlatten(array), result);
    }];
}

@end
