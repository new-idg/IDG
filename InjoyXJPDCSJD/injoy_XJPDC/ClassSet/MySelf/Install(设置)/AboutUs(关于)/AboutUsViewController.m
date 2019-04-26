//
//  AboutUsViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/25.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "AboutUsViewController.h"

#import "UserTermsViewController.h"

@interface AboutUsViewController ()

@property (nonatomic ,strong) UIImageView *iconImageView;

@property (nonatomic ,strong) UILabel *versionLabel;


@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"关于";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    self.iconImageView = [[UIImageView alloc]initWithFrame:(CGRectMake((self.view.frame.size.width-60)/2, CGRectGetMaxY(lineView.frame)+80, 60, 60))];
    self.iconImageView.image = [UIImage imageNamed:@"aboutIcon"];
    [self.view addSubview:self.iconImageView];
    
    self.versionLabel = [[UILabel alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(self.iconImageView.frame)+13, self.view.frame.size.width, 20))];
    self.versionLabel.text = @"v1.0.1";
    self.versionLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16];
    self.versionLabel.textColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
    self.versionLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.versionLabel];
    
    UIButton *update = [[UIButton alloc]initWithFrame:(CGRectMake(0, (self.view.frame.size.height-40)/2, self.view.frame.size.width, 40))];
    [update setTitle:@"检查更新" forState:(UIControlStateNormal)];
    [update setTitleColor:[MyPublicClass colorWithHexString:@"#757575"] forState:(UIControlStateNormal)];
    [update.titleLabel setFont:[UIFont fontWithName:@"PingFang-SC-Medium" size:16]];
    [self.view addSubview:update];
    
    UILabel *news = [[UILabel alloc]initWithFrame:(CGRectMake(0, self.view.frame.size.height-kTabbarSafeBottomMargin-34, self.view.frame.size.width, 20))];
    news.text = @"版权公司信息";
    news.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    news.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    news.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:news];
    
    UIButton *clause = [[UIButton alloc]initWithFrame:(CGRectMake(0, CGRectGetMinY(news.frame)-news.frame.size.height-13, self.view.frame.size.width, 40))];
    [clause setTitle:@"《使用条款与用户同意书》" forState:(UIControlStateNormal)];
    [clause setTitleColor:[MyPublicClass colorWithHexString:@"#333333"] forState:(UIControlStateNormal)];
    [clause.titleLabel setFont:[UIFont fontWithName:@"PingFang-SC-Medium" size:14]];
    [clause addTarget:self action:@selector(userTerms:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:clause];
    
}

-(void)userTerms:(UIButton *)sender{
    UserTermsViewController *user = [[UserTermsViewController alloc]init];
    user.titelString = @"使用条款与用户同意书";
    [self.navigationController pushViewController:user animated:YES];
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
