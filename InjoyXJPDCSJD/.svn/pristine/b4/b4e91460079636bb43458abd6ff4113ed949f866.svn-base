//
//  BillingDetailsViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/9/30.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "BillingDetailsViewController.h"

#import "BillingDetailsTableViewCell.h"

@interface BillingDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *titleArray;

@end

@implementation BillingDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"账单详情";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *topView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 11))];
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [topView addSubview:lineView];
    
    UIView *spacView = [[UIView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(lineView.frame), self.view.frame.size.width, 10))];
    spacView.backgroundColor = RGBA(247, 247, 247, 1);
    [topView addSubview:spacView];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(topView.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(topView.frame))) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = RGBA(247, 247, 247, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self loadLocalData];
}
-(void)loadLocalData{
    self.titleArray = @[@{@"name":@"支付金额"},
                        @{@"name":@"支付状态"},
                        @{@"name":@"支付方式"},
                        @{@"name":@"创建时间"},
                        @{@"name":@"单号"},
                        @{@"name":@"流水号"}];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return [self.titleArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *billingDetails = @"BillingDetailsCell";
    
    BillingDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:billingDetails];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BillingDetailsTableViewCell" owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dic = [self.titleArray objectAtIndex:indexPath.row];
    cell.billName.text = [dic objectForKey:@"name"];
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
