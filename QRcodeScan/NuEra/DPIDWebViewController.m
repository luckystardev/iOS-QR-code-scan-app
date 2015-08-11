//
//  DPIDWebViewController.m
//  NuEra
//
//  Created by matti on 29/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import "DPIDWebViewController.h"
#import "DPIDBarcode.h"

@interface DPIDWebViewController ()

@end

static NSString *const URL_BASE = @"http://lookup.nuera-id.com/barcode/view/";

@implementation DPIDWebViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"WVC - viewDidLoad");
	// Do any additional setup after loading the view.
    self.webView.delegate = self;
    [self showCurrentBarcodePage];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	
	// release and set to nil
	self.webView = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showCurrentBarcodePage
{
    // Update the view.
    NSLog(@"WVC - showCurrentBarcodePage");
    if (self.barcode) {
        NSString *url = [URL_BASE stringByAppendingString:self.barcode.base64];
        //[self.webView loadHTMLString:html baseURL:nil];
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    } else {
        // Load dPId Logo page or something?
    }
}

#pragma mark - Managing the barcode

- (void)setBarcode:(id)newBarcode
{
    NSLog(@"WVC - setBarcode");
    if (_barcode != newBarcode) {
        _barcode = newBarcode;
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        [self showCurrentBarcodePage];
    }
}

#pragma mark -
#pragma mark UIViewController delegate methods

- (void)viewWillAppear:(BOOL)animated
{
	self.webView.delegate = self;	// setup the delegate as the web view is shown
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.webView stopLoading];	// in case the web view is still loading its content
	self.webView.delegate = nil;	// disconnect the delegate as the webview is hidden
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// we support rotation in this view controller
	return YES;
}

// this helps dismiss the keyboard when the "Done" button is clicked
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[textField text]]]];
	
	return YES;
}

#pragma mark -
#pragma mark UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
	// starting the load, show the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
	// finished loading, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
	// load error, hide the activity indicator in the status bar
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
	// report the error inside the webview
	NSString* errorString = [NSString stringWithFormat:
							 @"<html><center><font size=+5 color='red'>An error occurred:<br>%@</font></center></html>",
							 error.localizedDescription];
	[self.webView loadHTMLString:errorString baseURL:nil];
}

@end
