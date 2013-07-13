//
//  ASTFind.h
//  Asterism
//
//  Created by Robert Böhnke on 6/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

OVERLOADABLE id ASTFind(NSArray *array, BOOL(^block)(id obj));
OVERLOADABLE id ASTFind(NSArray *array, BOOL(^block)(id obj, NSUInteger idx));

OVERLOADABLE id ASTFind(NSDictionary *dict, BOOL(^block)(id obj));
OVERLOADABLE id ASTFind(NSDictionary *dict, BOOL(^block)(id key, id obj));

OVERLOADABLE id ASTFind(id<NSFastEnumeration> collection, BOOL(^block)(id obj));
