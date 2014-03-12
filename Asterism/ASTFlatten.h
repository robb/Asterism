//
//  ASTFlatten.h
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 11/24/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// You should not call these methods directly.
NSArray *__ASTFlatten_NSArray(NSArray *array);

// Flattens an array a single level.
//
// array - An array of elements.
//
// Returns a new array that concatenates all array elements in `array` while
// preserving non-array elements.
static inline __attribute__((overloadable)) NSArray *ASTFlatten(NSArray *array) {
    return __ASTFlatten_NSArray(array);
}
