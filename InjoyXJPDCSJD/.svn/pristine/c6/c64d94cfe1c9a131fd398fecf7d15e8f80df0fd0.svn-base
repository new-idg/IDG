//
//  TimeSelectViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/9/20.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "TimeSelectViewController.h"

@interface TimeSelectViewController ()
@property (nonatomic ,strong) UIDatePicker *datePicker;

@end

@implementation TimeSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.view.alpha = 0.5;
    
    [self loadSubView];
}

-(void)loadSubView{
    UIView *seletView = [[UIView alloc]initWithFrame:(CGRectMake(0, self.view.frame.size.height *0.456, self.view.frame.size.width, self.view.frame.size.height *0.544))];
    seletView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:seletView];
    
    CGFloat H = seletView.frame.size.height;
    
    UIView *titleView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0,seletView.frame.size.width , 57))];
    [seletView addSubview:titleView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:(CGRectMake(titleView.frame.size.height, (titleView.frame.size.height-20)/2, titleView.frame.size.width-(titleView.frame.size.height*2), 20))];
    titleLabel.text = @"选择时间";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:17];
    titleLabel.textColor = [MyPublicClass colorWithHexString:@"#333333"];
    [titleView addSubview:titleLabel];
    
    UIButton *clearButton = [[UIButton alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(titleLabel.frame), 0, titleView.frame.size.height-1, titleView.frame.size.height-1))];
    [clearButton setTitle:@"X" forState:(UIControlStateNormal)];
    [clearButton setTitleColor:[MyPublicClass colorWithHexString:@"#B2B2B2"] forState:(UIControlStateNormal)];
    [clearButton addTarget:self action:@selector(dismissView:) forControlEvents:(UIControlEventTouchUpInside)];
    [titleView addSubview:clearButton];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, titleView.frame.size.height-1, titleView.frame.size.width, 1))];
    lineView.backgroundColor = [UIColor grayColor];
//    [MyPublicClass colorWithHexString:@"#EBEBF1"];
    [titleView addSubview:lineView];
    
    
    UIView *timeSelectView = [[UIView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(titleView.frame), seletView.frame.size.width, 45))];
    [seletView addSubview:timeSelectView];
    
    UILabel *leftLabel = [[UILabel alloc]initWithFrame:(CGRectMake(0, (timeSelectView.frame.size.height-20)/2, (timeSelectView.frame.size.width-14)/2, 20))];
    leftLabel.text = @"08-07-2018";
    leftLabel.textAlignment = NSTextAlignmentCenter;
    leftLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16];
    leftLabel.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
    [timeSelectView addSubview:leftLabel];
    leftLabel.backgroundColor = [UIColor redColor];
    
    
    UILabel *centerLabel = [[UILabel alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(leftLabel.frame), (timeSelectView.frame.size.height-14)/2, 14, 14))];
    centerLabel.text = @"至";
    centerLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16];
    centerLabel.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
    [timeSelectView addSubview:centerLabel];
    
    UILabel *rightLabel = [[UILabel alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(centerLabel.frame), (timeSelectView.frame.size.height-20)/2, (timeSelectView.frame.size.width-14)/2, 20))];
    rightLabel.text = @"08-08-2018";
    rightLabel.textAlignment = NSTextAlignmentCenter;
    rightLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16];
    rightLabel.textColor = [UIColor colorWithRed:248/255.0 green:48/255.0 blue:48/255.0 alpha:1];
    [timeSelectView addSubview:rightLabel];
    rightLabel.backgroundColor = [UIColor blueColor];

    self.datePicker = [[UIDatePicker alloc]init];
    self.datePicker.frame = CGRectMake(0, CGRectGetMaxY(timeSelectView.frame), seletView.frame.size.width, H-57-45-64);
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];//zh_CN,en_US
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    [comps setYear:-40];//设置最小时间为：当前时间前推40年
    NSDate *minDate = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    
    [self.datePicker setMinimumDate:minDate];
    
    [comps setYear:+40];//设置最小时间为：当前时间前推40年
    NSDate *maxDate = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    [self.datePicker setMaximumDate:maxDate];
    
    [comps setYear:0];//定位当前时间
    NSDate *date = [calendar dateByAddingComponents:comps toDate:[NSDate date] options:0];
    [self.datePicker setDate:date animated:YES];
    
    
    [seletView addSubview:self.datePicker];
   
}

#pragma mark - 清除界面
-(void)dismissView:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
