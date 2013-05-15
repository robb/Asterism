//
//  AsterismEach.m
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismEach.h"

#pragma mark - Arrays

OVERLOADABLE void each(NSArray *array, void(^iterator)(id))
{
    each(array, ^(id obj, NSUInteger idx) {
        iterator(obj);
    });
}

OVERLOADABLE void each(NSArray *array, void(^iterator)(id, NSUInteger))
{
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        iterator(obj, idx);
    }];
}

#pragma mark - Dictionaries

OVERLOADABLE void each(NSDictionary *dict, void(^iterator)(id obj))
{
    each(dict, ^(id key, id obj) {
        iterator(obj);
    });
}

OVERLOADABLE void each(NSDictionary *dict, void(^iterator)(id key, id obj))
{
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        iterator(key, obj);
    }];
}

#pragma mark - Sets

OVERLOADABLE void each(NSSet *set, void(^iterator)(id obj))
{
    [set enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        iterator(obj);
    }];
}

#pragma mark - NSFastEnumeration

OVERLOADABLE void each(id<NSFastEnumeration> enumerable, void(^iterator)(id obj))
{
    for (id obj in enumerable) {
        iterator(obj);
    }
}
