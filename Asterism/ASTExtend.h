//
//  ASTExtend.h
//  Asterism
//
//  Created by Robert Böhnke on 24/11/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ASTConstants.h"

// Extends a dictionary with values from another dictionary.
//
// dict   - A dictionary.
// source - A dictionary of extensions.
//
// Returns a dictionary that contains a union of key-value-pairs of dict and
// source. Key-value-pairs of source will have precedence over those taken from
// dict.
OVERLOADABLE NSDictionary *ASTExtend(NSDictionary *dict, NSDictionary *source);
