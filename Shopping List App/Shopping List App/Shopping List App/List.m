//
//  List.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "List.h"

@interface List ()
@end

@implementation List
@synthesize rowNum;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction) showMessage
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Enter A New List Item"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            otherButtonTitles:@"Create", nil];
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [message show];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        NSString *newItem = [[NSString alloc] init];
        Item *newItemObject = [[Item alloc] init];
        
        newItem = [[alertView textFieldAtIndex:0] text];
        newItemObject.name = newItem;
        
        //NSLog(@"New Item Name: %@",newItem);
        //Add the string to allLists
        [((NSMutableArray *)((ShoppingList *)allLists[rowNum]).listItems) addObject: newItem];
        //Add the item to allLists
        [((NSMutableArray *)((ShoppingList *)allLists[rowNum]).listItemObjects) addObject: newItemObject];
        
        //[currentShoppingList.listItems addObject: newItem];
        [self.tableView reloadData];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    self.navigationItem.title = ((ShoppingList *)allLists[rowNum]).name;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action: @selector(showMessage)];
    self.navigationItem.rightBarButtonItem = rightButton;
    currentShoppingList = [[ShoppingList alloc] init];
    currentShoppingList.listItems = [[NSMutableArray alloc] init];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowItem"])
    {
        ItemViewController *vc = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = [myIndexPath row];
        //vc.currentItem.rowNum = row;
        NSLog(@"List Index of selected shopping list is: %i", row);
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
    //NSLog(@"The number of rows is: %i", ((NSMutableArray *)((ShoppingList *)allLists[rowNum]).listItems).count);
    return ((NSMutableArray *)((ShoppingList *)allLists[rowNum]).listItems).count;

    return currentShoppingList.listItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListCell";
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    
    
    //Configure the cell
    
    int row = [indexPath row];
    cell.itemName.text = ((NSMutableArray *)((ShoppingList *)allLists[rowNum]).listItems)[row];
    
    //cell.itemName.text = currentShoppingList.listItems[row];
    
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
