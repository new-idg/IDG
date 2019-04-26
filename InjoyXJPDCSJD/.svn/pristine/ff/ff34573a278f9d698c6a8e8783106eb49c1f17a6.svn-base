//
//  AuthenticationViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/15.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "AuthenticationViewController.h"

#define kDotCount 6  //密码个数

@interface AuthenticationViewController ()<UITextFieldDelegate>

@property (nonatomic ,strong) UITextField *passField;

@end

@implementation AuthenticationViewController

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
    message.text = @"请输入银行支付密码";
    message.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    message.textColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
    [self.view addSubview:message];
    
    UIView *passView = [[UIView alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(message.frame)+15, self.view.frame.size.width-24, 46))];
    passView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:passView];
    [MyPublicClass layerMasksToBoundsForAnyControls:passView cornerRadius:1 borderColor:[MyPublicClass colorWithHexString:@"#DDDDDD"] borderWidth:1];

    for (int i = 0; i<kDotCount-1; i++) {
        UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake((i+1)*((passView.frame.size.width)/6), 0, 1,passView.frame.size.height))];
        lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
        [passView addSubview:lineView];
    }
    
    for (int i = 0; i< kDotCount; i++) {
        UILabel *passLabel = [[UILabel alloc]initWithFrame:(CGRectMake(i*(passView.frame.size.width/6), 0, passView.frame.size.width/6-1, passView.frame.size.height))];
        passLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:20];
        passLabel.tag = 100+i;
        passLabel.textAlignment = NSTextAlignmentCenter;
        [passView addSubview:passLabel];
        
    }
    self.passField = [[UITextField alloc]initWithFrame:(CGRectMake(0, 0, passView.frame.size.width, passView.frame.size.height))];
    self.passField.keyboardType = UIKeyboardTypeNumberPad;
    self.passField.textColor = [UIColor clearColor];
    self.passField.tintColor = [UIColor clearColor];
    self.passField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.passField.delegate = self;
    [self.passField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];
    [passView addSubview:self.passField];
}


#pragma fielddelegate
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
   
    if ([UIMenuController sharedMenuController]) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    
    return NO;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return [MyPublicClass textField:textField customInputLength:range customReplacementString:string maxLength:6];
}

-(void)editChange:(UITextField *)field{
    NSString *text = field.text;
    
    for (int i = 0; i <kDotCount; i++) {
        UILabel *label = (UILabel *)[self.view viewWithTag:100+i];
        if (i< text.length) {
            label.text = @"*";
        }else{
            label.text = @"";
        }
    }
    NSLog(@"%@",text);
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
