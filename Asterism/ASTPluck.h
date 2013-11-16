//
//  ASTPluck.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Extracts a value for a given key path from all elements in a collection.
//
// collection - An object that implements NSFastEnumeration.
// keyPath    - A key path. This argument must not be nil.
//
// Returns an array of the values that the elements in `collection` return for
// `keyPath`. If an element returns nil when invoked with -valueForKeyPath:,
// it is not present in the returned array. If possible, the order is being
// maintained.
OVERLOADABLE NSArray *ASTPluck(id<NSFastEnumeration> collection, NSString *keyPath);
