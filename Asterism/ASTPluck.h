//
//  ASTPluck.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismDefines.h"

// You should not call these methods directly.
ASTERISM_USE_INSTEAD(ASTPluck) NSDictionary *__ASTPluck_NSDictionary(NSDictionary *dict, NSString *keyPath);
ASTERISM_USE_INSTEAD(ASTPluck) NSArray *__ASTPluck_NSFastEnumeration(id<NSFastEnumeration> collection, NSString *keyPath);

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/// Extracts a value for a given key path from all values of a dictionary.
///
/// @param dict    A dictionary of elements.
/// @param keyPath A key path. This argument must not be @c nil .
///
/// @returns A dictionary mapping the original keys to the values that the
///          values in @c dict return for @c keyPath. If a value returns
///          @c nil when invoked with @c -valueForKeyPath: , it is not present
///          in the returned dictionary.
ASTERISM_OVERLOADABLE NSDictionary *ASTPluck(NSDictionary *dict, NSString *keyPath) {
    return __ASTPluck_NSDictionary(dict, keyPath);
}

/// Extracts a value for a given key path from all elements in a collection.
///
/// @params collection An object that implements NSFastEnumeration.
/// @params keyPath    A key path. This argument must not be @c nil .
///
/// @returns An array of the values that the elements in @c collection return
///          for @c keyPath. If an element returns @c nil when invoked with
///          @c -valueForKeyPath: , it is not present in the returned array.
///          If possible, the order is being maintained.
ASTERISM_OVERLOADABLE NSArray *ASTPluck(id<NSFastEnumeration> collection, NSString *keyPath) {
    return __ASTPluck_NSFastEnumeration(collection, keyPath);
}

#pragma clang diagnostic pop
