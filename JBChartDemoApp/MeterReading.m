//
//  Person.m
//  JBChartDemoApp
//
//  Created by Lance Fallon on 4/30/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "MeterReading.h"

@implementation MeterReading

-(id)initWithMeterReadingId:(NSString *)mid dateCaptured:(NSDate *)d meterReadingValue:(NSNumber *)v{
    self = [super init];
    if(self){
        [self setMeterReadingId:mid];
        [self setDateCaptured:d];
        [self setMeterReadingValue:v];
    }
    return self;
}

@end
