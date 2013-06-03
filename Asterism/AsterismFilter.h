//
//  AsterismFilter.h
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismConstants.h"

OVERLOADABLE NSArray *filter(NSArray *array, BOOL(^block)(id obj));
OVERLOADABLE NSArray *filter(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));

OVERLOADABLE NSDictionary *filter(NSDictionary *dict, BOOL(^block)(id obj));
OVERLOADABLE NSDictionary *filter(NSDictionary *dict, BOOL(^block)(id key, id obj));

OVERLOADABLE NSSet *filter(NSSet *set, BOOL(^block)(id obj));
