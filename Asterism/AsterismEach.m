//
//  AsterismEach.m
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismEach.h"

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
