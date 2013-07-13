//
//  ASTLift.h
//  Asterism
//
//  Created by Robert Böhnke on 5/23/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "metamacros.h"

typedef id (^ASTBlockVar)(id va, ...);

// Lifts a selector into a block.
//
// selector - A selector.
//
// Returns a varargs block that invokes the `selector` on its first argument,
// using all subsequent parameters as arguments.
// If invoking the selector returns a primitive value, it is automatically boxed
// in an NSValue or NSNumber.
//
// You should use the ASTLift0 or ASTLift macros for improved type-safety.
ASTBlockVar ASTLiftVar(SEL selector);

// Lifts a selector into a block.
//
// selector - A selector that takes no arguments.
//
// Returns a block of type id (^)(id) that invokes `selector` on its argument.
// If invoking the selector returns a primitive value, it is automatically boxed
// in an NSValue or NSNumber.
// If the `selector` on the argument is of type `void`, the block returns `nil`.
#define ASTLift0(SELECTOR) \
        ASTLift0_(SELECTOR)

// Lifts a selector into a block.
//
// selector... - A variadic argument of selector components, each ending in ':'.
//
// Returns a block of the return-type id that takes on more argument than the
// number of selector components it was created with.
// Calling the block invokes `selector` on its first argument, using the
// subsequent arguments as parameters.
//
// If invoking the selector returns a primitive value, it is automatically boxed
// in an NSValue or NSNumber.
// If the `selector` on the argument is of type `void`, the block returns `nil`.
//
// Example
//
//    id (^block)(id, id, id) = ASTLift(setValue:, forKeyPath:);
//
//    block(a, b, c); // Equivalent to [a setValue:b forKeyPath:c];
//
#define ASTLift(...) \
        ASTLift_(__VA_ARGS__)

// IMPLEMENTATION DETAILS FOLLOW!
// Do not write code that depends on anything below this line.

#define ASTLift0_(SELECTOR) \
        ((id (^)(id))ASTLiftVar(@selector(SELECTOR)))

#define ASTLift_parameter_(INDEX, MAX) \
        metamacro_if_eq(INDEX, metamacro_dec(MAX)) \
            (id) \
            (id, )

#define ASTLift_parameters_(COUNT) \
        metamacro_for_cxt(COUNT, ASTLift_parameter_,, COUNT)

#define ASTLift_block_signature(...) \
        id(^)(ASTLift_parameters_(metamacro_inc(metamacro_argcount(__VA_ARGS__))))

#define ASTLift_(...) \
        ((ASTLift_block_signature(__VA_ARGS__)) ASTLiftVar(@selector(metamacro_foreach_concat(,,__VA_ARGS__))))
