//
//  ASTTailSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTTailTests : XCTestCase

@end

@implementation ASTTailTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return an empty array when given an empty array" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(ASTTail(@[]), @[]);
        }];

        [XCTContext runActivityNamed:@"should return an empty array when given an array with one element" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(ASTTail(@[ @1 ]), @[]);
        }];

        [XCTContext runActivityNamed:@"should return all elements after the first element" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects((ASTTail(@[ @1, @2, @3 ])), (@[ @2, @3 ]));
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return an empty array when given an empty array" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(ASTTail([NSOrderedSet orderedSet]), [NSOrderedSet orderedSet]);
        }];

        [XCTContext runActivityNamed:@"should return an empty array when given an array with one element" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(ASTTail([NSOrderedSet orderedSetWithObject:@1]), [NSOrderedSet orderedSet]);
        }];

        [XCTContext runActivityNamed:@"should return all elements after the first element" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects((ASTTail([NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]])), ([NSOrderedSet orderedSetWithArray:@[ @2, @3 ]]));
        }];
    }];
}

@end
