//
//  AllListsViewController.h
//  Checklists
//
//  Created by Matthijs Hollemans on 03-06-12.
//  Copyright (c) 2012 Hollance. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"
#import "DataModel.h"
 
@interface AllListsViewController : UITableViewController <ListDetailViewControllerDelegate>
 
@property (nonatomic, strong) DataModel *dataModel;
 
@end
