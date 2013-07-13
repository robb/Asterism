//
//  ASTMinMax.h
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Returns the minimum of a collection by invoking -compare:.
//
// collection - An object that implements NSFastEnumeration. This argument must
//              not be nil.
//
// Returns the minimum of the collection by comparing all values by invoking
// -compare:.
OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection);

// Returns the minimum of a collection by using an NSComparator.
//
// collection - An object that implements NSFastEnumeration. This argument must
//              not be nil.
// comparator - An NSComparator used to compare the values.
//              This argument must not be nil.
//
// Returns the minimum of the collection by comparing all values using
// `comparator`.
OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection, NSComparator comparator);

// Returns the minimum of a collection by using a block.
//
// collection - An object that implements NSFastEnumeration. This argument must
//              not be nil.
// comparator - A block that takes two arguments and returns an
//              NSComparisonResult boxed in an NSNumber.
//              This argument must not be nil.
//
// Returns the minimum of the collection by comparing all values using
// `comparator`.
OVERLOADABLE id ASTMin(id<NSFastEnumeration> collection, NSNumber *(^comparator)(id a, id b));

// Returns the maximum of a collection by invoking -compare:.
//
// collection - An object that implements NSFastEnumeration. This argument must
//              not be nil.
//
// Returns the maximum of the collection by comparing all values by invoking
// -compare:.
OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection);

// Returns the maximum of a collection by using an NSComparator.
//
// collection - An object that implements NSFastEnumeration. This argument must
//              not be nil.
// comparator - An NSComparator used to compare the values.
//              This argument must not be nil.
//
// Returns the maximum of the collection by comparing all values using
// `comparator`.
OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection, NSComparator comparator);

// Returns the maximum of a collection by using a block.
//
// collection - An object that implements NSFastEnumeration. This argument must
//              not be nil.
// comparator - A block that takes two arguments and returns an
//              NSComparisonResult boxed in an NSNumber.
//              This argument must not be nil.
//
// Returns the maximum of the collection by comparing all values using
// `comparator`.
OVERLOADABLE id ASTMax(id<NSFastEnumeration> collection, NSNumber *(^comparator)(id a, id b));
