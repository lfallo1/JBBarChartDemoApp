//
//  Person.m
//  JBChartDemoApp
//
//  Created by Lance Fallon on 4/30/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "Person.h"

@implementation Person

-(id)initWithName:(NSString *)n age:(NSNumber *)a{
    self = [super init];
    if(self){
        [self setName:n];
        [self setAge:a];
    }
    return self;
}

@end
