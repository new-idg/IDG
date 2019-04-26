//
//  YMBuyedGoodsViewController.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2019/1/7.
//  Copyright © 2019 CX. All rights reserved.
//

#import "YMBuyedGoodsViewController.h"

@interface YMBuyedGoodsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end
static NSString *const YMBuyedGoodsViewCellIdentity = @"YMBuyedGoodsViewCellIdentity";
@implementation YMBuyedGoodsViewController
#pragma mark -- setter && getter
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 50;
        _tableView.estimatedSectionHeaderHeight = .0;
   
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:YMBuyedGoodsViewCellIdentity];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubview];
    [self loadData];
}
- (void)setupSubview{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(223);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-kTabbarSafeBottomMargin - kTabbarHeight - 50);
    }];
}
- (void)loadData{
    
}
#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 1 : 3;
}
- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return section == 0 ? 44 : 0;
    if (section == 0) {
        return 44;
    } else {
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section != 0) {
        return nil;
    }
    UIView *header = [[UIView alloc] initWithFrame:CGRectZero];
    UILabel *countLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    countLabel.text = @"已选商品 (共3份)";
    [header addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(0);
    }];
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [closeButton setTitle:@"清空" forState:UIControlStateNormal];
    [closeButton setTitleColor:[UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1.0] forState:UIControlStateNormal];
    closeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [closeButton addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [header addSubview:closeButton];
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
//        make.width.height.mas_equalTo(15);
    }];
    return header;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
    footer.backgroundColor = RGBACOLOR(237, 237, 237, 1);
    return footer;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YMBuyedGoodsViewCellIdentity forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"鱼香肉丝"];
    
    return cell;
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
