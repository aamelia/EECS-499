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
    
    name = [[NSString alloc] init];
    listItems = [[NSMutableArray alloc] init];
    return (self);
}

@end
