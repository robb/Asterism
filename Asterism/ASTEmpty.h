//
//  ASTEmpty.h
//  Asterism
//
//  Created by Robert Böhnke on 8/5/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Returns YES if `array` is empty.
OVERLOADABLE BOOL ASTEmpty(NSArray *array);

// Returns YES if `dictionary` is empty.
OVERLOADABLE BOOL ASTEmpty(NSDictionary *dictionary);

// Returns YES if `set` is empty.
OVERLOADABLE BOOL ASTEmpty(NSSet *set);

// Returns YES if `set` is empty.
OVERLOADABLE BOOL ASTEmpty(NSOrderedSet *set);

// Returns YES if `collection` is empty.
OVERLOADABLE BOOL ASTEmpty(id<NSFastEnumeration> collection);
