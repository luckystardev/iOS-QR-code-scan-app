//
//  DPIDMenuViewController.h
//  NuEra
//
//  Created by matti on 29/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DPIDMenuViewController : UIViewController <ZBarReaderDelegate>
{
    //UIImageView *resultImage;
    //UITextView *resultText;
}

@property (retain, nonatomic) IBOutlet UIImageView *resultImage;
@property (retain, nonatomic) IBOutlet UITextField *resultText;

- (IBAction) scanButtonTapped;

@end
