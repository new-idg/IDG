//
//  BankCardDetailViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/18.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "BankCardDetailViewController.h"
#import "MyBankCardTableViewCell.h"

#import "AuthenticationViewController.h"

@interface BankCardDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation BankCardDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"银行卡详情";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(lineView.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(lineView.frame))) style:(UITableViewStyleGrouped)];
    self.tableView.backgroundColor = RGBA(247, 247, 247, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 124;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [self loadFooterView];
}


-(UIView *)loadFooterView{
    
    UIView *footView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 100))];
    footView.backgroundColor =  RGBA(247, 247, 247, 1);
    
    UIButton *selectBank = [[UIButton alloc]initWithFrame:(CGRectMake(15, 50, footView.frame.size.width-30, footView.frame.size.height-50))];
    selectBank.backgroundColor = [UIColor whiteColor];
    [selectBank setTitle:@"解除绑定" forState:(UIControlStateNormal)];
    [selectBank setTitleColor:[MyPublicClass colorWithHexString:@"#FF3E3E"] forState:(UIControlStateNormal)];
    selectBank.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16];
    [selectBank addTarget:self action:@selector(relieveBankCard:) forControlEvents:(UIControlEventTouchUpInside)];
    [footView addSubview:selectBank];
    [MyPublicClass layerMasksToBoundsForAnyControls:selectBank cornerRadius:4 borderColor:nil borderWidth:0];
    
    return footView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *myBankCardCell = @"myBankCardCell";
    
    MyBankCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myBankCardCell];
    if (cell == nil) {
        
        cell = [[MyBankCardTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:myBankCardCell];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


#pragma mark - 解除绑定
-(void)relieveBankCard:(UIButton *)sender{
    AuthenticationViewController *aut = [[AuthenticationViewController alloc]init];
    [self.navigationController pushViewController:aut animated:YES];
    
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
