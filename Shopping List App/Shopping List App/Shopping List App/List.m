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
        Item *newItem = [[Item alloc] init];
        newItem.name = [[alertView textFieldAtIndex:0] text];
        NSLog(@"New Item Name: %@",newItem.name);
        //Add the item to allLists
        [((NSMutableArray *)((ShoppingList *)allLists[currentListIndex]).listItems) addObject: newItem];
        [self.tableView reloadData];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    self.navigationItem.title = ((ShoppingList *)allLists[currentListIndex]).name;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action: @selector(showMessage)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showItem"])
    {
        ItemViewController *vc = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = [myIndexPath row];
        Item *temp = ((ShoppingList *)allLists[currentListIndex]).listItems[row];
        NSLog(@"Temp.details = %@", temp.details);
        
        vc.currentItem = ((ShoppingList *)allLists[currentListIndex]).listItems[row];
        currentItemIndex = row;
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
    return ((NSMutableArray *)((ShoppingList *)allLists[currentListIndex]).listItems).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListCell";
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    
    //Configure the cell
    int row = [indexPath row];
    Item *temp = ((NSMutableArray *)((ShoppingList *)allLists[currentListIndex]).listItems)[row];
        
    cell.itemName.text = temp.name;
    
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
