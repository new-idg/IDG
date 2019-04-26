//
//  YMMyOrderViewController.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/19.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMMyOrderViewController.h"
#import "YMMyOrderTableViewCell.h"
#import "YMMyOrderHeaderView.h"
#import "YMMyOrderInfo.h"
#import "SPPageMenu.h"

@interface YMMyOrderViewController ()<UITableViewDelegate,UITableViewDataSource,SPPageMenuDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end


static NSString *const YMMyOrderViewCellIdentity = @"YMMyOrderViewCellIdentity";

@implementation YMMyOrderViewController

#pragma mark -- setter && getter
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]  initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 80;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[YMMyOrderTableViewCell class] forCellReuseIdentifier:YMMyOrderViewCellIdentity];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的订单";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubview];
    [self loadData];
}
- (void)setupSubview{
    YMMyOrderHeaderView *headerView = [[YMMyOrderHeaderView alloc] initWithOrderInfo:[YMMyOrderInfo new]];
    headerView.block = ^(NSInteger index) {
        NSLog(@"记录点击的索引:%ld",index);
    };
    [self.view addSubview:headerView];
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(navHigh);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(210);
    }];
    SPPageMenu *pageMenu = [SPPageMenu pageMenuWithFrame:CGRectMake(0, 210, Screen_Width, 45) trackerStyle:SPPageMenuTrackerStyleLine];
    [pageMenu setItems:@[@"排队订单",@"已完成订单"] selectedItemIndex:0];
    pageMenu.delegate = self;
    pageMenu.permutationWay = SPPageMenuPermutationWayNotScrollEqualWidths;
    pageMenu.bridgeScrollView = self.tableView;
    [self.view addSubview:pageMenu];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(210 + 45, 0, 0, 0));
    }];
}
#pragma mark -- load data
- (void)loadData{
    
}
#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  section == 0 ? 1 : 2;
}
- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 53;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc] initWithFrame:CGRectZero];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"22/08/2018  22:20:02     单号：201808221402230001";
    label.font = [UIFont systemFontOfSize:11];
    label.textColor = [UIColor colorWithRed:116/255.0 green:116/255.0 blue:116/255.0 alpha:1];
    [header addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.bottom.mas_equalTo(0);
    }];
    return header;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
    footer.backgroundColor = [UIColor whiteColor];
    UILabel *totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    totalPriceLabel.text = @"共计  $ 12";
    totalPriceLabel.font = [UIFont systemFontOfSize:15];
    totalPriceLabel.textColor = [UIColor colorWithRed:248/255.0 green:48/255.0 blue:48/255.0 alpha:1];
    [footer addSubview:totalPriceLabel];
    [totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(49);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(21);
        make.right.mas_equalTo(-150);
    }];
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [cancelButton setTitle:@"取消订单" forState:UIControlStateNormal];
    [cancelButton setTitleColor:[UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1] forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:13];
    cancelButton.clipsToBounds = YES;
    cancelButton.layer.cornerRadius = 3;
    cancelButton.layer.borderWidth = 1;
    cancelButton.layer.borderColor = [UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1].CGColor;
    [cancelButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [footer addSubview:cancelButton];
    [cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-12);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(28);
    }];
    return footer;
}
- (void)cancelButtonClick{
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YMMyOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YMMyOrderViewCellIdentity forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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