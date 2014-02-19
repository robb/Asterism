//
//  ASTShuffle.h
//  Asterism
//
//  Created by Robert Böhnke on 11/02/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Shuffles an array.
//
// array - An array of elements.
//
// Returns a copy of `array` shuffled using the Fisher-Yates shuffle.
OVERLOADABLE NSArray *ASTShuffle(NSArray *array);

// Shuffles an ordered set.
//
// set - An ordered set of elements.
//
// Returns a copy of `set` shuffled using the Fisher-Yates shuffle.
OVERLOADABLE NSOrderedSet *ASTShuffle(NSOrderedSet *set);
