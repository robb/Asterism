//
//  ASTFlatten.h
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 11/24/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// Flattens an array of arrays.
//
// array - An array of array elements.
//
// Returns a new array that concatenates all array elements in `array`.
NSArray *ASTFlatten(NSArray *array);
