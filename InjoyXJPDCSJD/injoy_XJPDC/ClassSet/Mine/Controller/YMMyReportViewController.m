//
//  YMMyReportViewController.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2019/1/4.
//  Copyright © 2019 CX. All rights reserved.
//

#import "YMMyReportViewController.h"
#import "PickerViewController.h"


@interface YMMyReportViewController ()<PickerViewDelegate>

@end

@implementation YMMyReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的报表";
    self.view.backgroundColor = RGBACOLOR(247, 247, 247, 1);
    [self setupSubview];
}
- (void)setupSubview{
    UILabel *selectedDateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    selectedDateLabel.text = @"筛选日期:";
    selectedDateLabel.font = [UIFont systemFontOfSize:14];
    selectedDateLabel.textColor = RGBACOLOR(51, 51, 51, 1);
    [self.view addSubview:selectedDateLabel];
    [selectedDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(navHigh + 10);
        make.height.mas_equalTo(45);
        make.width.mas_equalTo(100);
    }];
    UIButton *selectedDateButton = [[UIButton alloc] initWithFrame:CGRectZero];
    selectedDateButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [selectedDateButton setTitle:@"01-10-2011 至 01-01-2011" forState:UIControlStateNormal];
    [selectedDateButton setTitleColor:RGBACOLOR(51, 51, 51, 1) forState:UIControlStateNormal];
    [selectedDateButton addTarget:self action:@selector(selectedDateButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectedDateButton];
    [selectedDateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(selectedDateLabel.mas_top);
        make.height.mas_equalTo(selectedDateLabel.mas_height);
        make.left.mas_equalTo(selectedDateLabel.mas_right).mas_offset(0);
        make.right.mas_equalTo(-15);
    }];
    
    
}
- (void)selectedDateButtonClick:(UIButton *)sender{
    PickerViewController *timeSelectView = [[PickerViewController alloc]init];
    timeSelectView.delegate = self;
    timeSelectView.modalPresentationStyle = UIModalPresentationCustom;
    timeSelectView.view.backgroundColor = [UIColor colorWithRed:.0 green:.0 blue:.0 alpha:0.5];
    [self presentViewController:timeSelectView animated:YES completion:nil];
}
#pragma mark --PickerViewDelegate
- (void)showTime:(NSDictionary *)timeDictionary{
    NSLog(@"选择的时间:%@",timeDictionary);
}
#pragma mark -- CXListViewDelegate,CXListViewDataSource

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