//
//  ASTMinMax.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTReduce.h"

#import "ASTMinMax.h"

#pragma mark - Helpers

static NSComparator const ASTCompare = ^NSComparisonResult(id a, id b) {
    return [a compare:b];
};

#pragma mark - Min

OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection) {
    return ASTMin(collection, ASTCompare);
}

OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection, NSComparator comparator) {
    NSCParameterAssert(comparator != nil);

    return ASTReduce(collection, ^id(id a, id b) {
        return comparator(a, b) == NSOrderedAscending ? a : b;
    });
}

#pragma mark - Max

OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection) {
    return ASTMax(collection, ASTCompare);
}

OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection, NSComparator comparator) {
    NSCParameterAssert(comparator != nil);

    return ASTReduce(collection, ^id(id a, id b) {
        return comparator(a, b) == NSOrderedDescending ? a : b;
    });
}
