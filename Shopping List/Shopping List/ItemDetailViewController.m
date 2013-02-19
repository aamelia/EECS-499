//
//  ItemDetailViewController.m
//  Shopping List
//
//  Created by Mia Atkinson on 2/19/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ListOfListsViewController.h"

@interface ItemDetailViewController ()
@end

@implementation ItemDetailViewController

@synthesize itemName;
@synthesize itemDetail;


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"Owner name is(viewWillAppear): %@", itemName);
    
    _itemNameLabel.text = itemName;
    _itemDetailLabel.text = itemDetail;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self)
 {
 // Custom initialization
 }
 return self;
 }*/

@end
