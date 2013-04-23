//
//  RootViewController.m
//  ScaryBugs
//
//  Created by Ray Wenderlich on 8/24/10.
//  Copyright Ray Wenderlich 2010. All rights reserved.
//

#import "RootViewController.h"
#import "ListDoc.h"
#import "ListData.h"
#import "ListDatabase.h"

@implementation RootViewController
@synthesize lists = _lists;
@synthesize welcome = _welcome;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _lists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    self.welcome = nil;
}

- (void)viewDidUnload
{
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)addTapped:(id)sender
{    
 
}

- (void)addNewDoc:(ListDoc *)newDoc
{
    [_lists addObject:newDoc];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_lists.count-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:YES];
}

#pragma mark ImportBugViewControllerDelegate

- (void)importableBugDocTapped:(NSString*)importPath
{
    [self.navigationController popViewControllerAnimated:YES];
    ListDoc *newDoc = [[ListDoc alloc] init];
    if ([newDoc importFromPath:importPath]) {
        [self addNewDoc:newDoc];
    }
}

#pragma mark URL handling

- (void)handleOpenURL:(NSURL *)url
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    ListDoc *newDoc = [[ListDoc alloc] init];
    if ([newDoc importFromURL:url]) {
        [self addNewDoc:newDoc];
    }
}


@end

