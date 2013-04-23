//
//  List.h
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingList.h"
#import "ListCell.h"
#import "MyLists.h"
#import "AppDelegate.h"
#import "Item.h"
#import "ItemViewController.h"//;
#import "ListData.h"
#import "ListDoc.h"

@class ListData;
@class ListDoc;

@interface List : UITableViewController
{
    ListDoc *listDoc;
}

@property (nonatomic, retain) ListDoc *listDoc;

@end
