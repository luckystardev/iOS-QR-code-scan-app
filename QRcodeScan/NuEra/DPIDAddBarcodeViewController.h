//
//  DPIDAddBarcodeViewController.h
//  NuEra
//
//  Created by matti on 29/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DPIDBarcode;

@interface DPIDAddBarcodeViewController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *barcodeNameInput;
@property (weak, nonatomic) IBOutlet UITextField *locationInput;
@property (strong, nonatomic) DPIDBarcode *barcode;

@end
