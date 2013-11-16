//
//  ASTHead.h
//  Asterism
//
//  Created by Robert Böhnke on 6/1/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Returns the first element of an array.
//
// array - An array of elements.
//
// Returns the first element or `nil` if the array is empty.
OVERLOADABLE id ASTHead(NSArray *array);

// Returns the first element of an ordered set.
//
// set - An ordered set of elements.
//
// Returns the first element or `nil` if the ordered set is empty.
OVERLOADABLE id ASTHead(NSOrderedSet *set);
