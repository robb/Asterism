//
//  ASTShuffleTests.m
//  Asterism
//
//  Created by Robert Böhnke on 16/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Asterism/Asterism.h>

@interface ASTShuffleTests : XCTestCase
@end

@implementation ASTShuffleTests

- (void)testShouldShuffleTheArray {
    NSArray *original = @[ @1, @2, @3, @4, @5, @6, @7, @8, @9, @10 ];
    NSArray *shuffled = ASTShuffle(original);

    for (NSNumber *number in original) {
        XCTAssertTrue([shuffled containsObject:number], @"should contain %@", number);
    }

    XCTAssertNotEqualObjects(shuffled, original, @"should shuffle the array: %@", shuffled);
}

- (void)testShouldShuffleTheOrderedSet {
    NSOrderedSet *original = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3, @4, @5, @6, @7, @8, @9, @10 ]];
    NSOrderedSet *shuffled = ASTShuffle(original);

    for (NSNumber *number in original) {
        XCTAssertTrue([shuffled containsObject:number], @"should contain %@", number);
    }

    XCTAssertNotEqualObjects(shuffled, original, @"should shuffle the ordered set: %@", shuffled);
}

@end
