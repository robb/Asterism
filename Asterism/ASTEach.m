//
//  ASTEach.m
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTEach.h"

OVERLOADABLE void ASTEach(NSArray *array, void(^iterator)(id))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(iterator != nil);

    ASTEach((id<NSFastEnumeration>)array, iterator);
}

OVERLOADABLE void ASTEach(NSArray *array, id(^iterator)(id obj))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(iterator != nil);

    ASTEach((id<NSFastEnumeration>)array, iterator);
}

OVERLOADABLE void ASTEach(NSArray *array, void(^iterator)(id, NSUInteger))
{
    NSCParameterAssert(array != nil);
    NSCParameterAssert(iterator != nil);

    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        iterator(obj, idx);
    }];
}

OVERLOADABLE void ASTEach(NSDictionary *dict, void(^iterator)(id obj))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(iterator != nil);

    ASTEach(dict, ^(id key, id obj) {
        iterator(obj);
    });
}

OVERLOADABLE void ASTEach(NSDictionary *dict, id(^iterator)(id obj))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(iterator != nil);

    ASTEach(dict, ^(id key, id obj) {
        iterator(obj);
    });
}

OVERLOADABLE void ASTEach(NSDictionary *dict, void(^iterator)(id key, id obj))
{
    NSCParameterAssert(dict != nil);
    NSCParameterAssert(iterator != nil);

    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        iterator(key, obj);
    }];
}

OVERLOADABLE void ASTEach(NSOrderedSet *set, void(^iterator)(id, NSUInteger))
{
    NSCParameterAssert(set != nil);
    NSCParameterAssert(iterator != nil);

    [set enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        iterator(obj, idx);
    }];
}

OVERLOADABLE void ASTEach(id<NSFastEnumeration> enumerable, void(^iterator)(id obj))
{
    NSCParameterAssert(enumerable != nil);
    NSCParameterAssert(iterator != nil);

    for (id obj in enumerable) {
        iterator(obj);
    }
}

OVERLOADABLE void ASTEach(id<NSFastEnumeration> enumerable, id(^iterator)(id obj))
{
    NSCParameterAssert(enumerable != nil);
    NSCParameterAssert(iterator != nil);

    for (id obj in enumerable) {
        iterator(obj);
    }
}
