//
//  ASTEmpty.h
//  Asterism
//
//  Created by Robert Böhnke on 8/5/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

// You should not call these methods directly.
BOOL __ASTEmpty_NSArray(NSArray *array);
BOOL __ASTEmpty_NSDictionary(NSDictionary *dictionary);
BOOL __ASTEmpty_NSSet(NSSet *set);
BOOL __ASTEmpty_NSOrderedSet(NSOrderedSet *set);
BOOL __ASTEmpty_NSFastEnumeration(id<NSFastEnumeration> collection);

// Returns YES if `array` is empty.
static inline __attribute__((overloadable)) BOOL ASTEmpty(NSArray *array) {
    return __ASTEmpty_NSArray(array);
}

// Returns YES if `dictionary` is empty.
static inline __attribute__((overloadable)) BOOL ASTEmpty(NSDictionary *dictionary) {
    return __ASTEmpty_NSDictionary(dictionary);
}

// Returns YES if `set` is empty.
static inline __attribute__((overloadable)) BOOL ASTEmpty(NSSet *set) {
    return __ASTEmpty_NSSet(set);
}

// Returns YES if `set` is empty.
static inline __attribute__((overloadable)) BOOL ASTEmpty(NSOrderedSet *set) {
    return __ASTEmpty_NSOrderedSet(set);
}

// Returns YES if `collection` is empty.
static inline __attribute__((overloadable)) BOOL ASTEmpty(id<NSFastEnumeration> collection) {
    return __ASTEmpty_NSFastEnumeration(collection);
}
