//
//  DPIDDetailViewController.h
//  NuEra
//
//  Created by matti on 28/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DPIDBarcode;

@interface DPIDDetailViewController : UITableViewController

@property (strong, nonatomic) DPIDBarcode *barcode;
@property (weak, nonatomic) IBOutlet UILabel *barcodeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
