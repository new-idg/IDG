//
//  YMMineTableViewController.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMMineTableViewController.h"

@interface YMMineTableViewController ()

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *titleArray;

@end

static NSString *const YMMineTableViewCellIdentity = @"YMMineTableViewCellIdentity";

@implementation YMMineTableViewController


#pragma mark -- setter && getter
- (NSArray *)imageArray{
    if (_imageArray == nil) {
        _imageArray = @[[UIImage imageNamed:@"myBankCard"],
                        [UIImage imageNamed:@"myBill"],
                        [UIImage imageNamed:@"contactUs"],
                        [UIImage imageNamed:@"contactUs"],
                        [UIImage imageNamed:@"contactUs"]];
    }
    return _imageArray;
}
- (NSArray *)titleArray{
    if (_titleArray == nil) {
        _titleArray = @[@"我的订单",@"我的账单",@"我的报表",@"我的银行卡",@"联系我们"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    self.tableView.tableHeaderView =
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:YMMineTableViewCellIdentity];
    
  
}

#pragma mark - Tableview delegate && datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 1 ? 1 : 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 48;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return  section == 0 ? 10 : 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *pushViewController;
    if (indexPath.section == 1) {//设置

    } else {
        if (indexPath.row == 0) {//我的订单
            
        } else if (indexPath.row == 1) {//我的账单
            
        }else if (indexPath.row == 2) {//我的报表
            
        }else if (indexPath.row == 3) {//我的银行卡
            
        }else if (indexPath.row == 4) {//联系我们
            
        }
    }
}

@end
