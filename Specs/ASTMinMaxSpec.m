//
//  ASTMinMaxSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTMinMaxTests : XCTestCase

@end

@implementation ASTMinMaxTests

- (void)testEverything {
    NSArray *array = @[ @2, @3, @9, @4, @-1 ];

    NSDictionary *dict = @{ @"foo": @2, @"bar": @9, @"baz": @-1 };

    NSComparator comparator = ^NSComparisonResult(id obj1, id obj2) {
        // Reverse the result to make sure the block is actually invoked
        switch ([obj1 compare:obj2]) {
            case NSOrderedAscending:
                return NSOrderedDescending;

            case NSOrderedSame:
                return NSOrderedSame;

            case NSOrderedDescending:
                return NSOrderedAscending;
        }
    };

    [XCTContext runActivityNamed:@"ASTMin" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"without a comparator block" block:^(id<XCTActivity> _Nonnull activity){
            [XCTContext runActivityNamed:@"should return the minimum by calling compare:" block:^(id<XCTActivity> _Nonnull activity){
                XCTAssertEqualObjects(ASTMin(array), @(-1));
            }];

            [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
                XCTAssertEqualObjects(ASTMin(dict), @(-1));
            }];
        }];

        [XCTContext runActivityNamed:@"with a block returning an NSComparisonResult" block:^(id<XCTActivity> _Nonnull activity){
            [XCTContext runActivityNamed:@"should return the minimum" block:^(id<XCTActivity> _Nonnull activity){
                XCTAssertEqualObjects(ASTMin(array, comparator), @9);
            }];

            [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
                XCTAssertEqualObjects(ASTMin(dict, comparator), @9);
            }];
        }];
    }];

    [XCTContext runActivityNamed:@"ASTMax" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"without a comparator block" block:^(id<XCTActivity> _Nonnull activity){
            [XCTContext runActivityNamed:@"should return the maximum by calling compare:" block:^(id<XCTActivity> _Nonnull activity){
                XCTAssertEqualObjects(ASTMax(array), @9);
            }];

            [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
                XCTAssertEqualObjects(ASTMax(dict), @9);
            }];
        }];

        [XCTContext runActivityNamed:@"with a block returning an NSComparisonResult" block:^(id<XCTActivity> _Nonnull activity){
            [XCTContext runActivityNamed:@"should return the maximum" block:^(id<XCTActivity> _Nonnull activity){
                XCTAssertEqualObjects(ASTMax(array, comparator), @(-1));
            }];

            [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
                XCTAssertEqualObjects(ASTMax(dict, comparator), @(-1));
            }];
        }];
    }];
}

@end
