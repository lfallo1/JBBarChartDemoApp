//
//  ViewController.m
//  JBChartDemoApp
//
//  Created by Lance Fallon on 4/30/15.
//  Copyright (c) 2015 Lance Fallon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *meterReadingList;
    NSMutableArray *filteredMeterReadingList;
    NSArray *names;
}
@property (nonatomic, strong) JBBarChartView *barChartView;
@property (weak, nonatomic) IBOutlet UIView *chartViewParent;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self generateNames];

    meterReadingList = [[NSMutableArray alloc]init];
    //populate array
    [self populatePersonList];
    
    self.chartViewParent.backgroundColor = [UIColor blackColor];
    self.barChartView = [[JBBarChartView alloc] init];
    self.barChartView.frame = CGRectMake(10.0f, 10.0f, self.chartViewParent.bounds.size.width, 250.0f);
    self.barChartView.delegate = self;
    self.barChartView.dataSource = self;
    self.barChartView.minimumValue = 0.0f;
    self.barChartView.inverted = NO;
    self.barChartView.backgroundColor = [UIColor lightGrayColor];
    
    [self.chartViewParent addSubview:self.barChartView];
    [self.barChartView reloadData];
}

-(void)generateNames{
    NSBundle *namesBundle = [NSBundle mainBundle];
    NSString *plistPath = [namesBundle pathForResource:@"names" ofType:@"plist"];
    names = [[NSArray alloc]initWithContentsOfFile:plistPath];
}

#pragma mark - JBBarChartViewDataSource

- (NSUInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    return [filteredMeterReadingList count];
}

- (void)barChartView:(JBBarChartView *)barChartView didSelectBarAtIndex:(NSUInteger)index touchPoint:(CGPoint)touchPoint
{
    MeterReading *p = [filteredMeterReadingList objectAtIndex:index];
    NSString *valueName = [NSString stringWithFormat:@"%@ - %@", [p meterReadingId], [p dateCaptured]];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Meter Reading" message:valueName delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark - JBBarChartViewDelegate
- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtIndex:(NSUInteger)index
{
    return [[[filteredMeterReadingList objectAtIndex:index] meterReadingValue] floatValue];
}



- (UIColor *)barChartView:(JBBarChartView *)barChartView colorForBarViewAtIndex:(NSUInteger)index
{
    if([[filteredMeterReadingList objectAtIndex:index] meterReadingValue] > [NSNumber numberWithInt:85000]){
        return [UIColor redColor];
    }
    else if ([[filteredMeterReadingList objectAtIndex:index] meterReadingValue] > [NSNumber numberWithInt:45000]){
        return [UIColor orangeColor];
    }
    else{
        return [UIColor yellowColor];
    }
}

-(void)populatePersonList{
    for(int i = 0; i < 155; i++){
        uint countOfIds = [[NSNumber numberWithInteger:[names count]]unsignedIntValue];
        NSString *meterReadingId = [names objectAtIndex: arc4random_uniform(countOfIds)];
        NSDate *dateCaptured = [[NSDate date] dateByAddingTimeInterval:-60*60*24*365*[[NSNumber numberWithUnsignedInt: arc4random_uniform(50)]intValue] + 18];
        NSNumber *value = [NSNumber numberWithUnsignedInt:arc4random_uniform(99999) + 10000];
        [meterReadingList addObject:[[MeterReading alloc]initWithMeterReadingId:meterReadingId dateCaptured:dateCaptured meterReadingValue:value]];
        filteredMeterReadingList = [[NSMutableArray alloc]initWithArray: meterReadingList];
    }
}

- (IBAction)filterButtonClicked:(UIButton *)sender {
    NSNumber *meterReadingValueFilter =  [NSNumber numberWithInteger:[self.filterTextField.text integerValue]];
    if(meterReadingValueFilter != nil){
        NSPredicate *agePredicate = [NSPredicate predicateWithFormat:@"meterReadingValue >= %@",meterReadingValueFilter];
        filteredMeterReadingList = [[NSMutableArray alloc]initWithArray: [meterReadingList filteredArrayUsingPredicate:agePredicate]];
        [self.barChartView reloadData];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.filterTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
