//
//  AddList.h
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLists.h"

@interface AddList : UIViewController
{
    IBOutlet UITextField *textField;
}

@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (nonatomic, retain) IBOutlet UITextField *textField;

- (IBAction)dismissView:(id)sender;
- (IBAction)textFieldReturn: (id)sender;
- (IBAction)backgroundTouched:(id)sender;

@end
