//
//  ChecklistItem.m
//  Checklists
//
//  Created by Matthijs Hollemans on 02-06-12.
//  Copyright (c) 2012 Hollance. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

@synthesize text, checked;

- (void)toggleChecked
{
    self.checked = !self.checked;
}

@end
