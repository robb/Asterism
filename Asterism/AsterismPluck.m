//
//  AsterismPluck.m
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import "AsterismMap.h"

#import "AsterismPluck.h"

OVERLOADABLE NSArray *pluck(NSArray *array, NSString *keyPath)
{
    return map(array, ^id(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}

OVERLOADABLE NSSet *pluck(NSSet *set, NSString *keyPath)
{
    return map(set, ^id(id obj) {
        return [obj valueForKeyPath:keyPath];
    });
}
