//
//  MyBankCardViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/9/30.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "MyBankCardViewController.h"
#import "MyBankCardTableViewCell.h"

#import "AddToBankCardViewController.h"
#import "BankCardDetailViewController.h"

@interface MyBankCardViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation MyBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"我的银行卡";
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
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 124;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0.01;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [self loadFooterView];
}


-(UIView *)loadFooterView{
    
    UIView *footView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 80))];
    footView.backgroundColor =  RGBA(247, 247, 247, 1);
    
    UIButton *selectBank = [[UIButton alloc]initWithFrame:(CGRectMake(15, 30, footView.frame.size.width-30, footView.frame.size.height-30))];
    selectBank.backgroundColor = [UIColor whiteColor];
    [selectBank setImage:[UIImage imageNamed:@"selectBank"] forState:(UIControlStateNormal)];
    [selectBank setTitle:@" 添加银行卡" forState:(UIControlStateNormal)];
    [selectBank setTitleColor:[MyPublicClass colorWithHexString:@"#757575"] forState:(UIControlStateNormal)];
    selectBank.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16];
    [selectBank addTarget:self action:@selector(addBankCard:) forControlEvents:(UIControlEventTouchUpInside)];
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
    BankCardDetailViewController *bank = [[BankCardDetailViewController alloc]init];
    [self.navigationController pushViewController:bank animated:YES];
}


#pragma mark -  添加银行卡
-(void)addBankCard:(UIButton *)sender{
    AddToBankCardViewController *addBankCard = [[AddToBankCardViewController alloc]init];
    addBankCard.option = AddTOBankCardOptionUnFirst;
    [self.navigationController pushViewController:addBankCard animated:YES];
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
