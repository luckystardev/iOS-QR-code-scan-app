//
//  DPIDMasterViewController.m
//  NuEra
//
//  Created by matti on 28/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import "DPIDMasterViewController.h"
#import "DPIDDetailViewController.h"
#import "DPIDBarcodeDataController.h"
#import "DPIDBarcode.h"
#import "DPIDAddBarcodeViewController.h"
#import "DPIDWebViewController.h"

/*
@interface DPIDMasterViewController () {
    NSMutableArray *_objects;
}
@end
 */

@implementation DPIDMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
    self.dataController = [[DPIDBarcodeDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.rightBarButtonItem.accessibilityHint = @"Adds a new barcode";
    /*
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DPIDDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
     */
}

- (IBAction)done:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        DPIDAddBarcodeViewController *addController = [segue sourceViewController];
        if (addController.barcode) {
            [self.dataController addBarcodeWithBarcode:addController.barcode];
            [[self tableView] reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (IBAction)cancel:(UIStoryboardSegue *)segue {
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}
*/
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"BarcodeCell";
    
    /*
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
     */
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    DPIDBarcode *barcodeAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:barcodeAtIndex.base64];
    //[[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)barcodeAtIndex.date]];
    return cell;
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
     */
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        //if (!self.detailViewController){
            DPIDWebViewController *webViewController = [[DPIDWebViewController alloc] initWithNibName:@"DetailViewController_iPad" bundle:nil];
            //self.detailViewController = webViewController;
        //}
        
        DPIDBarcode *barcode = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        webViewController.barcode = barcode;
        NSLog(@"SELECT ROW IPAD");
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"ShowBarcodeDetails"]) {
        NSLog(@"Prepare for segue - ShowBarcodeDetails");
        DPIDDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.barcode = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
        
        /*
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
         */
    } else if ([[segue identifier] isEqualToString:@"LookupBarcodeDetails"]) {
        NSLog(@"Prepare for segue - LookupBarcodeDetails");
        DPIDWebViewController *webViewController = [segue destinationViewController];
        webViewController.barcode = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];
            //[self showMessage:webViewController.barcode.base64];
    }
    //[self showMessage:[NSString stringWithFormat:@"%@", [self.tableView indexPathForSelectedRow]]];
}

- (void)showMessage:(NSString *)alertMessage {
    UIAlertView *helloWorldAlert = [[UIAlertView alloc]
                                    initWithTitle:@"Buyah!"
                                    message:alertMessage
                                    delegate:nil
                                    cancelButtonTitle:@"OK"
                                    otherButtonTitles:nil];
    [helloWorldAlert show];
}

@end
