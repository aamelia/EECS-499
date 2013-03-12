//
//  AddList.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "AddList.h"

@interface AddList ()
@end

@implementation AddList
@synthesize textField;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ShowList"])
    {
        // Get reference to the destination view controller
        MyLists *vc = [segue destinationViewController];
        
        vc.currentlyAdding = textField.text;
        vc.newItemToAdd = TRUE;
        
        //vc.currentShoppingList = temp;
        
    }
}

- (IBAction)dismissView:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

-(IBAction)backgroundTouched:(id)sender
{
    [textField resignFirstResponder];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
