//
//  Welcome.h
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddList.h"
#import "MyLists.h"

@interface Welcome : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *addListButton;
@property (weak, nonatomic) IBOutlet UIButton *myListsButton;
- (IBAction)showDefault:(id)sender;

@end
