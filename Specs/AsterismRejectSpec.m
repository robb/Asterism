//
//  AsterismRejectSpec.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismReject.h"

SpecBegin(AsterismReject)

describe(@"for arrays", ^{
    NSArray *before = @[ @1, @2, @3 ];

    it(@"should remove all objects that pass the test", ^{
        NSArray *after = reject(before, ^BOOL(NSNumber *obj) {
            return obj.integerValue % 2 == 1;
        });

        expect(after).to.equal((@[ @2 ]));
    });

    it(@"should optionally pass in the index", ^{
        NSArray *after = reject(before, ^BOOL(NSNumber *obj, NSUInteger idx) {
            return idx < 2;
        });

        expect(after).to.equal((@[ @3 ]));
    });

    it(@"should maintain order", ^{
        NSArray *after = reject(before, ^BOOL(NSNumber *obj) { return NO; });

        expect(after).to.equal(before);
    });
});

describe(@"for dictionaries", ^{
    NSDictionary *before = @{
        @"en": @"Hello",
        @"fr": @"Bonjour"
    };

    it(@"should remove all objects that fail the test", ^{
        NSDictionary *after = reject(before, ^BOOL(NSString *obj) {
            return [obj isEqualToString:@"Bonjour"];
        });

        expect(after).to.equal((@{ @"en": @"Hello" }));
    });

    it(@"should optionally pass in the key", ^{
        NSDictionary *after = reject(before, ^BOOL(NSString *key, NSString *obj) {
            return [key isEqualToString:@"fr"];
        });

        expect(after).to.equal((@{ @"en": @"Hello" }));
    });
});

describe(@"for sets", ^{
    NSSet *before = [NSSet setWithArray:@[ @1, @2, @3 ]];

    it(@"should remove all objects that fail the test", ^{
        NSSet *after = reject(before, ^BOOL(NSNumber *obj) {
            return obj.integerValue % 2 == 1;
        });
        
        expect(after).to.equal(([NSSet setWithArray:@[ @2 ]]));
    });
});

SpecEnd
