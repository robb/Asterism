//
//  ASTEach.m
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTEach.h"

OVERLOADABLE void ASTEach(NSArray *array, void(^iterator)(id)) {
    NSCParameterAssert(iterator != nil);

    ASTEach((id<NSFastEnumeration>)array, iterator);
}

OVERLOADABLE void ASTEach(NSArray *array, void(^iterator)(id, NSUInteger)) {
    NSCParameterAssert(iterator != nil);

    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        iterator(obj, idx);
    }];
}

OVERLOADABLE void ASTEach(NSDictionary *dict, void(^iterator)(id obj)) {
    NSCParameterAssert(iterator != nil);

    ASTEach(dict, ^(id key, id obj) {
        iterator(obj);
    });
}

OVERLOADABLE void ASTEach(NSDictionary *dict, void(^iterator)(id key, id obj)) {
    NSCParameterAssert(iterator != nil);

    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        iterator(key, obj);
    }];
}

OVERLOADABLE void ASTEach(NSOrderedSet *set, void(^iterator)(id, NSUInteger)) {
    NSCParameterAssert(iterator != nil);

    [set enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        iterator(obj, idx);
    }];
}

OVERLOADABLE void ASTEach(id<NSFastEnumeration> enumerable, void(^iterator)(id obj)) {
    NSCParameterAssert(iterator != nil);

    for (id obj in enumerable) {
        iterator(obj);
    }
}
