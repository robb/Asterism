//
//  ASTWithoutSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 19/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTWithoutTests : XCTestCase

@end

@implementation ASTWithoutTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *before = @[ @1, @2, @3 ];

        [XCTContext runActivityNamed:@"should remove all objects that match the value" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(ASTWithout(before, @1), (@[ @2, @3 ]));
        }];
    }];

    [XCTContext runActivityNamed:@"for sets" block:^(id<XCTActivity> _Nonnull activity){
        NSSet *before = [NSSet setWithArray:@[ @1, @2, @3 ]];

        [XCTContext runActivityNamed:@"should remove all objects that match the value" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(ASTWithout(before, @1), ([NSSet setWithArray:@[ @2, @3 ]]));
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

        [XCTContext runActivityNamed:@"should remove all objects that match the value" block:^(id<XCTActivity> _Nonnull activity){
            XCTAssertEqualObjects(ASTWithout(before, @1), ([NSOrderedSet orderedSetWithArray:@[ @2, @3 ]]));
        }];
    }];
}

@end
