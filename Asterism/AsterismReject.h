//
//  AsterismReject.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismConstants.h"

OVERLOADABLE NSArray *reject(NSArray *array, BOOL(^block)(id obj));
OVERLOADABLE NSArray *reject(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));

OVERLOADABLE NSDictionary *reject(NSDictionary *dict, BOOL(^block)(id obj));
OVERLOADABLE NSDictionary *reject(NSDictionary *dict, BOOL(^block)(id key, id obj));

OVERLOADABLE NSSet *reject(NSSet *set, BOOL(^block)(id obj));
