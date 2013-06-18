//
//  ASTUnion.h
//  Asterism
//
//  Created by Robert Böhnke on 6/18/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

OVERLOADABLE NSArray *ASTUnion(NSArray *array, NSArray *other);

OVERLOADABLE NSSet *ASTUnion(NSSet *set, NSSet *other);
