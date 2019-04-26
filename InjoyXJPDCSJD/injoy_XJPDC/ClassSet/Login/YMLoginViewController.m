//
//  YMLoginViewController.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2019/1/7.
//  Copyright © 2019 CX. All rights reserved.
//

#import "YMLoginViewController.h"

@interface YMLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UITextField *telTextField;
@property (nonatomic, strong)UITextField *codeTextField;

@end

@implementation YMLoginViewController

#pragma mark -- setter && getter
- (UITextField *)telTextField{
    if (_telTextField == nil) {
        _telTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _telTextField.placeholder = @"请输入手机号";
        [self.view addSubview:_telTextField];
    }
    return _telTextField;
}
- (UITextField *)codeTextField{
    if (_codeTextField == nil) {
        _codeTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _codeTextField.placeholder = @"验证码";
        [self.view addSubview:_codeTextField];
    }
    return _codeTextField;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupSubview];
}
- (void)setupNavigationBar{
    self.navigationItem.title = @"手机验证登录";
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"close"] style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItem = left;
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"语言" style:UIBarButtonItemStyleDone target:self action:@selector(changeLanguage)];
    self.navigationItem.rightBarButtonItem = right;
}
- (void)setupSubview{
    [self setupNavigationBar];
    [self.telTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(navHigh + 70);
        make.left.mas_equalTo(26);
        make.right.mas_equalTo(-25);
        make.height.mas_equalTo(40);
    }];
    UIView *telLine = [[UIView alloc] initWithFrame:CGRectZero];
    telLine.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [self.view addSubview:telLine];
    [telLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.telTextField.mas_bottom);
        make.left.mas_equalTo(25);
        make.right.mas_equalTo(-25);
        make.height.mas_equalTo(1);
    }];
    [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.telTextField.mas_bottom).mas_offset(20);
        make.left.mas_equalTo(self.telTextField.mas_left);
        make.right.mas_equalTo(self.telTextField.mas_right);
        make.height.mas_equalTo(self.telTextField.mas_height);
    }];
    UIView *codeLine = [[UIView alloc] initWithFrame:CGRectZero];
    codeLine.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [self.view addSubview:codeLine];
    [codeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeTextField.mas_bottom);
        make.left.mas_equalTo(25);
        make.right.mas_equalTo(-25);
        make.height.mas_equalTo(1);
    }];
    UIButton *codeButton = [[UIButton alloc] initWithFrame:CGRectZero];
    codeButton.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    codeButton.clipsToBounds = YES;
    [codeButton setTitleColor:[UIColor colorWithRed:87/255.0 green:87/255.0 blue:87/255.0 alpha:1.0] forState:UIControlStateNormal];
    codeButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    codeButton.layer.cornerRadius = 15;
    [codeButton addTarget:self action:@selector(codeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeButton];
    [codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.codeTextField.mas_bottom).mas_offset(-10);
        make.right.mas_equalTo(self.codeTextField.mas_right);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectZero];
    loginButton.backgroundColor = [UIColor colorWithRed:250/255.0 green:69/255.0 blue:45/255.0 alpha:1.0];
    loginButton.clipsToBounds = YES;
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    loginButton.layer.cornerRadius = 25;
    [self.view addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeTextField.mas_bottom).mas_offset(50);
        make.left.mas_equalTo(self.telTextField.mas_left);
        make.right.mas_equalTo(self.telTextField.mas_right);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *accountLoginButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [accountLoginButton setTitleColor:[UIColor colorWithRed:87/255.0 green:87/255.0 blue:87/255.0 alpha:1.0]forState:UIControlStateNormal];
    accountLoginButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [accountLoginButton setTitle:@"账号密码登录" forState:UIControlStateNormal];
    [accountLoginButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:accountLoginButton];
    [accountLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(loginButton.mas_bottom).mas_offset(25);
        make.right.mas_equalTo(self.telTextField.mas_right);
    }];
    
    [self setupBottomView];
}
- (void)setupBottomView{
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-kTabbarSafeBottomMargin - 20);
        make.height.mas_equalTo(50);
    }];
    UILabel *companyNameLabel = [self createLabelWithTitle:@"公司名称：新加坡餐饮服务有限公司"];
    [bottomView addSubview:companyNameLabel];
    UILabel *companyAddressLabel = [self createLabelWithTitle:@"公司地址：#05-12，Jurong east st21,640232"];
    [bottomView addSubview:companyAddressLabel];
    UILabel *companyTelLabel = [self createLabelWithTitle:@"联系方式：+65 888888888"];
    [bottomView addSubview:companyTelLabel];
    NSArray *labelArray = @[companyNameLabel,companyAddressLabel,companyTelLabel];
    [labelArray mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:5 leadSpacing:0 tailSpacing:0];
    [labelArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.left.mas_equalTo(50);
    }];
}
- (UILabel *)createLabelWithTitle:(NSString *)title{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor colorWithRed:168/255.0 green:168/255.0 blue:168/255.0 alpha:1.0];
    label.text = title;
    return label;
}
- (void)codeButtonClick:(UIButton *)sender{
    __block int timeout = 90;
    dispatch_queue_t global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, global);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_resume(timer);
    
    __weak typeof(self) weakSelf = self;
    dispatch_source_set_event_handler(timer, ^{
        timeout --;
        if (timeout <= 0) {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
            });
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString * title = [NSString stringWithFormat:@"重新发送(%d)",timeout];
                [sender setTitle:title forState:UIControlStateNormal];
            });
        }
    });
    
}
- (void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)changeLanguage{
    
}
- (void)loginButtonClick{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
