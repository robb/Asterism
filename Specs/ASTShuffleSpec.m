//
//  ASTShuffleSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 16/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTShuffleTests : XCTestCase

@end

@implementation ASTShuffleTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should shuffle the array" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *original = @[ @1, @2, @3, @4, @5, @6, @7, @8, @9, @10 ];

            NSArray *shuffled = ASTShuffle(original);

            for (NSNumber *number in original) {
                XCTAssertTrue([shuffled containsObject:number]);
            }

            XCTAssertNotEqual(original, shuffled);
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should shuffle the set" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *original = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3, @4, @5, @6, @7, @8, @9, @10 ]];

            NSOrderedSet *shuffled = ASTShuffle(original);

            for (NSNumber *number in original) {
                XCTAssertTrue([shuffled containsObject:number]);
            }

            XCTAssertNotEqual(original, shuffled);
        }];
    }];
}

@end
