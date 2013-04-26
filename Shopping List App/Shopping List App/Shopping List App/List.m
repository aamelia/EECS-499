//
//  List.m
//  Shopping List App
//
//  Created by Mia Atkinson on 3/6/13.
//  Copyright (c) 2013 499. All rights reserved.
//

#import "List.h"
#import <MessageUI/MessageUI.h>

@interface List ()
@end

@implementation List
@synthesize listDoc = _listDoc;
@synthesize picker = _picker;
@synthesize activityView = _activityView;
@synthesize queue = _queue;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }    
    return self;
}

- (void) viewDidDisappear:(BOOL)animated
{
    //[_listDoc saveData];
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
        NSLog(@"Made it to here");
        [_listDoc.data.items addObject:newItem];
        //[_listDoc saveData];
        
        //Add the item to allLists
        //[((NSMutableArray*)((ListData*)((ListDoc*)allLists[currentListIndex]).data).items) addObject:newItem];
        
        NSLog(@"Made it to here");

        [self.tableView reloadData];
    }
}

-(void)viewDidAppear:(BOOL)animated
{
    self.navigationItem.title = ((ListData*)((ListDoc*)allLists[currentListIndex]).data).title;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action: @selector(showMessage)];
    
    UIBarButtonItem *exportButton = [[UIBarButtonItem alloc] initWithTitle:@"Export List" style: UIBarButtonItemStyleDone target:self action:@selector(exportMethod:)];
    
    NSArray *myButtonsArray = [[NSArray alloc] initWithObjects:rightButton, exportButton, nil];
    
    self.navigationItem.rightBarButtonItems = myButtonsArray;

}

- (void)exportMethod:(id)sender
{
     UIActionSheet *actionSheet = [[UIActionSheet alloc]
     initWithTitle:@""
     delegate:self
     cancelButtonTitle:@"Cancel"
     destructiveButtonTitle:nil
     otherButtonTitles:@"Export via Email", nil];
     [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == actionSheet.firstOtherButtonIndex + 0)
    {
        [DSBezelActivityView newActivityViewForView:self.navigationController.navigationBar.superview withLabel:@"Exporting List..." width:160];
        /**************/
        NSData *bugData = [_listDoc exportToNSData];
        [DSBezelActivityView removeViewAnimated:YES];
        if (bugData != nil)
        {
            MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
            [picker setSubject:@"My List"];
            [picker addAttachmentData:bugData mimeType:@"application/lists" fileName:[_listDoc getExportFileName]];
            [picker setToRecipients:[NSArray array]];
            [picker setMessageBody:@"Check out this shopping list!  You'll need a copy of ScaryBugs to view this file, then tap and hold to open." isHTML:NO];
            [picker setMailComposeDelegate:self];
            [self presentModalViewController:picker animated:YES];
        }
        /**************/
        
    }
    
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
		  didFinishWithResult:(MFMailComposeResult)result
						error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showItem"])
    {
        ItemViewController *vc = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        int row = [myIndexPath row];
        
        //vc.currentItem = ((ShoppingList *)allLists[currentListIndex]).listItems[row];
        currentItemIndex = row;
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
    return ((NSMutableArray*)((ListData*)((ListDoc*)allLists[currentListIndex]).data).items).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListCell";
    ListCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier forIndexPath: indexPath];
    
    //Configure the cell
    int row = [indexPath row];
    Item *temp = ((NSMutableArray*)((ListData*)((ListDoc*)allLists[currentListIndex]).data).items)[row];
        
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
