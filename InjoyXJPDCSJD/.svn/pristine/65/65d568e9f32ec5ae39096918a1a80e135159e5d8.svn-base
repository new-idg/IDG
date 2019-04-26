//
//  YMPayViewController.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2019/1/7.
//  Copyright © 2019 CX. All rights reserved.
//

#import "YMPayViewController.h"

@interface YMPayViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end
static NSString *const YMPayViewImageKey = @"YMPayViewImageKey";
static NSString *const YMPayViewTitleKey = @"YMPayViewTitleKey";
static NSString *const YMPayViewCellIdentity = @"YMPayViewCellIdentity";

@implementation YMPayViewController
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain
                      ];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 45;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:YMPayViewCellIdentity];
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = @[@{YMPayViewImageKey:[UIImage imageNamed:@"weChat"],YMPayViewTitleKey:@"现金支付"},
                       @{YMPayViewImageKey:[UIImage imageNamed:@"weChat"],YMPayViewTitleKey:@"扫码支付"},
                       @{YMPayViewImageKey:[UIImage imageNamed:@"weChat"],YMPayViewTitleKey:@"其他支付"}
                       ];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-kTabbarSafeBottomMargin);
        make.height.mas_equalTo(260);
    }];
}
#pragma mark --UITableViewDelegate,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 57;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *header = [[UIView alloc] initWithFrame:CGRectZero];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.text = @"选择支付方式";
    [header addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [closeButton setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:closeButton];
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(15);
    }];
    return header;
}
-(CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 64;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
    UIButton *sureButton = [[UIButton alloc] initWithFrame:CGRectZero];
    sureButton.backgroundColor = [UIColor colorWithRed:250/255.0 green:69/255.0 blue:45/255.0 alpha:1.0];
    sureButton.clipsToBounds = YES;
    [sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [sureButton setTitle:@"确定" forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    sureButton.layer.cornerRadius = 2;
    [footer addSubview:sureButton];
    [sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-12);
        make.height.mas_equalTo(40);
        make.left.mas_equalTo(16);
        make.right.mas_equalTo(-14);
    }];
    return footer;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YMPayViewCellIdentity forIndexPath:indexPath];
    cell.imageView.image = self.dataArray[indexPath.row][@"YMPayViewImageKey"];
    cell.textLabel.text = self.dataArray[indexPath.row][@"YMPayViewTitleKey"];
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sc_circle_normal"] highlightedImage:[UIImage imageNamed:@"sc_circle_selected"]];
    return cell;
}
- (void)sureButtonClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)closeButtonClick{
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
