//
//  ForgetPassWordViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/11/7.
//  Copyright © 2018 CX. All rights reserved.
//

#import "ForgetPassWordViewController.h"

@interface ForgetPassWordViewController ()

@property (nonatomic ,strong) UITextField *codeField;

@property (nonatomic ,strong) UIButton *nextButton;


@end

@implementation ForgetPassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    
    self.title = [MyPublicClass localizedLanguage:@"修改登录密码" userDefaultsForKey:APPLANGUAGE];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    
    self.telString = [MyPublicClass hidesThePartialInformations:@"13333333333" andLocation:3 andLength:4 writingChangeStyle:@"xxxx"];
    
    NSString *forgetString = [MyPublicClass localizedLanguage:[NSString stringWithFormat:@"请验证手机号%@:",self.telString] userDefaultsForKey:APPLANGUAGE];
    CGRect rect = [MyPublicClass stringHeightByWidth:ScreenWidth-26 title:forgetString font:[UIFont fontWithName:@"PingFang-SC-Medium" size:14]];
    
    UILabel *telLabel = [[UILabel alloc]initWithFrame:(CGRectMake(13, CGRectGetMaxY(lineView.frame)+20, self.view.frame.size.width-26, rect.size.height+10))];
    telLabel.text = forgetString;
    telLabel.numberOfLines = 0;
    telLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    telLabel.textColor = [MyPublicClass colorWithHexString:@"#757575"];
    [self.view addSubview:telLabel];
    
    
    UIView *YZMView = [[UIView alloc]initWithFrame:(CGRectMake(19, CGRectGetMaxY(telLabel.frame)+13, self.view.frame.size.width-24, 50))];
    YZMView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:YZMView];
    [MyPublicClass layerMasksToBoundsForAnyControls:YZMView cornerRadius:5 borderColor:nil borderWidth:0];
    
    self.codeField = [[UITextField alloc]initWithFrame:(CGRectMake(0, 0, YZMView.frame.size.width-110, YZMView.frame.size.height))];
    
    [self.codeField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];

    [YZMView addSubview:self.codeField];
    
    UIButton *codeButton = [[UIButton alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(self.codeField.frame), 8, 93, (YZMView.frame.size.height-16)))];
    codeButton.backgroundColor = [UIColor whiteColor];
    [codeButton setTitle:@"发送验证码" forState:(UIControlStateNormal)];
    [codeButton setTitleColor:[MyPublicClass colorWithHexString:@"#757575"] forState:(UIControlStateNormal)];
    codeButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];;
    [codeButton addTarget:self action:@selector(sendCode:) forControlEvents:(UIControlEventTouchUpInside)];
    [YZMView addSubview:codeButton];
    [MyPublicClass layerMasksToBoundsForAnyControls:codeButton cornerRadius:1 borderColor:[MyPublicClass colorWithHexString:@"#DDDDDD"] borderWidth:1];
    
    
    self.nextButton = [[UIButton alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(YZMView.frame)+38, self.view.frame.size.width-24, 44))];
    self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#D1D1D1"];
    [self.nextButton setTitle:[MyPublicClass localizedLanguage:@"下一步" userDefaultsForKey:APPLANGUAGE] forState:(UIControlStateNormal)];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.nextButton addTarget:self action:@selector(next:) forControlEvents:(UIControlEventTouchUpInside)];
    self.nextButton.enabled = NO;
    [self.view addSubview:self.nextButton];
    [MyPublicClass layerMasksToBoundsForAnyControls:self.nextButton cornerRadius:5 borderColor:nil borderWidth:0];
    
}

#pragma mark - 下一步
-(void)next:(UIButton *)sender{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.codeField resignFirstResponder];
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
#pragma mark - 发送验证码
-(void)sendCode:(UIButton *)sender{
    
    [MyPublicClass countDownWithStratDate:60 timeButton:sender buttonTitle:@"发送验证码"];
}
-(void)dealloc{
    [MyPublicClass destoryTimer];
}


#pragma mark - 防止界面跳转时，键盘没有回收
-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.codeField resignFirstResponder];
    
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
