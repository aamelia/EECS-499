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
    //Save the image and the textField
    int rowNum = 0;
    //Save details
    ((Item *)((NSMutableArray *)((ShoppingList *)allLists[rowNum]).listItemObjects)).details = textDetails.text;
    
    //Save Image
    ((Item *)((NSMutableArray *)((ShoppingList *)allLists[rowNum]).listItemObjects)).image = imageView.image;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    textDetails.layer.borderWidth = 3.0f;
    textDetails.layer.borderColor = [[UIColor purpleColor] CGColor];
    textDetails.layer.cornerRadius = 8;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) getPhoto:(id) sender {
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
