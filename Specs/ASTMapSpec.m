//
//  ASTMapSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTMapTests : XCTestCase

@end

@implementation ASTMapTests

- (void)testEverything {
    NSString *(^keyValue)(NSString *, id) = ^(NSString *key, id value) {
        return [NSString stringWithFormat:@"%@: %@", key, value];
    };
    
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should not call the block when given an empty array" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTMap(@[], ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @0);
        }];

        [XCTContext runActivityNamed:@"should replace the objects with the result of the block" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *before = @[ @1, @2, @3 ];

            NSArray *after = ASTMap(before, ^(id obj) {
                return [obj description];
            });

            XCTAssertEqualObjects(after, (@[ @"1", @"2", @"3" ]));
        }];

        [XCTContext runActivityNamed:@"should remove all elements for which the block returns nil" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *even = ASTMap(@[ @0, @1, @2, @3 ], ^(NSNumber *number) {
                return number.integerValue % 2 == 0 ? number : nil;
            });

            XCTAssertEqualObjects(even, (@[ @0, @2 ]));
        }];

        [XCTContext runActivityNamed:@"should call the block once for every object" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTMap(@[ @0, @1, @2 ], ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @3);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the index" block:^(id<XCTActivity> _Nonnull activity){
            ASTMap(@[ @0, @1, @2 ], ^(id obj, NSUInteger idx) {
                XCTAssertEqualObjects(obj, @(idx));

                return @(idx);
            });
        }];

        [XCTContext runActivityNamed:@"should maintain order" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *before = @[ @1, @2, @3, @4 ];

            NSArray *after = ASTMap(before, ^(id obj) { return obj; });

            XCTAssertEqualObjects(after, before);
        }];
    }];

    [XCTContext runActivityNamed:@"for dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should not call the block when given an empty dictionary" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTMap(@{}, ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @0);
        }];

        [XCTContext runActivityNamed:@"should replace the values with the result of the block" block:^(id<XCTActivity> _Nonnull activity){
            NSDictionary *before = @{
                @"fr": @"Bonjour",
                @"en": @"Hello"
            };

            NSDictionary *after = ASTMap(before, ^(NSString *string) {
                return string.uppercaseString;
            });

            XCTAssertEqualObjects(after, (@{
                @"fr": @"BONJOUR",
                @"en": @"HELLO"
            }));
        }];

        [XCTContext runActivityNamed:@"should return an array" block:^(id<XCTActivity> _Nonnull activity){
            NSDictionary *before = @{
                @"fr": @"Bonjour",
                @"en": @"Hello"
            };

            NSArray *after = ASTMapPairs(before, ^(id key, id value) {
                return keyValue(key, value);
            });
            after = [after sortedArrayUsingSelector:@selector(compare:)];

            XCTAssertEqualObjects(after, (@[
                @"en: Hello",
                @"fr: Bonjour",
            ]));
        }];

        
        [XCTContext runActivityNamed:@"should remove all elements for which the block returns nil" block:^(id<XCTActivity> _Nonnull activity){
            NSDictionary *before = @{
                @"fr": @"Bonjour",
                @"en": @"Hello"
            };

            NSDictionary *after = ASTMap(before, ^(NSString *string) {
                return [string isEqual:@"Bonjour"] ? string : nil;
            });

            XCTAssertEqualObjects(after, @{
                @"fr": @"Bonjour"
            });
        }];

        [XCTContext runActivityNamed:@"should call the block once for every key-value-pair" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            NSDictionary *dictionary = @{
                @"fr": @"Bonjour",
                @"en": @"Hello"
            };

            ASTMap(dictionary, ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @2);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the key" block:^(id<XCTActivity> _Nonnull activity){
            ASTMap(@{ @"foo": @"FOO" }, ^(id key, id obj) {
                XCTAssertEqualObjects([key uppercaseString], obj);

                return obj;
            });
        }];
    }];

    [XCTContext runActivityNamed:@"for sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should not call the block when given an empty set" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTMap([[NSSet alloc] init], ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @0);
        }];

        [XCTContext runActivityNamed:@"should replace the objects with the result of the block" block:^(id<XCTActivity> _Nonnull activity){
            NSSet *before = [NSSet setWithArray:@[ @1, @2, @3 ]];

            NSSet *after = ASTMap(before, ^(id obj) {
                return [obj description];
            });


            XCTAssertEqualObjects(after, ([NSSet setWithArray:@[
                @"1", @"2", @"3"
            ]]));
        }];

        [XCTContext runActivityNamed:@"should remove all elements for which the block returns nil" block:^(id<XCTActivity> _Nonnull activity){
            NSSet *numbers = [NSSet setWithArray:@[ @0, @1, @2, @3 ]];

            NSSet *even = ASTMap(numbers, ^(NSNumber *number) {
                return number.integerValue % 2 == 0 ? number : nil;
            });

            XCTAssertEqualObjects(even, ([NSSet setWithArray:@[ @0, @2 ]]));
        }];

        [XCTContext runActivityNamed:@"should call the block once for every object" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            NSSet *set = [NSSet setWithArray:@[ @1, @2, @3 ]];

            ASTMap(set, ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @3);
        }];
    }];

    [XCTContext runActivityNamed:@"for ordered sets" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should not call the block when given an empty array" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            ASTMap([NSOrderedSet orderedSet], ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @0);
        }];

        [XCTContext runActivityNamed:@"should replace the objects with the result of the block" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

            NSOrderedSet *after = ASTMap(before, ^(id obj) {
                return [obj description];
            });

            XCTAssertEqualObjects(after, ([NSOrderedSet orderedSetWithArray:@[ @"1", @"2", @"3" ]]));
        }];

        [XCTContext runActivityNamed:@"should remove all elements for which the block returns nil" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *numbers = [NSOrderedSet orderedSetWithArray:@[ @0, @1, @2, @3 ]];

            NSOrderedSet *even = ASTMap(numbers, ^(NSNumber *number) {
                return number.integerValue % 2 == 0 ? number : nil;
            });

            XCTAssertEqualObjects(even, ([NSOrderedSet orderedSetWithArray:@[ @0, @2 ]]));
        }];

        [XCTContext runActivityNamed:@"should call the block once for every object" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *numbers = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];
            __block NSUInteger calls = 0;

            ASTMap(numbers, ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @3);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the index" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *numbers = [NSOrderedSet orderedSetWithArray:@[ @0, @1, @2 ]];

            ASTMap(numbers, ^(id obj, NSUInteger idx) {
                XCTAssertEqualObjects(obj, @(idx));

                return @(idx);
            });
        }];

        [XCTContext runActivityNamed:@"should maintain order" block:^(id<XCTActivity> _Nonnull activity){
            NSOrderedSet *before = [NSOrderedSet orderedSetWithArray:@[ @1, @2, @3 ]];

            NSOrderedSet *after = ASTMap(before, ^(id obj) { return obj; });

            XCTAssertEqualObjects(after, before);
        }];
    }];

    [XCTContext runActivityNamed:@"for objects implementing <NSFastEnumeration>" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should not call the block when given an empty collection" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            id<NSFastEnumeration> enumerable = @[];

            ASTMap(enumerable, ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @0);
        }];

        [XCTContext runActivityNamed:@"should replace the objects with the result of the block" block:^(id<XCTActivity> _Nonnull activity){
            id<NSFastEnumeration> before = @[ @1, @2, @3 ];

            NSArray *after = ASTMap(before, ^(id obj) {
                return [obj description];
            });

            XCTAssertEqualObjects(after, (@[ @"1", @"2", @"3" ]));
        }];

        [XCTContext runActivityNamed:@"should remove all elements for which the block returns nil" block:^(id<XCTActivity> _Nonnull activity){
            id<NSFastEnumeration> before = @[ @0, @1, @2, @3 ];

            NSArray *even = ASTMap(before, ^(NSNumber *number) {
                return number.integerValue % 2 == 0 ? number : nil;
            });

            XCTAssertEqualObjects(even, (@[ @0, @2 ]));
        }];

        [XCTContext runActivityNamed:@"should call the block once for every object" block:^(id<XCTActivity> _Nonnull activity){
            __block NSUInteger calls = 0;

            id<NSFastEnumeration> enumerable = @[ @1, @2, @3 ];

            ASTMap(enumerable, ^(id obj) {
                return @(calls++);
            });

            XCTAssertEqualObjects(@(calls), @3);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the index" block:^(id<XCTActivity> _Nonnull activity){
            id<NSFastEnumeration> enumerable = @[ @0, @1, @2 ];

            ASTMap(enumerable, ^(id obj, NSUInteger idx) {
                XCTAssertEqualObjects(obj, @(idx));

                return @(idx);
            });
        }];

        [XCTContext runActivityNamed:@"should maintain order" block:^(id<XCTActivity> _Nonnull activity){
            id<NSFastEnumeration> before = @[ @1, @2, @3, @4 ];

            NSArray *after = ASTMap(before, ^(id obj) { return obj; });

            XCTAssertEqualObjects(after, before);
        }];
    }];
}

@end
