//
//  DPIDWebViewController.h
//  NuEra
//
//  Created by matti on 29/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DPIDBarcode;

@interface DPIDWebViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) DPIDBarcode *barcode;

@end
