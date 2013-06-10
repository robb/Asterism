//
//  AsterismPluck.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "ASTMap.h"

#import "AsterismPluck.h"

OVERLOADABLE NSArray *pluck(NSArray *array, NSString *keyPath)
{
    return ASTMap(array, ^id(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}

OVERLOADABLE NSSet *pluck(NSSet *set, NSString *keyPath)
{
    return ASTMap(set, ^id(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}
