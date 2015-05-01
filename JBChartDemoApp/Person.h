//
//  Person.h
//  JBChartDemoApp
//
//  Created by Lance Fallon on 4/30/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

-(id)initWithName:(NSString *)n age:(NSNumber *)a;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;
@end
