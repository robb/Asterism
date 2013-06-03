//
//  AsterismNegate.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismConstants.h"

#define negate(...) \
        OVERLOADABLE BOOL (^negate(BOOL(^block)(__VA_ARGS__)))(__VA_ARGS__);

negate(id)
negate(id, NSUInteger)
negate(id, id)

#undef negate
