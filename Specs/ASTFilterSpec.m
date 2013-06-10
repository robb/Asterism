//
//  ASTFilterSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTFilter.h"

SpecBegin(ASTFilter)

describe(@"for arrays", ^{
    NSArray *before = @[ @1, @2, @3 ];

    it(@"should remove all objects that fail the test", ^{
        NSArray *after = ASTFilter(before, ^BOOL(NSNumber *obj) {
            return obj.integerValue % 2 == 1;
        });

        expect(after).to.equal((@[ @1, @3 ]));
    });

    it(@"should optionally pass in the index", ^{
        NSArray *after = ASTFilter(before, ^BOOL(NSNumber *obj, NSUInteger idx) {
            return idx < 2;
        });

        expect(after).to.equal((@[ @1, @2 ]));
    });

    it(@"should maintain order", ^{
        NSArray *after = ASTFilter(before, ^BOOL(NSNumber *obj) { return YES; });

        expect(after).to.equal(before);
    });
});

describe(@"for dictionaries", ^{
    NSDictionary *before = @{
        @"en": @"Hello",
        @"fr": @"Bonjour"
    };

    it(@"should remove all objects that fail the test", ^{
        NSDictionary *after = ASTFilter(before, ^BOOL(NSString *obj) {
            return [obj isEqualToString:@"Bonjour"];
        });

        expect(after).to.equal((@{ @"fr": @"Bonjour" }));
    });

    it(@"should optionally pass in the key", ^{
        NSDictionary *after = ASTFilter(before, ^BOOL(NSString *key, NSString *obj) {
            return [key isEqualToString:@"fr"];
        });

        expect(after).to.equal((@{ @"fr": @"Bonjour" }));
    });
});

describe(@"for sets", ^{
    NSSet *before = [NSSet setWithArray:@[ @1, @2, @3 ]];

    it(@"should remove all objects that fail the test", ^{
        NSSet *after = ASTFilter(before, ^BOOL(NSNumber *obj) {
            return obj.integerValue % 2 == 1;
        });

        expect(after).to.equal(([NSSet setWithArray:@[ @1, @3 ]]));
    });
});

SpecEnd
