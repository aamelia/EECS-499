//
//  List.h
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingList.h"

@interface List : UITableViewController
{
    ShoppingList *currentShoppingList;
}

@property (nonatomic, strong) ShoppingList *currentShoppingList;

@end
