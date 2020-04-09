//
//  ASTHeadSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTHeadTests : XCTestCase

@end

@implementation ASTHeadTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return nil if the array is empty" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertNil(ASTHead(@[]));
        }];

        [XCTContext runActivityNamed:@"should return the first element" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(ASTHead(@[ @1, @2 ]), @1);
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return nil if the set is empty" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertNil(ASTHead([NSOrderedSet orderedSet]));
        }];

        [XCTContext runActivityNamed:@"should return the first element" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(ASTHead([NSOrderedSet orderedSetWithArray:@[ @1, @2 ]]), @1);
        }];
    }];
}

@end
