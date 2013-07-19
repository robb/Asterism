//
//  ASTCompose.h
//  Asterism
//
//  Created by Felix-Johannes Jendrusch on 7/19/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>

id (^ASTCompose(id(^f)(id), id(^g)(id)))(id x);
