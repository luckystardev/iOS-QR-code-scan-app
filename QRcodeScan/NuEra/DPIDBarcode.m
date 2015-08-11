//
//  DPIDBarcode.m
//  NuEra
//
//  Created by matti on 28/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import "DPIDBarcode.h"

@implementation DPIDBarcode

-(id)initWithBase64:(NSString *)base64 {
    self = [super init];
    if(self) {
        _base64 = base64;
        return self;
    }
    return nil;
}


@end
