//
//  AsterismPluck.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismConstants.h"

OVERLOADABLE NSArray *pluck(NSArray *array, NSString *keyPath);

OVERLOADABLE NSSet *pluck(NSSet *set, NSString *keyPath);
