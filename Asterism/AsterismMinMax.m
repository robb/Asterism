//
//  AsterismMinMax.m
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismReduce.h"

#import "AsterismMinMax.h"

#pragma mark - Helpers

static NSComparator const compare = ^NSComparisonResult(id a, id b) {
    return [a compare:b];
};

static NSComparator unboxComparator(NSNumber *(^comparator)(id, id))
{
    return ^NSComparisonResult(id obj1, id obj2) {
        NSNumber *result = comparator(obj1, obj2);

        if (result.integerValue < 0) return NSOrderedAscending;
        if (result.integerValue > 0) return NSOrderedDescending;

        return NSOrderedSame;
    };
}

#pragma mark - Min

OVERLOADABLE id min(id<NSFastEnumeration> collection)
{
    return min(collection, compare);
}

OVERLOADABLE id min(id<NSFastEnumeration> collection, NSComparator comparator)
{
    return reduce(collection, ^id(id a, id b) {
        return comparator(a, b) ==  NSOrderedAscending ? a : b;
    });
}

OVERLOADABLE id min(id<NSFastEnumeration> collection, NSNumber *(^comparator)(id, id))
{
    return min(collection, unboxComparator(comparator));
}

#pragma mark - Max

OVERLOADABLE id max(id<NSFastEnumeration> collection)
{
    return max(collection, compare);
}

OVERLOADABLE id max(id<NSFastEnumeration> collection, NSComparator comparator)
{
    return reduce(collection, ^id(id a, id b) {
        return comparator(a, b) ==  NSOrderedDescending ? a : b;
    });
}

OVERLOADABLE id max(id<NSFastEnumeration> collection, NSNumber *(^comparator)(id, id))
{
    return max(collection, unboxComparator(comparator));
}
