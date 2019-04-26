//
//  InputLoginPassWordViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/18.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "InputLoginPassWordViewController.h"

#import "AddToBankCardViewController.h"

@interface InputLoginPassWordViewController ()

@property (nonatomic ,strong) UITextField *passField;

@property (nonatomic ,strong) UIButton *nextButton;

@end

@implementation InputLoginPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);

    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"身份验证";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"忘记密码" titleColor:[UIColor blackColor] target:self action:@selector(forgetPassWord:)];
    
    UILabel *message = [[UILabel alloc]initWithFrame:(CGRectMake(13, navHigh+20, self.view.frame.size.width-26, 13))];
    message.text = @"请输入登录密码";
    message.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    message.textColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
    [self.view addSubview:message];
    
    UIView *passView = [[UIView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(message.frame)+15, self.view.frame.size.width, 46))];
    passView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:passView];
  
    self.passField = [[UITextField alloc]initWithFrame:(CGRectMake(13, 0, passView.frame.size.width-26, passView.frame.size.height))];
    self.passField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.passField.placeholder = @"登录密码";
    self.passField.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    [self.passField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];
    [passView addSubview:self.passField];
    
    self.nextButton = [[UIButton alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(passView.frame)+39, self.view.frame.size.width-24, 44))];
    self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#D1D1D1"];
    [self.nextButton setTitle:[MyPublicClass localizedLanguage:@"确认" userDefaultsForKey:APPLANGUAGE] forState:(UIControlStateNormal)];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.nextButton addTarget:self action:@selector(next:) forControlEvents:(UIControlEventTouchUpInside)];
    self.nextButton.enabled = NO;
    [self.view addSubview:self.nextButton];
    [MyPublicClass layerMasksToBoundsForAnyControls:self.nextButton cornerRadius:5 borderColor:nil borderWidth:0];
    
}


-(void)editChange:(UITextField *)textField{
    if ([MyPublicClass stringIsNull:textField.text]) {
        self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#D1D1D1"];
        self.nextButton.enabled = NO;
    }else{
        self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#F83030"];
        self.nextButton.enabled = YES;
        
    }
}

#pragma mark - 下一步
-(void)next:(UIButton *)sender{
  
    AddToBankCardViewController *information = [[AddToBankCardViewController alloc]init];
    information.option = AddTOBankCardOptionFirst;
    [self.navigationController pushViewController:information animated:YES];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.passField resignFirstResponder];
}

#pragma mark - 防止界面跳转时，键盘没有回收
-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.passField resignFirstResponder];
}


#pragma mark - 忘记密码
-(void)forgetPassWord:(UIButton *)sender{
    
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
