//
//  ASTUnionSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTUnionTests : XCTestCase

@end

@implementation ASTUnionTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return a array of unique objects present in both arrays" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *result = ASTUnion(@[ @1, @2 ], @[ @2, @3, @4 ]);

            XCTAssertEqualObjects(@(result.count), @4);

            XCTAssertTrue([result containsObject:@1]);
            XCTAssertTrue([result containsObject:@2]);
            XCTAssertTrue([result containsObject:@3]);
            XCTAssertTrue([result containsObject:@4]);
        }];

        [XCTContext runActivityNamed:@"should maintain order" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *result = ASTUnion(@[ @2 ], @[ @1 ]);

            XCTAssertEqualObjects(result, (@[ @2, @1 ]));
        }];
    }];

    [XCTContext runActivityNamed:@"for sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return a set of objects present in both sets" block:^(id<XCTActivity> _Nonnull activity){
            NSSet *a = [NSSet setWithArray:@[ @1, @2, @3 ]];
            NSSet *b = [NSSet setWithArray:@[ @5, @4, @3 ]];

            NSSet *result = ASTUnion(a, b);

            XCTAssertEqualObjects(result, ([NSSet setWithArray:@[ @1, @2, @3, @4, @5 ]]));
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return an ordered of unique objects present in both sets" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *a = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
            NSOrderedSet *b = [NSOrderedSet orderedSetWithArray:@[ @5, @4, @3 ]];

            NSOrderedSet *result = ASTUnion(a, b);

            XCTAssertEqualObjects(result, ([NSOrderedSet orderedSetWithArray:@[ @1, @2, @3, @5, @4 ]]));
        }];
    }];
}

@end
