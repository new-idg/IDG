//
//  YMParameterSettingViewController.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2019/1/4.
//  Copyright © 2019 CX. All rights reserved.
//

#import "YMParameterSettingViewController.h"
#import "YMParameterSettingCell.h"

/*
@interface YMParameterSettingCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *moneyLabel;
@property (nonatomic, strong) UISwitch *moneySwitch;

@end

@implementation YMParameterSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.text = @"辣不辣 aaaaaaaaa";
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(13);
        make.centerY.mas_equalTo(0);
    }];
    self.moneySwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.moneySwitch];
    [self.moneySwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-13);
        make.centerY.mas_equalTo(0);
    }];
    self.moneyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.moneyLabel.text = @"+$2.00";
    self.moneyLabel.font = [UIFont systemFontOfSize:15];
    self.moneyLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.moneyLabel];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(5);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(self.moneySwitch.mas_left).mas_offset(-20);
    }];
}
@end

*/

@interface YMParameterSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end
static NSString *const YMParameterSettingViewCellIdentity = @"YMParameterSettingViewCellIdentity";
@implementation YMParameterSettingViewController

#pragma mark -- setter && getter
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 40;
        _tableView.backgroundColor = RGBACOLOR(247, 247, 247, 1);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[YMParameterSettingCell class] forCellReuseIdentifier:YMParameterSettingViewCellIdentity];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
        label.text = @"菜品参数售完设置";
        label.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        label.font = [UIFont systemFontOfSize:12];
        _tableView.tableHeaderView = label;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
- (NSArray *)dataArray{
    if (_dataArray == nil) {
        NSDictionary *dic0 = @{@"title":@"辣度 pungency degree",
                               @"parameters":@[@"辣",@"不辣"]};
        NSDictionary *dic1 = @{@"title":@"加料 additional option",
                               @"parameters":@[@"加",@"不加"]};
        _dataArray = @[dic0,dic1];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"参数设置";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger )numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    label.text = [NSString stringWithFormat:@"   %@",self.dataArray[section][@"title"]];
    return label;
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *dictionary = self.dataArray[section];
    NSArray *array = dictionary[@"parameters"];
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YMParameterSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:YMParameterSettingViewCellIdentity forIndexPath:indexPath];
    NSArray *array = self.dataArray[indexPath.section][@"parameters"];
    cell.titleLabel.text = array[indexPath.row];
    CGFloat money = arc4random() %256 / 256.0 + 0.5;
    cell.moneyLabel.text = [NSString stringWithFormat:@"%.2f",money];
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
