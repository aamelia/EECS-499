//
//  ShoppingList.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "ShoppingList.h"

@implementation ShoppingList

- (id)init
{
	if (!(self = [super init]))
		return nil;
    
    owner = [[NSString alloc] init];
    name = [[NSString alloc] init];
    listItems = [[NSMutableArray alloc] init];
    
    owner = @"Insert Owner Name";
    name = @"Insert List Name";
    
    return (self);
}

@end
