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
// array - An array of elements. This argument must not be nil.
//
// Returns the first element or `nil` if the array is empty.
OVERLOADABLE id ASTHead(NSArray *array);
