//
//  DPIDMenuViewController.m
//  NuEra
//
//  Created by matti on 29/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import "DPIDMenuViewController.h"
#import "DPIDWebViewController.h"

@interface DPIDMenuViewController ()

@end

@implementation DPIDMenuViewController
@synthesize resultImage, resultText;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction) scanButtonTapped {
    NSLog(@"TBD: scan barcode here...");
    
    /* ZBar example, not used as ZBar doesn't support DataMatrix.
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: More config here
    
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    [self presentModalViewController: reader
                       animated:YES];
     */
}

- (void) imagePickerController: (UIImagePickerController *)reader
 didFinishPickingMediaWithInfo: (NSDictionary *)info {
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    
    resultText.text = symbol.data;
    resultImage.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    [reader dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
