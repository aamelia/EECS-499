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
#import "DSActivityView.h"

#import <MessageUI/MessageUI.h>

@interface List : UITableViewController <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIAlertViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
{
    ListDoc *_listDoc;
    UIImagePickerController *_picker;
    DSActivityView *_activityView;
    NSOperationQueue *_queue;
}

@property (nonatomic, retain) ListDoc *listDoc;
@property (retain) UIImagePickerController *picker;
@property (retain) DSActivityView *activityView;
@property (retain) NSOperationQueue *queue;

- (IBAction)exportMethod:(id)sender;

@end
