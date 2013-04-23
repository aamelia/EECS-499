//
//  ItemViewController.h
//  Shopping List App
//
//  Created by Mia Atkinson on 3/21/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h> 
#import "AppDelegate.h"
#import "Item.h"
#import "ShoppingList.h"
#import "ListData.h"
#import "ListDoc.h"

//@interface ItemViewController : UIViewController
@interface ItemViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    Item *currentItem;
    UITextView *textDetails;
    UIImageView *imageView;
	UIButton *choosePhotoBtn;
	UIButton *takePhotoBtn;
}
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (retain, nonatomic) IBOutlet Item *currentItem;
@property (retain, nonatomic) IBOutlet UITextView *textDetails;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (retain, nonatomic) IBOutlet UIButton *choosePhotoBtn;
@property (retain, nonatomic) IBOutlet UIButton *takePhotoBtn;

-(IBAction) getPhoto:(id) sender;
-(IBAction)textFieldReturn:(id)sender;
-(IBAction)backgroundTouched:(id)sender;


@end
