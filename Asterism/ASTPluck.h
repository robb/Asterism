//
//  ASTPluck.h
//  Asterism
//
//  Created by Robert Böhnke on 6/3/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsterismConstants.h"

OVERLOADABLE NSArray *ASTPluck(NSArray *array, NSString *keyPath);

OVERLOADABLE NSSet *ASTPluck(NSSet *set, NSString *keyPath);
