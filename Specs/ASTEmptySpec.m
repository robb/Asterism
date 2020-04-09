//
//  ASTEmptySpec.m
//  Asterism
//
//  Created by Robert Böhnke on 8/5/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTEmptyTests : XCTestCase

@end

@implementation ASTEmptyTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return YES for an empty array" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertTrue(ASTEmpty(@[]));
        }];

        [XCTContext runActivityNamed:@"should return NO for a non-empty array" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertFalse(ASTEmpty(@[ @1 ]));
        }];
    }];

    [XCTContext runActivityNamed:@"for dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return YES for an empty dictionary" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertTrue(ASTEmpty(@{}));
        }];

        [XCTContext runActivityNamed:@"should return NO for a non-empty dictionary" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertFalse(ASTEmpty(@{ @1: @2 }));
        }];
    }];

    [XCTContext runActivityNamed:@"for sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return YES for an empty set" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertTrue(ASTEmpty([NSSet set]));
        }];

        [XCTContext runActivityNamed:@"should return NO for a non-empty set" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertFalse(ASTEmpty([NSSet setWithObject:@1]));
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return YES for an empty set" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertTrue(ASTEmpty([NSOrderedSet orderedSet]));
        }];

        [XCTContext runActivityNamed:@"should return NO for a non-empty set" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertFalse(ASTEmpty([NSOrderedSet orderedSetWithObject:@1]));
        }];
    }];

    [XCTContext runActivityNamed:@"for objects that implement NSFastEnumeration" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return YES for empty collections" block:^(id<XCTActivity> _Nonnull activity){
            id<NSFastEnumeration> collection = @[];

            XCTAssertTrue(ASTEmpty(collection));
        }];

        [XCTContext runActivityNamed:@"should return NO for non-empty collections" block:^(id<XCTActivity> _Nonnull activity){
            id<NSFastEnumeration> collection = @[ @1 ];

            XCTAssertFalse(ASTEmpty(collection));
        }];
    }];
}

@end
