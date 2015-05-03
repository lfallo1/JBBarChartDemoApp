//
//  Person.h
//  JBChartDemoApp
//
//  Created by Lance Fallon on 4/30/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
 *@brief MeterReading interface
 */
@interface MeterReading : NSObject

/*!
 *@discussion initializes a MeterReading object with a meterReadingId and dateCaptured
 *@param n An NSString representing the person's meterReadingId
 *@param a An NSDate representing the person's dateCaptured
 */
-(id)initWithMeterReadingId:(NSString *)mid dateCaptured:(NSDate *)d meterReadingValue:(NSNumber *)v;

/*!
 *@brief The meterReadingId attribute for the MeterReading class
 */
@property (nonatomic, strong) NSString *meterReadingId;

/**
 @brief The date captured attribute for the MeterReading class
 */
@property (nonatomic, strong) NSDate *dateCaptured;

@property (nonatomic, strong) NSNumber *meterReadingValue;
@end
