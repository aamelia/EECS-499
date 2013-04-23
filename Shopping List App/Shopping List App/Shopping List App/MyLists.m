//
//  MyLists.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "MyLists.h"
#import "AppDelegate.h"

@interface MyLists ()

@end

@implementation MyLists
@synthesize currentlyAdding;
//@synthesize allLists;

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
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Enter A New List Name"
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
        ListDoc *newDoc = [[ListDoc alloc] init];
        newDoc.data.title = [[alertView textFieldAtIndex:0] text];
        newDoc.data.list = [[NSMutableArray alloc] init];
        [allLists addObject: newDoc];
        [newDoc saveData];
        
        numLists ++;
        [self.tableView reloadData];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"My Lists";
    allLists = [[NSMutableArray alloc] init];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action: @selector(showMessage)];
    self.navigationItem.rightBarButtonItem = rightButton;
    numLists = 0;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowList"])
    {
        List *vc = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        currentListIndex = [myIndexPath row];
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
    
    /*
     This is from Scary Bugs
    ScaryBugDoc *doc = [_bugs objectAtIndex:indexPath.row];
    cell.textLabel.text = doc.data.title;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = doc.thumbImage;
    */
    
    int row = [indexPath row];
    ListDoc *doc = [allLists objectAtIndex:indexPath.row];
    
    //ShoppingList *temp = allLists[row];
    //cell.listName.text = temp.name;
    cell.listName.text = doc.data.title;
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
