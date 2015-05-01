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
    NSMutableArray *personList;
}
@property (nonatomic, strong) JBBarChartView *barChartView;
@property (weak, nonatomic) IBOutlet UIView *chartViewParent;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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

#pragma mark - JBBarChartViewDataSource

- (NSUInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    return [personList count];
}

- (void)barChartView:(JBBarChartView *)barChartView didSelectBarAtIndex:(NSUInteger)index touchPoint:(CGPoint)touchPoint
{
    NSString *valueName = [[personList objectAtIndex:index]name];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Name" message:valueName delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark - JBBarChartViewDelegate
- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtIndex:(NSUInteger)index
{
    return [[[personList objectAtIndex:index] age] floatValue];
}



- (UIColor *)barChartView:(JBBarChartView *)barChartView colorForBarViewAtIndex:(NSUInteger)index
{
    if([[personList objectAtIndex:index] age] > [NSNumber numberWithInt:40]){
        return [UIColor redColor];
    }
    else if ([[personList objectAtIndex:index] age] > [NSNumber numberWithInt:30]){
        return [UIColor orangeColor];
    }
    else{
        return [UIColor yellowColor];
    }
}
- (IBAction)addMorePeople:(id)sender {
    [personList addObject:[[Person alloc]initWithName:@"Lance" age:@28]];
    [personList addObject:[[Person alloc]initWithName:@"Bill" age:@38]];
    [personList addObject:[[Person alloc]initWithName:@"Ralph" age:@18]];
    [personList addObject:[[Person alloc]initWithName:@"John" age:@24]];
    [personList addObject:[[Person alloc]initWithName:@"Tony" age:@42]];
    
    [self.barChartView reloadData];
}

-(void)populatePersonList{
    personList = [[NSMutableArray alloc]init];
    [personList addObject:[[Person alloc]initWithName:@"Lance" age:@28]];
    [personList addObject:[[Person alloc]initWithName:@"Bill" age:@38]];
    [personList addObject:[[Person alloc]initWithName:@"Ralph" age:@18]];
    [personList addObject:[[Person alloc]initWithName:@"John" age:@24]];
    [personList addObject:[[Person alloc]initWithName:@"Tony" age:@42]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
