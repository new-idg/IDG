//
//  YMAdjectiveOrderViewController.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMAdjectiveOrderViewController.h"
#import "YMSelledSettingTableViewCell.h"
#import "YMAdjectiveOrderBottomView.h"
#import "YMSelledSeetingOrder.h"
#import "YMPayViewController.h"
#import "YMBuyedGoodsViewController.h"

@interface YMAdjectiveOrderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) YMAdjectiveOrderBottomView *bottomView;

@end
static NSString * const YMAdjectiveOrderViewCellIdentity = @"YMAdjectiveOrderViewCellIdentity";
@implementation YMAdjectiveOrderViewController

#pragma mark -- setter && getter
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 133;
        [_tableView registerClass:[YMSelledSettingTableViewCell class] forCellReuseIdentifier:YMAdjectiveOrderViewCellIdentity];
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.barTintColor = [MyPublicClass colorWithHexString:@"#F83030"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    self.navigationItem.title = @"酸菜鱼";
    [self setupSubview];
    [self loadData];
}
#pragma mark -- action
- (void)setupSubview{
    __weak typeof(self) weakSelf = self;

    self.bottomView = [[YMAdjectiveOrderBottomView alloc] initWithFrame:CGRectZero];
    self.bottomView.totalCountLabel.text = @"2";
    self.bottomView.block = ^(NSString *title) {
        if ([title isEqualToString:@"下单"]) {
            YMPayViewController *payViewController = [[YMPayViewController alloc]init];
            payViewController.modalPresentationStyle = UIModalPresentationCustom;
            payViewController.view.backgroundColor = [UIColor colorWithRed:.0 green:.0 blue:.0 alpha:0.5];
            [weakSelf presentViewController:payViewController animated:YES completion:nil];
        }else if ([title isEqualToString:@"购物车"]) {
            YMBuyedGoodsViewController *buyedGoodsViewController = [[YMBuyedGoodsViewController alloc]init];
            buyedGoodsViewController.modalPresentationStyle = UIModalPresentationCustom;
            buyedGoodsViewController.view.backgroundColor = [UIColor colorWithRed:.0 green:.0 blue:.0 alpha:0.5];
            [weakSelf presentViewController:buyedGoodsViewController animated:YES completion:nil];
        }
    };
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-kTabbarHeight - kTabbarSafeBottomMargin);
        make.height.mas_equalTo(50);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(navHigh);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.bottomView.mas_top).mas_offset(-15);
    }];
}
- (void)loadData{
    for (int i = 0; i < 7; i ++) {
        YMSelledSeetingOrder *order = [[YMSelledSeetingOrder alloc] init];
        order.orderResidueStock = [NSString stringWithFormat:@"%d",i];
        [self.dataArray addObject:order];
    }
    [self.tableView reloadData];
}
#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YMSelledSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YMAdjectiveOrderViewCellIdentity forIndexPath:indexPath];
    cell.order = self.dataArray[indexPath.row];
    cell.cellStyle = YMSelledSettingCellStyleNormal;
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
