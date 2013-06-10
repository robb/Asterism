//
//  ASTFilter.h
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismConstants.h"

OVERLOADABLE NSArray *ASTFilter(NSArray *array, BOOL(^block)(id obj));
OVERLOADABLE NSArray *ASTFilter(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));

OVERLOADABLE NSDictionary *ASTFilter(NSDictionary *dict, BOOL(^block)(id obj));
OVERLOADABLE NSDictionary *ASTFilter(NSDictionary *dict, BOOL(^block)(id key, id obj));

OVERLOADABLE NSSet *ASTFilter(NSSet *set, BOOL(^block)(id obj));
