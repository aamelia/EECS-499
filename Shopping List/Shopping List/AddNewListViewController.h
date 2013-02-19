//
//  AddNewListViewController.h
//  Shopping List
//
//  Created by Mia Atkinson on 2/19/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewListViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameInput;
@property (weak, nonatomic) IBOutlet UITextField *ownerInput;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end
