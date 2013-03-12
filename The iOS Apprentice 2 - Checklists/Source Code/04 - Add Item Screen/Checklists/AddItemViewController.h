//
//  AddItemViewController.h
//  Checklists
//
//  Created by Matthijs Hollemans on 03-06-12.
//  Copyright (c) 2012 Hollance. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class ChecklistItem;
 
@protocol AddItemViewControllerDelegate <NSObject>
 
- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;
 
- (void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item;
 
@end

@interface AddItemViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;

- (IBAction)cancel;
- (IBAction)done;

@end
