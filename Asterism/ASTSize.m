//
//  ASTSize.m
//  Asterism
//
//  Created by Robert Böhnke on 07/12/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTSize.h"

OVERLOADABLE NSUInteger ASTSize(NSArray *array) {
    return array.count;
}

OVERLOADABLE NSUInteger ASTSize(NSDictionary *dictionary) {
    return dictionary.count;
}

OVERLOADABLE NSUInteger ASTSize(NSSet *set) {
    return set.count;
}

OVERLOADABLE NSUInteger ASTSize(NSOrderedSet *set) {
    return set.count;
}

OVERLOADABLE NSUInteger ASTSize(id<NSFastEnumeration> collection) {
    NSUInteger size = 0;

    for (id _ in collection) size++;

    return size;
}
