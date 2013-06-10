//
//  ASTMap.h
//  Asterism
//
//  Created by Robert Böhnke on 5/22/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

OVERLOADABLE NSArray *ASTMap(NSArray *array, id(^block)(id obj));
OVERLOADABLE NSArray *ASTMap(NSArray *array, id(^block)(id obj, NSUInteger idx));

OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(^block)(id obj));
OVERLOADABLE NSDictionary *ASTMap(NSDictionary *dict, id(^block)(id key, id obj));

OVERLOADABLE NSSet *ASTMap(NSSet *set, id(^block)(id obj));
