//
//  ItemViewController.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/21/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "ItemViewController.h"

@interface ItemViewController ()
@end

@implementation ItemViewController
@synthesize imageView,choosePhotoBtn,takePhotoBtn, textDetails;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidDisappear:(BOOL)animated
{
    //Save details
    ((Item *)((ShoppingList *)allLists[currentListIndex]).listItems[currentItemIndex]).details = textDetails.text;
    
    //((ShoppingList *)allLists[currentListIndex]).listItems[currentItemIndex] = currentItem;

    //Save Image
    
    NSLog(@"Saving text: %@", textDetails.text);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    imageView.image = currentItem.image;
    textDetails.text = ((Item *)((ShoppingList *)allLists[currentListIndex]).listItems[currentItemIndex]).details;
    //textDetails.text = currentItem.name;
    NSLog(@"ViewDidLoad ItemViewController: details = %@", ((Item *)((ShoppingList *)allLists[currentListIndex]).listItems[currentItemIndex]).details);

    
    textDetails.layer.borderWidth = 3.0f;
    textDetails.layer.borderColor = [[UIColor purpleColor] CGColor];
    textDetails.layer.cornerRadius = 8;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) getPhoto:(id) sender
{
	UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    
	if((UIButton *) sender == choosePhotoBtn) {
		picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
	} else {
		picker.sourceType = UIImagePickerControllerSourceTypeCamera;
	}
    
	[self presentModalViewController:picker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissModalViewControllerAnimated:YES];
	imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)backgroundTouched:(id)sender
{
    [textDetails resignFirstResponder];
}

@end
