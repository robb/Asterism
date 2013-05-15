//
//  AsterismEach.h
//  Asterism
//
//  Created by Robert Böhnke on 4/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OVERLOADABLE __attribute((overloadable))

OVERLOADABLE void each(NSArray *array, void(^iterator)(id obj));
OVERLOADABLE void each(NSArray *array, void(^iterator)(id obj, NSUInteger idx));

OVERLOADABLE void each(NSDictionary *dict, void(^iterator)(id obj));
OVERLOADABLE void each(NSDictionary *dict, void(^iterator)(id key, id obj));

OVERLOADABLE void each(NSSet *set, void(^iterator)(id obj));
