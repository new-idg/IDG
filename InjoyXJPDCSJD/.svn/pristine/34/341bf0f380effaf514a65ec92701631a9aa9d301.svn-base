//
//  PickerViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/9/25.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@property (weak, nonatomic) IBOutlet UILabel *leftTime;
@property (weak, nonatomic) IBOutlet UIView *leftLine;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (weak, nonatomic) IBOutlet UILabel *rightTime;
@property (weak, nonatomic) IBOutlet UIView *rightLine;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (weak, nonatomic) IBOutlet UIPickerView *datePickerView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;


/** 年 */
@property (nonatomic ,strong) NSMutableArray *yearArray;
@property (nonatomic ,assign) NSInteger yearIndex;
@property (nonatomic ,strong) NSString *yearString;
/** 月 */
@property (nonatomic ,strong) NSMutableArray *monthArray;
@property (nonatomic ,assign) NSInteger monthIndex;
@property (nonatomic ,strong) NSString *monthString;

/** 日 */
@property (nonatomic ,strong) NSMutableArray *dayArray;
@property (nonatomic ,assign) NSInteger dayIndex;
@property (nonatomic ,strong) NSString *dayString;

@property (nonatomic ,assign) BOOL isSelect;

@end

@implementation PickerViewController

- (NSMutableArray *)yearArray{
    if (!_yearArray) {
        
        _yearArray = [NSMutableArray array];
        
        for (int year = 1979; year <2179; year++) {
            NSString *yearString = [NSString stringWithFormat:@"%d年",year];
            [_yearArray addObject:yearString];
        }
    }
    return _yearArray;
}

- (NSMutableArray *)monthArray{
    if (!_monthArray) {
        _monthArray = [NSMutableArray array];
        
        for (int month = 1; month <= 12; month++) {
            NSString *monthString = [NSString stringWithFormat:@"%d月",month];
            [_monthArray addObject:monthString];
        }
    }
    return _monthArray;
}

- (NSMutableArray *)dayArray{
    if (!_dayArray) {
        _dayArray = [NSMutableArray array];
        for (int day = 1; day <= 31; day++) {
            NSString *dayString = [NSString stringWithFormat:@"%d日",day];
            [_dayArray addObject:dayString];
        }
        
    }
    return _dayArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [MyPublicClass layerMasksToBoundsForAnyControls:self.submitButton cornerRadius:4 borderColor:nil borderWidth:0];
    
    self.datePickerView.delegate = self;
    self.datePickerView.dataSource = self;
    
    [self.closeButton addTarget:self action:@selector(closeView:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.leftButton addTarget:self action:@selector(selectTime:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.rightButton addTarget:self action:@selector(selectTime:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.submitButton addTarget:self action:@selector(submitTime:) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self getCurrentDate];
}
-(void)getCurrentDate{
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    
    unsigned unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |  NSCalendarUnitDay |
    NSCalendarUnitHour |  NSCalendarUnitMinute |
    NSCalendarUnitSecond | NSCalendarUnitWeekday;
    
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:[NSDate date]];
    //定位当天年月日 展示
    _yearIndex = [self.yearArray indexOfObject:[NSString stringWithFormat:@"%ld年",dateComponent.year]];
    _monthIndex = [self.monthArray indexOfObject:[NSString stringWithFormat:@"%ld月",dateComponent.month]];
    _dayIndex = [self.dayArray indexOfObject:[NSString stringWithFormat:@"%ld日",dateComponent.day]];
    
    [self.datePickerView selectRow:_yearIndex inComponent:2 animated:YES];
    [self.datePickerView selectRow:_monthIndex inComponent:1 animated:YES];
    [self.datePickerView selectRow:_dayIndex inComponent:0 animated:YES];
    
//    左右label选择显示的判断
    _isSelect = YES;
    
    
    _dayString = [self.dayArray objectAtIndex:_dayIndex];
    _monthString = [self.monthArray objectAtIndex:_monthIndex];
    _yearString = [self.yearArray objectAtIndex:_yearIndex];
//    初始化左边日期显示--显示当前日期
    self.leftTime.text = [NSString stringWithFormat:@"%02d-%02d-%d",_dayString.intValue,_monthString.intValue,_yearString.intValue];
    self.rightTime.text = [NSString stringWithFormat:@""];
    [self selectLabel:self.leftTime selectLine:self.leftLine unselectLabel:self.rightTime unselectLine:self.rightLine];
    
    [self refreshDay];
}
#pragma mark - 有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component __TVOS_PROHIBITED{
    return 45;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component __TVOS_PROHIBITED{
    return self.view.frame.size.width/3;
}
#pragma mark - 判断对应列有多少数据
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {
        return _dayArray.count;
    }else if (component == 1){
        return _monthArray.count;
    }else{
        return _yearArray.count;
    }
}
#pragma mark - 将数据展示对应的列
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        
        NSString * day = [_dayArray objectAtIndex:row];
        return day;
        
    }else if (component == 1){
        
        NSString * month = [_monthArray objectAtIndex:row];
        
        return month;
        
    }else{
        NSString * year = [_yearArray objectAtIndex:row];
        return year;
    }
}
#pragma mark - 点击或滚动时间选择器时
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
        
        _dayIndex = row;
        _dayString =   [self.dayArray objectAtIndex:row];
    }else if (component == 1){
        
        _monthIndex = row;
        [self refreshDay];
        _monthString = [self.monthArray objectAtIndex:row];
        
    }else{
        _yearIndex = row;
        [self refreshDay];
        _yearString = [self.yearArray objectAtIndex:row];
        
    }
    if (_isSelect == YES) {
        self.leftTime.text = [NSString stringWithFormat:@"%02d-%02d-%d",self.dayString.intValue,self.monthString.intValue,self.yearString.intValue];
    }else{
        self.rightTime.text = [NSString stringWithFormat:@"%02d-%02d-%d",self.dayString.intValue,self.monthString.intValue,self.yearString.intValue];
    }
}
#pragma mark - 自定义时间选择器label
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *titleLbl = [[UILabel alloc]init];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    titleLbl.font = [UIFont systemFontOfSize:16];
    
    if (component == 0) {
        
        NSString * day = [_dayArray objectAtIndex:row];
        titleLbl.text = day;
    }else if (component == 1){
        
        NSString * month = [_monthArray objectAtIndex:row];
        titleLbl.text = month;
    }else{
        NSString * year = [_yearArray objectAtIndex:row];
        titleLbl.text = year;
    }
    
    
    return titleLbl;
}

#pragma mark - 点击月和年时 刷新日的数据
- (void)refreshDay {
    NSMutableArray *arr = [NSMutableArray array];
    
    NSString *year = [self.yearArray objectAtIndex:_yearIndex];
    NSString *month = [self.monthArray objectAtIndex:_monthIndex];
    for (int i = 1; i < [self getDayNumber:year.integerValue month:month.integerValue].integerValue + 1; i ++) {
        [arr addObject:[NSString stringWithFormat:@"%d日", i]];
    }
    
    self.dayArray = arr;
    [self.datePickerView reloadComponent:0];
    
//    当月份为2月28日 点击其他月份 天数无法跟随的问题
    NSInteger row = [self.datePickerView selectedRowInComponent:0];
    _dayString =   [self.dayArray objectAtIndex:row];

    
}
#pragma mark - 计算闰年和平年
- (NSString *)getDayNumber:(NSInteger)year month:(NSInteger)month{
    NSArray *days = @[@"31", @"28", @"31", @"30", @"31", @"30", @"31", @"31", @"30", @"31", @"30", @"31"];
    if (2 == month && 0 == (year % 4) && (0 != (year % 100) || 0 == (year % 400))) {
        return @"29";
    }
    return days[month - 1];
}
#pragma mark - 日期选择按钮
-(void)selectTime:(UIButton *)sender{
    switch (sender.tag) {
        case 101:{
            [self selectLabel:self.leftTime selectLine:self.leftLine unselectLabel:self.rightTime unselectLine:self.rightLine];
            _isSelect = YES;
        }
            break;
        case 102:{
            [self selectLabel:self.rightTime selectLine:self.rightLine unselectLabel:self.leftTime unselectLine:self.leftLine];
            _isSelect = NO;
        }
            break;
        default:
            break;
    }
}

-(void)selectLabel:(UILabel *)selectLabel selectLine:(UIView *)selectLine unselectLabel:(UILabel *)unselectLabel unselectLine:(UIView *)unselectLine{
    
    selectLabel.textColor = [MyPublicClass colorWithHexString:@"#F83030"];
    selectLine.backgroundColor = [MyPublicClass colorWithHexString:@"#F83030"];
    unselectLabel.textColor = [MyPublicClass colorWithHexString:@"#111111"];
    unselectLine.backgroundColor = [MyPublicClass colorWithHexString:@"#AAAAAA"];
    
}

-(void)submitTime:(UIButton *)sender{
    
    if ([MyPublicClass stringIsNull:self.leftTime.text]) {
        return;
    }
    if ([MyPublicClass stringIsNull:self.rightTime.text]) {
        return;
    }
    NSMutableDictionary *timeDic = [[NSMutableDictionary alloc]init];
    [timeDic setValue:self.leftTime.text forKey:@"leftTime"];
    [timeDic setValue:self.rightTime.text forKey:@"rightTime"];
    
    if ([self.delegate respondsToSelector:@selector(showTime:)]) {
        [self.delegate showTime:timeDic];
        [self dismissView];
    }
    
}

-(void)closeView:(UIButton *)sender{
    [self dismissView];
}
-(void)dismissView{
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
