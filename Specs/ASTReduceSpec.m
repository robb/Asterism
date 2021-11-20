//
//  ASTReduceSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 5/26/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Asterism/Asterism.h>

@interface ASTReduceTests : XCTestCase

@end

@implementation ASTReduceTests

- (void)testEverything {
    NSNumber *(^add)(NSNumber *, NSNumber *) = ^(NSNumber *memo, NSNumber *obj) {
        return @(memo.doubleValue + obj.doubleValue);
    };

    NSString *(^keyValue)(NSString *, id) = ^(NSString *key, id value) {
        return [NSString stringWithFormat:@"%@: %@", key, value];
    };
    
    [XCTContext runActivityNamed:@"reduce" block:^(id<XCTActivity> _Nonnull activity){
        [XCTContext runActivityNamed:@"for objects implementing <NSFastEnumeration>" block:^(id<XCTActivity> _Nonnull activity){
            [XCTContext runActivityNamed:@"when given an intial value" block:^(id<XCTActivity> _Nonnull activity){
                [XCTContext runActivityNamed:@"should return the initial value when reducing an empty collection" block:^(id<XCTActivity> _Nonnull activity){
                    NSString *initial = @"initial";

                    id result = ASTReduce(@[], initial, ^id(id memo, id obj) {
                        return nil;
                    });

                    XCTAssertEqualObjects(result, initial);
                }];

                [XCTContext runActivityNamed:@"should use the inital value in the first iteration" block:^(id<XCTActivity> _Nonnull activity){
                    id result = ASTReduce(@[ @1, @2, @3 ], @4, add);

                    XCTAssertEqualObjects(result, @10);
                }];

                [XCTContext runActivityNamed:@"should  use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
                    NSDictionary *dict = @{ @"a": @1, @"b": @2, @"c": @3 };

                    XCTAssertEqualObjects(ASTReduce(dict, @4, add), @10);
                }];
            }];

            [XCTContext runActivityNamed:@"without an inital value" block:^(id<XCTActivity> _Nonnull activity){
                [XCTContext runActivityNamed:@"should return nil when reducing an empty collection" block:^(id<XCTActivity> _Nonnull activity){
                    id result = ASTReduce(@[], ^id(id memo, id obj) {
                        return nil;
                    });

                    XCTAssertNil(result);
                }];

                [XCTContext runActivityNamed:@"should return the single value of a collection with one member" block:^(id<XCTActivity> _Nonnull activity){
                    id result = ASTReduce(@[ @1 ], ^id(id memo, id obj) {
                        return nil;
                    });

                    XCTAssertEqualObjects(result, @1);
                }];

                [XCTContext runActivityNamed:@"should reduce the collection starting from the first value" block:^(id<XCTActivity> _Nonnull activity){
                    id result = ASTReduce(@[ @1, @2, @3 ], add);

                    XCTAssertEqualObjects(result, @6);
                }];

                [XCTContext runActivityNamed:@"should use the values of dictionaries" block:^(id<XCTActivity> _Nonnull activity){
                    NSDictionary *dict = @{ @"a": @1, @"b": @2, @"c": @3 };

                    XCTAssertEqualObjects(ASTReduce(dict, add), @6);
                }];
            }];

            [XCTContext runActivityNamed:@"should reduce arrays in order" block:^(id<XCTActivity> _Nonnull activity){
                id result = ASTReduce(@[ @"a", @"b", @"c" ], ^(NSString *memo, NSString *obj) {
                    return [memo stringByAppendingString:obj];
                });

                XCTAssertEqualObjects(result, @"abc");
            }];
        }];
        
        [XCTContext runActivityNamed:@"for dictionaries" block:^(id<XCTActivity> _Nonnull activity) {
            [XCTContext runActivityNamed:@"should be able to reduce key value pairs in dictionary" block:^(id<XCTActivity> _Nonnull activity){
                NSDictionary *dict = @{ @"a": @1, @"b": @2, @"c": @3 };
                
                NSArray *result = ASTReduce(dict, [NSMutableArray new], ^(NSMutableArray *memo, id key, id value) {
                    [memo addObject:keyValue(key,value)];
                    return memo;
                });
                result = [result sortedArrayUsingSelector:@selector(compare:)];
                XCTAssertEqualObjects(result, (@[@"a: 1", @"b: 2", @"c: 3"]));
            }];
        }];
    }];
}

@end
