//
//  ASTFindSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTFindTests : XCTestCase

@end

@implementation ASTFindTests

- (void)testEverything {
    [XCTContext runActivityNamed:@"for arrays" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"should return the first object that passes the test" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *array = @[ @1, @2, @3, @4, @5, @6 ];

            NSNumber *result = ASTFind(array, ^BOOL (NSNumber *number){
                return number.integerValue % 2 == 0;
            });

            XCTAssertEqualObjects(result, @2);
        }];

        [XCTContext runActivityNamed:@"should return nil if no object passes the test" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *array = @[ @1, @3, @5 ];

            NSNumber *result = ASTFind(array, ^BOOL (NSNumber *number){
                return number.integerValue % 2 == 0;
            });

            XCTAssertNil(result);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the index" block:^(id<XCTActivity> _Nonnull activity){
            NSArray *array = @[ @1, @2, @3, @4, @5, @6 ];

            NSNumber *result = ASTFind(array, ^BOOL (NSNumber *number, NSUInteger index){
                return index == 3;
            });

            XCTAssertEqualObjects(result, @4);
        }];
    }];

    [XCTContext runActivityNamed:@"for dictionaries" block:^(id<XCTActivity> _Nonnull activity){
        NSDictionary *dictionary = @{ @"foo": @"bar", @"baz": @"qux" };

        [XCTContext runActivityNamed:@"should return the first object that passes the test" block:^(id<XCTActivity> _Nonnull activity){
            NSString *result = ASTFind(dictionary, ^BOOL(NSString *string) {
                return [string characterAtIndex:0] == 'b';
            });

            XCTAssertEqualObjects(result, @"bar");
        }];

        [XCTContext runActivityNamed:@"should return nil if no object passes the test" block:^(id<XCTActivity> _Nonnull activity){
            NSString *result = ASTFind(dictionary, ^BOOL (NSString *string){
                return [string characterAtIndex:0] == 'Y';
            });

            XCTAssertNil(result);
        }];

        [XCTContext runActivityNamed:@"should optionally pass in the key" block:^(id<XCTActivity> _Nonnull activity){
            NSString *result = ASTFind(dictionary, ^BOOL (NSString *key, NSString *value){
                return [key characterAtIndex:0] == 'f';
            });

            XCTAssertEqualObjects(result, @"bar");
        }];
    }];

    [XCTContext runActivityNamed:@"for objects implementing <NSFastEnumeration>" block:^(id<XCTActivity> _Nonnull activity){
        id<NSFastEnumeration> collection = @[ @1, @2, @3 ];

        [XCTContext runActivityNamed:@"should return the first object that passes the test" block:^(id<XCTActivity> _Nonnull activity){
            NSString *result = ASTFind(collection, ^BOOL (NSNumber *number){
                return [number integerValue] % 2 == 0;
            });

            XCTAssertEqualObjects(result, @2);
        }];

        [XCTContext runActivityNamed:@"should return nil if no object passes the test" block:^(id<XCTActivity> _Nonnull activity){
            NSString *result = ASTFind(collection, ^BOOL (NSNumber *number){
                return [number integerValue] > 9;
            });

            XCTAssertNil(result);
        }];
    }];
}

@end
