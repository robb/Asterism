//
//  ASTEmpty.m
//  Asterism
//
//  Created by Robert Böhnke on 8/5/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTEmpty.h"

OVERLOADABLE BOOL ASTEmpty(NSArray *array)
{
    return array.count == 0;
}

OVERLOADABLE BOOL ASTEmpty(NSDictionary *dictionary)
{
    return dictionary.count == 0;
}

OVERLOADABLE BOOL ASTEmpty(NSSet *set)
{
    return set.count == 0;
}

OVERLOADABLE BOOL ASTEmpty(NSOrderedSet *set)
{
    return set.count == 0;
}

OVERLOADABLE BOOL ASTEmpty(id<NSFastEnumeration> collection)
{
    for (id _ in collection) {
        return NO;
    }

    return YES;
}
