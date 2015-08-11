//
//  DPIDBarcode.h
//  NuEra
//
//  Created by matti on 28/03/13.
//  Copyright (c) 2013 matti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DPIDBarcode : NSObject
@property () long idNum;
@property (nonatomic, copy) NSString *base64;

/*
@property (nonatomic, strong) NSDate *date; // Just for education
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *location;
*/
 
//-(id)initWithName:(NSString *)name location:(NSString *)location date:(NSDate *)date;
-(id)initWithBase64:(NSString *)base64;

@end
