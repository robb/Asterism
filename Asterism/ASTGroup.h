//
//  ASTGroup.h
//  Asterism
//
//  Created by Robert Böhnke on 6/4/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

OVERLOADABLE NSDictionary *ASTGroup(id<NSFastEnumeration> collection, id<NSCopying> (^block)(id obj));
