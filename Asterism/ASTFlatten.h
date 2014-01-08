//
//  ASTFlatten.h
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 11/24/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// Flattens an array a single level.
//
// array - An array of elements.
//
// Returns a new array that concatenates all array elements in `array` while
// preserving non-array elements.
NSArray *ASTFlatten(NSArray *array);
