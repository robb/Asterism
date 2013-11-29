//
//  ASTIndexOf.m
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTIndexOf.h"

OVERLOADABLE NSUInteger ASTIndexOf(NSArray *array, id obj) {
    return [array indexOfObject:obj];
}

OVERLOADABLE NSUInteger ASTIndexOf(NSOrderedSet *set, id obj) {
    return [set indexOfObject:obj];
}

OVERLOADABLE NSUInteger ASTIndexOf(id<NSFastEnumeration> collection, id obj) {
    if (collection == nil || obj == nil) return NSNotFound;

    NSUInteger index = 0;

    for (id other in collection) {
        if ([obj isEqual:other]) return index;

        index++;
    }

    return NSNotFound;
}
