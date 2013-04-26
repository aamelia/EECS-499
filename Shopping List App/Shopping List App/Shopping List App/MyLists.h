//
//  MyLists.h
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "ShoppingList.h"
#import "MyListsCell.h"
#import "List.h"
#import "ListDoc.h"
#import "ListData.h"


@interface MyLists : UITableViewController
{
    NSString *currentlyAdding;
}

@property (weak, nonatomic) IBOutlet UIButton *update;
@property (nonatomic, strong) NSString *currentlyAdding;
@property (nonatomic, assign) BOOL *newItemToAdd;
@property (assign, nonatomic) BOOL ascending;

- (void)handleOpenURL:(NSURL *)url;
- (IBAction)updateList;

@end
