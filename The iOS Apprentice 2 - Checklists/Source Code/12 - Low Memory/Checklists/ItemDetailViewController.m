//
//  AddItemViewController.m
//  Checklists
//
//  Created by Matthijs Hollemans on 03-06-12.
//  Copyright (c) 2012 Hollance. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ChecklistItem.h"

@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController {
    NSString *text;
    BOOL shouldRemind;
    NSDate *dueDate;
}

@synthesize textField;
@synthesize doneBarButton;
@synthesize switchControl;
@synthesize dueDateLabel;
@synthesize delegate;
@synthesize itemToEdit;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        text = @"";
        shouldRemind = NO;
        dueDate = [NSDate date];
    }
    return self;
}

- (void)updateDueDateLabel
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    self.dueDateLabel.text = [formatter stringFromDate:dueDate];
}

- (void)updateDoneBarButton
{
    self.doneBarButton.enabled = ([text length] > 0);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    if (self.itemToEdit != nil) {
        self.title = @"Edit Item";
    }
 
    self.textField.text = text;
    self.switchControl.on = shouldRemind;
 
    [self updateDoneBarButton];
    [self updateDueDateLabel];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
 
    [self.textField becomeFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];

	if ([self isViewLoaded] && self.view.window == nil) {
		self.view = nil;
	}

	if (![self isViewLoaded]) {
		self.textField = nil;
		self.doneBarButton = nil;
		self.switchControl = nil;
		self.dueDateLabel = nil;
	}
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickDate"]) {
        DatePickerViewController *controller = segue.destinationViewController;
        controller.delegate = self;
        controller.date = dueDate;
    }
}

- (IBAction)cancel
{
    [self.delegate itemDetailViewControllerDidCancel:self];
}
 
- (IBAction)done
{
    if (self.itemToEdit == nil) {
        ChecklistItem *item = [[ChecklistItem alloc] init];
        item.text = self.textField.text;
        item.checked = NO;
        item.shouldRemind = self.switchControl.on;
        item.dueDate = dueDate;
        [item scheduleNotification];
 
        [self.delegate itemDetailViewController:self didFinishAddingItem:item];
    } else {
        self.itemToEdit.text = self.textField.text;
        self.itemToEdit.shouldRemind = self.switchControl.on;
        self.itemToEdit.dueDate = dueDate;
        [self.itemToEdit scheduleNotification];
 
        [self.delegate itemDetailViewController:self didFinishEditingItem:self.itemToEdit];
    }
}

- (IBAction)switchChanged:(UISwitch *)sender
{
    shouldRemind = sender.on;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return indexPath;
    } else {
        return nil;
    }
}

- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    text = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    [self updateDoneBarButton];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)theTextField
{
    text = theTextField.text;
    [self updateDoneBarButton];
}

- (void)datePickerDidCancel:(DatePickerViewController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
 
- (void)datePicker:(DatePickerViewController *)picker didPickDate:(NSDate *)date
{
    dueDate = date;
    [self updateDueDateLabel];
 
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setItemToEdit:(ChecklistItem *)newItem
{
    if (itemToEdit != newItem) {
        itemToEdit = newItem;
        text = itemToEdit.text;
        shouldRemind = itemToEdit.shouldRemind;
        dueDate = itemToEdit.dueDate;
    }
}

@end
