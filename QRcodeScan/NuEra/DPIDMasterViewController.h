//
//  DPIDMasterViewController.h
//  NuEra
//
//  Created by matti on 28/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DPIDDetailViewController;
@class DPIDBarcodeDataController;

@interface DPIDMasterViewController : UITableViewController

@property (strong, nonatomic) DPIDDetailViewController *detailViewController;
@property (strong, nonatomic) DPIDBarcodeDataController *dataController;

- (IBAction)done:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;

@end
