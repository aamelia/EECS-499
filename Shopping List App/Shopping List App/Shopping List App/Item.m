//
//  Item.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/21/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "Item.h"

@implementation Item
@synthesize image, details, name;
@synthesize rowNum;

- (id)init
{
	if (!(self = [super init]))
		return nil;
    
    name = [[NSString alloc] init];
    details = [[NSString alloc] init];
    name = @"Test name - Change in Item.m";
    details = @"Test Details - Change in Item.m";
    return (self);
}

@end