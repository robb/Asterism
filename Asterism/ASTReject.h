//
//  ASTReject.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

OVERLOADABLE NSArray *ASTReject(NSArray *array, BOOL(^block)(id obj));
OVERLOADABLE NSArray *ASTReject(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));

OVERLOADABLE NSDictionary *ASTReject(NSDictionary *dict, BOOL(^block)(id obj));
OVERLOADABLE NSDictionary *ASTReject(NSDictionary *dict, BOOL(^block)(id key, id obj));

OVERLOADABLE NSSet *ASTReject(NSSet *set, BOOL(^block)(id obj));
