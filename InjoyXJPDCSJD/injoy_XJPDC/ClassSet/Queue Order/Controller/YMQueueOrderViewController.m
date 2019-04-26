//
//  YMQueueOrderViewController.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMQueueOrderViewController.h"
#import "YMQueueOrderTableViewCell.h"
#import "YMQueueOrderFooterView.h"


@interface YMQueueOrderViewController ()<UITableViewDelegate,UITableViewDataSource,YMQueueOrderFooterViewDelegate>

@property (nonatomic, strong) UITableView *tableView;


@end

static NSString *const YMQueueOrderTableViewCellIdentity = @"YMQueueOrderTableViewCellIdentity";
static NSString *const YMQueueOrderFooterViewIdentity = @"YMQueueOrderFooterViewIdentity";


@implementation YMQueueOrderViewController

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50;
        _tableView.keyboardDismissMode=UIScrollViewKeyboardDismissModeOnDrag;
        [_tableView registerClass:[YMQueueOrderTableViewCell class] forCellReuseIdentifier:YMQueueOrderTableViewCellIdentity];
        [_tableView registerClass:[YMQueueOrderFooterView class] forHeaderFooterViewReuseIdentifier:YMQueueOrderFooterViewIdentity];
        [self.view addSubview:_tableView];

    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.barTintColor = [MyPublicClass colorWithHexString:@"#F83030"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    self.navigationItem.title = @"悠然奶茶";
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(0);
    }];
}
- (void)queueOrderFooterViewSelectedIIndex:(NSInteger)index{
    NSLog(@"点击的是%ld",index);
}
#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 200;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc] initWithFrame:CGRectZero];
    UILabel *orderNumberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    orderNumberLabel.backgroundColor = [UIColor whiteColor];
    orderNumberLabel.text = [NSString stringWithFormat:@"排队号:%ld",section];
    [header addSubview:orderNumberLabel];
    [orderNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(11);
        make.centerY.mas_equalTo(0);
    }];
    UIButton *locationButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [locationButton setBackgroundImage:[UIImage imageNamed:@"arrows-up"] forState:UIControlStateNormal];
    [header addSubview:locationButton];
    [locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
    }];
    UIButton *buleToothButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [buleToothButton setBackgroundImage:[UIImage imageNamed:@"arrows-up"] forState:UIControlStateNormal];
    [header addSubview:buleToothButton];
    [buleToothButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(locationButton.mas_left).mas_offset(-11);
        make.centerY.mas_equalTo(0);
    }];
    return header;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    YMQueueOrderFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:YMQueueOrderFooterViewIdentity];
    footer.contentView.backgroundColor = [UIColor whiteColor];
    footer.delegate = self;
    return footer;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YMQueueOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YMQueueOrderTableViewCellIdentity forIndexPath:indexPath];
    return cell;
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
