//
//  DPIDBarcodeDataController.h
//  NuEra
//
//  Created by matti on 28/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DPIDBarcode;

@interface DPIDBarcodeDataController : NSObject

@property (nonatomic, copy) NSMutableArray *masterBarcodeList;

- (NSUInteger)countOfList;
- (DPIDBarcode *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addBarcodeWithBarcode:(DPIDBarcode *)barcode;

@end
