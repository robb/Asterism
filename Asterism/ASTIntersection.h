//
//  ASTIntersection.h
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

OVERLOADABLE NSArray *ASTIntersection(NSArray *array, NSArray *other);

OVERLOADABLE NSSet *ASTIntersection(NSSet *set, NSSet *other);
