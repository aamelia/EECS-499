//
//  MyLists.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "MyLists.h"
#import "AppDelegate.h"
#import "ListDatabase.h"

@interface MyLists ()

@end

@implementation MyLists
@synthesize currentlyAdding;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
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
        //ListDoc *newDoc = [[ListDoc alloc] initWithTitle:[[alertView textFieldAtIndex:0] text] items:[[NSMutableArray alloc]init]];
        ListDoc *newDoc = [[ListDoc alloc] init];
        newDoc.data.title = [[alertView textFieldAtIndex:0] text];
        newDoc.data.items = [[NSMutableArray alloc] init];
        
        [allLists addObject: newDoc];
        [newDoc saveData];
        
        numLists ++;
        [self.tableView reloadData];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    //This method is called each time you see this view on the screen
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"My Lists";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action: @selector(showMessage)];
    self.navigationItem.rightBarButtonItem = rightButton;
    numLists = 0;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor purpleColor];
    [refreshControl addTarget:self action:@selector(updateTable) forControlEvents:UIControlEventValueChanged];

    self.refreshControl = refreshControl;
}

- (void)changeSorting
{
    [self performSelector:@selector(updateTable) withObject:nil
               afterDelay:1];
}

- (void)updateTable
{
    allLists = [[NSMutableArray alloc] init];
    NSMutableArray *loadedLists = [ListDatabase loadListDocs];
    allLists = loadedLists;
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowList"])
    {
        List *vc = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        currentListIndex = [myIndexPath row];
        vc.listDoc = allLists[[myIndexPath row]];
    }
}

- (IBAction)updateList
{
    allLists = [[NSMutableArray alloc] init];
    NSMutableArray *loadedLists = [ListDatabase loadListDocs];
    allLists = loadedLists;
    [self.tableView reloadData];
}

- (void)handleOpenURL:(NSURL *)url
{
    [[self navigationController] popToRootViewControllerAnimated:YES];
    ListDoc *newDoc = [[ListDoc alloc] init];
    if ([newDoc importFromURL:url])
    {
        [self addNewDoc:newDoc];
    }
}

- (void)addNewDoc:(ListDoc *)newDoc
{
    [allLists addObject:newDoc];
    //[self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    //NSLog(@"The number of rows is: %i", allLists.count);
    return allLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   
    static NSString *CellIdentifier = @"MyListsCell";
    MyListsCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    
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
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        ListDoc *temp = allLists[indexPath.row];
        [temp deleteDoc];
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
