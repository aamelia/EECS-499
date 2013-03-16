//
//  MyLists.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "MyLists.h"

@interface MyLists ()

@end

@implementation MyLists
@synthesize currentlyAdding;
@synthesize allLists;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"ViewDidAppear\n");
    [self addNewItem2];
    [self.tableView reloadData];
    
    NSLog(@"\nThe size of the list is: %i", allLists.count);
}

- (void)viewDidLoad
{
    NSLog(@"ViewDidLoad\n");
    [super viewDidLoad];
    allLists = [[NSMutableArray alloc] init];
    //[self addNewItem2];
    //ShoppingList *firstList = [[ShoppingList alloc] init];
    //firstList.name = @"My Blah List";
    //[allLists addObject: firstList];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action: @selector(addNewItem)];
    
    self.navigationItem.rightBarButtonItem = rightButton;

    //[self.tableView reloadData];

    //NSLog(@"\nThe size of the list is: %i", allLists.count);
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"ShowList"])
    {
        // Get reference to the destination view controller
        List *vc = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        int row = [myIndexPath row];
        ShoppingList *temp = allLists[row];
        
        // Pass any objects to the view controller here, like...
        vc.currentShoppingList = temp;

    }
}

- (void) addNewItem
{
    [self performSegueWithIdentifier: @"NewList2" sender: self];
    //NSLog(@"AddNewItem");
    //ShoppingList *newList = [[ShoppingList alloc] init];
    //newList.name = currentlyAdding;
    //[allLists addObject: newList];
    //[self.tableView reloadData];
}

- (void) addNewItem2
{
    if(![currentlyAdding isEqualToString:@""] && !currentlyAdding == NULL)
    {
        ShoppingList *newList = [[ShoppingList alloc] init];
        newList.name = currentlyAdding;
        [allLists addObject: newList];
        NSLog(@"addNewItem2: %@", currentlyAdding);
        //[release newList];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return allLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   
    static NSString *CellIdentifier = @"MyListsCell";
    MyListsCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    
    //Configure the cell
    
    
    int row = [indexPath row];
    ShoppingList *temp = allLists[row];
    cell.listName.text = temp.name;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [allLists removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        NSLog(@"Inserting function");
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
