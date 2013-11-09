//
//  ASTPluck.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Extracts a value for a given key path from all elements in an array.
//
// array   - An array of elements. This argument must not be nil.
// keyPath - A key path. This argument must not be nil.
//
// Returns an array of the values that the elements in `array` return for
// `keyPath`. If an element returns nil when invoked with -valueForKeyPath:,
// it is not present in the returned array. The order is being maintained.
OVERLOADABLE NSArray *ASTPluck(NSArray *array, NSString *keyPath);

// Extracts a value for a given key path from all elements in a set.
//
// set     - A set of elements. This argument must not be nil.
// keyPath - A key path. This argument must not be nil.
//
// Returns a set of the values that the elements in `set` return for `keyPath`.
// If an element returns nil when invoked with -valueForKeyPath:,  it is not
// present in the returned set.
OVERLOADABLE NSSet *ASTPluck(NSSet *set, NSString *keyPath);

// Extracts a value for a given key path from all elements in an ordered set.
//
// set     - An orderd set of elements. This argument must not be nil.
// keyPath - A key path. This argument must not be nil.
//
// Returns an ordered set of the values that the elements in `set` return for
// `keyPath`. If an element returns nil when invoked with -valueForKeyPath:, it
// is not present in the returned set. The order is being maintained.
OVERLOADABLE NSOrderedSet *ASTPluck(NSOrderedSet *set, NSString *keyPath);
