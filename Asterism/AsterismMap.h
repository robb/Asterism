//
//  AsterismMap.h
//  Asterism
//
//  Created by Robert Böhnke on 5/22/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OVERLOADABLE __attribute__((overloadable))

OVERLOADABLE NSArray *map(NSArray *array, id(^block)(id obj));
OVERLOADABLE NSArray *map(NSArray *array, id(^block)(id obj, NSUInteger idx));

OVERLOADABLE NSDictionary *map(NSDictionary *dict, id(^block)(id obj));
OVERLOADABLE NSDictionary *map(NSDictionary *dict, id(^block)(id key, id obj));

OVERLOADABLE NSSet *map(NSSet *set, id(^block)(id obj));
