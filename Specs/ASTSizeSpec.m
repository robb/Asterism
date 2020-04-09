//
//  ASTSizeSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 08/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTSizeTests : XCTestCase

@end

@implementation ASTSizeTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return the number of elements" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTSize((NSArray *)nil)), @0);
            XCTAssertEqualObjects(@(ASTSize(@[])), @0);
            XCTAssertEqualObjects(@(ASTSize(@[ @1 ])), @1);
            XCTAssertEqualObjects(@(ASTSize(@[ @1, @2 ])), @2);
        }];
    }];

    [XCTContext runActivityNamed:@"for dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return the number of elements" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTSize((NSDictionary *)nil)), @0);
            XCTAssertEqualObjects(@(ASTSize(@{})), @0);
            XCTAssertEqualObjects(@(ASTSize(@{ @"foo": @1 })), @1);
            XCTAssertEqualObjects(@(ASTSize(@{ @"foo": @1, @"bar": @2 })), @2);
        }];
    }];

    [XCTContext runActivityNamed:@"for sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return the number of elements" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTSize((NSSet *)nil)), @0);
            XCTAssertEqualObjects(@(ASTSize([NSSet set])), @0);
            XCTAssertEqualObjects(@(ASTSize([NSSet setWithObject:@1])), @1);
            XCTAssertEqualObjects(@(ASTSize([NSSet setWithObjects:@1, @2, nil])), @2);
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return the number of elements" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(@(ASTSize((NSOrderedSet *)nil)), @0);
            XCTAssertEqualObjects(@(ASTSize([NSOrderedSet orderedSet])), @0);
            XCTAssertEqualObjects(@(ASTSize([NSOrderedSet orderedSetWithObject:@1])), @1);
            XCTAssertEqualObjects(@(ASTSize([NSOrderedSet orderedSetWithObjects:@1, @2, nil])), @2);
        }];
    }];

    [XCTContext runActivityNamed:@"for objects implementing <NSFastEnumeration>" block:^(id<XCTActivity> _Nonnull activity){
        id<NSFastEnumeration> collection = @[ @1, @2, @3 ];

        XCTAssertEqualObjects(@(ASTSize((id<NSFastEnumeration>)nil)), @0);
        XCTAssertEqualObjects(@(ASTSize(collection)), @3);
    }];
}

@end
