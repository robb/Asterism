//
//  ASTSortSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 25/03/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTSortTests : XCTestCase

@end

@implementation ASTSortTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"without a comparator" block:^(id<XCTActivity> _Nonnull activity){
            [XCTContext runActivityNamed:@"it should sort the array using -compare:" block:^(id<XCTActivity> _Nonnull activity){
                NSArray *input = @[ @2, @4, @-2, @9 ];
                NSArray *expected = @[ @-2, @2, @4, @9 ];

                XCTAssertEqualObjects(ASTSort(input), expected);
            }];
        }];

        [XCTContext runActivityNamed:@"with a comparator" block:^(id<XCTActivity> _Nonnull activity){
            [XCTContext runActivityNamed:@"it should sort the array using -compare:" block:^(id<XCTActivity> _Nonnull activity){
                NSArray *input = @[ @"AAA", @"B", @"CC", @"DDDD" ];
                NSArray *expected = @[ @"B", @"CC", @"AAA", @"DDDD" ];

                NSComparator sortByLength = ^(NSString *a, NSString *b) {
                    return [@(a.length) compare:@(b.length)];
                };

                XCTAssertEqualObjects(ASTSort(input, sortByLength), expected);
            }];
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"without a comparator" block:^(id<XCTActivity> _Nonnull activity){
            [XCTContext runActivityNamed:@"it should sort the array using -compare:" block:^(id<XCTActivity> _Nonnull activity){
                NSOrderedSet *input = [NSOrderedSet orderedSetWithArray:@[ @2, @4, @-2, @9 ]];
                NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:@[ @-2, @2, @4, @9 ]];

                XCTAssertEqualObjects(ASTSort(input), expected);
            }];
        }];

        [XCTContext runActivityNamed:@"with a comparator" block:^(id<XCTActivity> _Nonnull activity){
            [XCTContext runActivityNamed:@"it should sort the array using -compare:" block:^(id<XCTActivity> _Nonnull activity){
                NSOrderedSet *input = [NSOrderedSet orderedSetWithArray:@[ @"AAA", @"B", @"CC", @"DDDD" ]];
                NSOrderedSet *expected = [NSOrderedSet orderedSetWithArray:@[ @"B", @"CC", @"AAA", @"DDDD" ]];

                NSComparator sortByLength = ^(NSString *a, NSString *b) {
                    return [@(a.length) compare:@(b.length)];
                };

                XCTAssertEqualObjects(ASTSort(input, sortByLength), expected);
            }];
        }];
    }];
}

@end
