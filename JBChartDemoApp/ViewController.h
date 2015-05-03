//
//  ViewController.h
//  JBChartDemoApp
//
//  Created by Lance Fallon on 4/30/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBBarChartView.h"
#import "JBChartView.h"
#import "MeterReading.h"

@interface ViewController : UIViewController <JBBarChartViewDelegate, JBBarChartViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *filterTextField;

@end

