//
//  ASTRejectSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTRejectTests : XCTestCase

@end

@implementation ASTRejectTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        NSArray *before = @[ @1, @2, @3 ];

        [XCTContext runActivityNamed:@"should remove all objects that pass the test" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *after = ASTReject(before, ^BOOL(NSNumber *obj) {
                return obj.integerValue % 2 == 1;
            });

            XCTAssertEqualObjects(after, (@[ @2 ]));
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the index" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *after = ASTReject(before, ^BOOL(NSNumber *obj, NSUInteger idx) {
                return idx < 2;
            });

            XCTAssertEqualObjects(after, (@[ @3 ]));
        }];

        [XCTContext runActivityNamed:@"should maintain order" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *after = ASTReject(before, ^BOOL(NSNumber *obj) { return NO; });

            XCTAssertEqualObjects(after, before);
        }];
    }];

    [XCTContext runActivityNamed:@"for dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *before = @{
            @"en": @"Hello",
            @"fr": @"Bonjour"
        };

        [XCTContext runActivityNamed:@"should remove all objects that fail the test" block:^(id<XCTActivity> _Nonnull activity){
            NSDictionary *after = ASTReject(before, ^BOOL(NSString *obj) {
                return [obj isEqualToString:@"Bonjour"];
            });

            XCTAssertEqualObjects(after, (@{ @"en": @"Hello" }));
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the key" block:^(id<XCTActivity> _Nonnull activity){
            NSDictionary *after = ASTReject(before, ^BOOL(NSString *key, NSString *obj) {
                return [key isEqualToString:@"fr"];
            });

            XCTAssertEqualObjects(after, (@{ @"en": @"Hello" }));
        }];
    }];

    [XCTContext runActivityNamed:@"for sets" block:^(id<XCTActivity> _Nonnull activity){
        NSSet *before = [NSSet setWithArray:@[ @1, @2, @3 ]];

        [XCTContext runActivityNamed:@"should remove all objects that fail the test" block:^(id<XCTActivity> _Nonnull activity){
            NSSet *after = ASTReject(before, ^BOOL(NSNumber *obj) {
                return obj.integerValue % 2 == 1;
            });

            XCTAssertEqualObjects(after, ([NSSet setWithArray:@[ @2 ]]));
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

        [XCTContext runActivityNamed:@"should remove all objects that pass the test" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *after = ASTReject(before, ^BOOL(NSNumber *obj) {
                return obj.integerValue % 2 == 1;
            });

            XCTAssertEqualObjects(after, [NSOrderedSet orderedSetWithObject:@2]);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the index" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *after = ASTReject(before, ^BOOL(NSNumber *obj, NSUInteger idx) {
                return idx < 2;
            });

            XCTAssertEqualObjects(after, [NSOrderedSet orderedSetWithObject:@3]);
        }];

        [XCTContext runActivityNamed:@"should maintain order" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *after = ASTReject(before, ^BOOL(NSNumber *obj) { return NO; });

            XCTAssertEqualObjects(after, before);
        }];
    }];
}

@end
