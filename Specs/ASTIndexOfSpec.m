//
//  ASTIndexOfSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTIndexOfTests : XCTestCase

@end

@implementation ASTIndexOfTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *array = @[ @1, @2, @3, @2 ];

        [XCTContext runActivityNamed:@"should return NSNotFound if the element could not be found" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTIndexOf(array, nil)), @(NSNotFound));
        }];

        [XCTContext runActivityNamed:@"should return the index of the element in the array" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTIndexOf(array, @3)), @2);
        }];

        [XCTContext runActivityNamed:@"should return the lowest index if multiple elements match" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTIndexOf(array, @1)), @0);
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

        [XCTContext runActivityNamed:@"should return NSNotFound if the element could not be found" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTIndexOf(set, nil)), @(NSNotFound));
        }];

        [XCTContext runActivityNamed:@"should return the index of the element in the array" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTIndexOf(set, @3)), @2);
        }];
    }];

    [XCTContext runActivityNamed:@"for objects implementing <NSFastEnumeration>" block:^(id<XCTActivity> _Nonnull activity){
        id<NSFastEnumeration> collection = @[ @1, @2, @3, @2 ];

        [XCTContext runActivityNamed:@"should return NSNotFound if the element could not be found" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTIndexOf(collection, nil)), @(NSNotFound));
        }];

        [XCTContext runActivityNamed:@"should return the index of the element in the array" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTIndexOf(collection, @3)), @2);
        }];

        [XCTContext runActivityNamed:@"should return the lowest index if multiple elements match" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTIndexOf(collection, @1)), @0);
        }];
    }];
}

@end
