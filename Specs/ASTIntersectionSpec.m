//
//  ASTIntersectionSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTIntersectionTests : XCTestCase

@end

@implementation ASTIntersectionTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return all values present in both arrays" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *result = ASTIntersection(@[ @1, @2, @3 ], @[ @3, @4, @5 ]);

            XCTAssertEqualObjects(result, (@[ @3 ]));
        }];

        [XCTContext runActivityNamed:@"should maintain order" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *result = ASTIntersection(@[ @1, @2, @3 ], @[ @1, @2, @3 ]);

            XCTAssertEqualObjects(result, (@[ @1, @2, @3 ]));
        }];
    }];

    [XCTContext runActivityNamed:@"for sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return all values present in both sets" block:^(id<XCTActivity> _Nonnull activity){
            NSSet *a = [NSSet setWithArray:@[ @1, @2, @3 ]];
            NSSet *b = [NSSet setWithArray:@[ @5, @4, @3 ]];

            NSSet *result = ASTIntersection(a, b);

            XCTAssertEqualObjects(result, ([NSSet setWithArray:@[ @3 ]]));
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return all values present in both sets" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *a = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
            NSOrderedSet *b = [NSOrderedSet orderedSetWithArray:@[ @5, @4, @3 ]];

            NSOrderedSet *result = ASTIntersection(a, b);

            XCTAssertEqualObjects(result, ([NSOrderedSet orderedSetWithArray:@[ @3 ]]));
        }];

        [XCTContext runActivityNamed:@"should should maintain order" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *set = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

            NSOrderedSet *result = ASTIntersection(set, set);

            XCTAssertEqualObjects(result, ([NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]]));
        }];
    }];
}

@end
