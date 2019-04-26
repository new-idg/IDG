//
//  MySelfViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/8/28.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "MySelfViewController.h"
#import "MySelfTableViewCell.h"

#import "MyBillViewController.h"
#import "MyBankCardViewController.h"
#import "ContactUsViewController.h"
#import "InstallViewController.h"

@interface MySelfViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataArray
;
@end

@implementation MySelfViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageChange:) name:AppLanguageDidChangeNotification object:nil];
}

- (void)languageChange:(id)sender {
    if (self.isViewLoaded && !self.view.window) {
        //这里置为nil，当视图再次显示的时候会重新走viewDidLoad方法
        self.view = nil;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.barTintColor = [MyPublicClass colorWithHexString:@"#F83030"];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
}
-(void)loadSubView{
    self.title = @"我的";
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(richScan:) image:@"scan" highImage:@"scan"];
    [self loadTableView];
    
}
-(void)loadTableView{
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, self.view.frame.size.height-navHigh-kTabbarSafeBottomMargin-48)) style:(UITableViewStyleGrouped)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self loadLocalData];
}
-(void)loadLocalData{
    self.dataArray = @[@[@{@"image":@"myBill",@"name":@"我的账单"},
                         @{@"image":@"myBankCard",@"name":@"我的银行卡"},
                         @{@"image":@"contactUs",@"name":@"联系我们"},],
                       @[@{@"image":@"settingUp",@"name":@"设置"}]
                       ];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.dataArray objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 48;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 104;
    }else{
        return 0.01;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return [self loadHeaderView:nil];
    }else{
        return nil;
    }
}
-(UIView *)loadHeaderView:(NSDictionary *)headerDic{
    UIView *headerView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 104))];
    
    CGFloat headerW = headerView.frame.size.width;
    CGFloat headerH = headerView.frame.size.height;
    
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,headerW,104);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:252/255.0 green:81/255.0 blue:81/255.0 alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:248/255.0 green:48/255.0 blue:48/255.0 alpha:1].CGColor];
    gl.locations = @[@(0.0),@(1.0f)];
    [headerView.layer addSublayer:gl];
    

    UIImageView *headerImage = [[UIImageView alloc]initWithFrame:(CGRectMake(26, (headerH-60)/2, 60, 60))];
    headerImage.image = [UIImage imageNamed:@"suancaiyu"];
    [headerView addSubview:headerImage];
    
    UIImageView *arrowsWhite = [[UIImageView alloc]initWithFrame:(CGRectMake(headerW-11-9, (headerH-14)/2, 9, 14))];
    arrowsWhite.image = [UIImage imageNamed:@"arrows-white"];
    [headerView addSubview:arrowsWhite];
    
    if (headerDic == nil) {
        UIView *noLoginView = [[UIView alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(headerImage.frame), (headerH-60)/2, headerW-(CGRectGetMaxX(headerImage.frame))-35, 60))];
        [headerView addSubview:noLoginView];
        
        UILabel *loginLabel = [[UILabel alloc]initWithFrame:(CGRectMake(21, 11, noLoginView.frame.size.width-21, 19))];
        loginLabel.text = @"立即登录";
        loginLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:20];
        loginLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        [noLoginView addSubview:loginLabel];
        
        UILabel *messageLabel = [[UILabel alloc]initWithFrame:(CGRectMake(21, CGRectGetMaxY(loginLabel.frame)+14, noLoginView.frame.size.width-21, 13))];
        messageLabel.text = @"登录后可享受更多特权";
        messageLabel.font = [UIFont fontWithName:@"Adobe Heiti Std R" size:13];
        messageLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        [noLoginView addSubview:messageLabel];
        
        UIButton *loginButton = [[UIButton alloc]initWithFrame:(CGRectMake(0, 0, noLoginView.frame.size.width, noLoginView.frame.size.height))];
        [loginButton addTarget:self action:@selector(login:) forControlEvents:(UIControlEventTouchUpInside)];
        [noLoginView addSubview:loginButton];
        
    }else{
        
        UILabel *userLabel = [[UILabel alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(headerImage.frame)+21, CGRectGetMinY(headerImage.frame)+11, headerW-(CGRectGetMaxX(headerImage.frame)+21)-35, 19))];
        userLabel.text = @"张晓晓";
        userLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:20];
        userLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        [headerView addSubview:userLabel];
        
        UIImageView *phoneImage = [[UIImageView alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(headerImage.frame)+21, CGRectGetMaxY(userLabel.frame)+13, 9, 14))];
        phoneImage.image = [UIImage imageNamed:@"phone-white"];
        [headerView addSubview:phoneImage];
        
        UILabel *phoneLabel = [[UILabel alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(phoneImage.frame)+7, CGRectGetMaxY(userLabel.frame)+15, headerW-(CGRectGetMaxX(phoneImage.frame)+7)-35, 10))];
        phoneLabel.text = [MyPublicClass hidesThePartialInformations:@"18588777825" andLocation:3 andLength:4 writingChangeStyle:@"*****"];
        phoneLabel.font = [UIFont fontWithName:@"ArialMT" size:13];
        phoneLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        [headerView addSubview:phoneLabel];
        
    }
    
    return headerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *mySelfCell = @"MySelfCell";
    
    MySelfTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mySelfCell];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MySelfTableViewCell" owner:nil options:nil] firstObject];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
   }
    NSDictionary *dic = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.titleName.text = [MyPublicClass localizedLanguage:[dic objectForKey:@"name"] userDefaultsForKey:APPLANGUAGE];
    cell.titleImage.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                MyBillViewController *myBill = [[MyBillViewController alloc]init];
                [self.navigationController pushViewController:myBill animated:YES];
            }
                break;
                
            case 1:{
                MyBankCardViewController *myBankCard = [[MyBankCardViewController alloc]init];
                [self.navigationController pushViewController:myBankCard animated:YES];
            }
                break;
            case 2:{
                ContactUsViewController *us = [[ContactUsViewController alloc]init];
                [self.navigationController pushViewController:us animated:YES];
                
            }
                break;
            default:
                break;
        }
        
    }else{
        InstallViewController *install = [[InstallViewController alloc]init];
        [self.navigationController pushViewController:install animated:YES];
    }
}

#pragma mark - 扫一扫
-(void)richScan:(UIButton *)sneder{
    
}
#pragma mark - 登录
-(void)login:(UIButton *)sneder{
    
}



@end
