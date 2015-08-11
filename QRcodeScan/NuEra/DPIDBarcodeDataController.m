//
//  DPIDBarcodeDataController.m
//  NuEra
//
//  Created by matti on 28/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import "DPIDBarcodeDataController.h"
#import "DPIDBarcode.h"

@interface DPIDBarcodeDataController()
-(void)initializeDefaultDataList;
@end

@implementation DPIDBarcodeDataController

- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

- (void)initializeDefaultDataList {
    NSMutableArray *barcodeList = [[NSMutableArray alloc] init];
    self.masterBarcodeList = barcodeList;
    DPIDBarcode *barcode;
    //NSDate *today = [NSDate date];
    NSArray *array = [NSArray arrayWithObjects:
                      @"t44wiKiAK6WCB6Z3BC_hPA==",
                      @"cLSPbhJyWl1E1akcz8KyVw==",
                      //0x70B48F6E12725A5D44D5A91CCFC2B257
                      @"aNzY1CKObg0AjMbAHXnfaA==",
                      @"vjIaJUU2hr0a1fgX-TXTwA==",
                      @"0FJkmDOO25YK3m537Rmd4w==",
                      @"0vEiirWblikh2GJGOiRQlA==",
                      @"YbkXEfnxdH_yicBMr1YNCg==",
                      nil];
    for (NSString *code in array) {
        barcode = [[DPIDBarcode alloc] initWithBase64:code];
        [self addBarcodeWithBarcode:barcode];
    }
}

- (void)setMasterBarcodeList:(NSMutableArray *)newList {
    if (_masterBarcodeList != newList) {
        _masterBarcodeList = [newList mutableCopy];
    }
}

- (NSUInteger)countOfList {
    return [self.masterBarcodeList count];
}

- (DPIDBarcode *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterBarcodeList objectAtIndex:theIndex];
}

- (void) addBarcodeWithBarcode:(DPIDBarcode *)barcode {
    [self.masterBarcodeList addObject:barcode];
}


@end
