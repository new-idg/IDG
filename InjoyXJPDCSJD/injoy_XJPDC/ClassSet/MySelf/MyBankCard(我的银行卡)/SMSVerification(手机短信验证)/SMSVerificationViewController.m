//
//  SMSVerificationViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/12.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SMSVerificationViewController.h"

#import "AuthenticationViewController.h"


@interface SMSVerificationViewController ()

@property (nonatomic ,strong) UITextField *codeField;

@property (nonatomic ,strong) UIButton *nextButton;

@end

@implementation SMSVerificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"手机短信验证";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIFont *font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    UIColor *blackColor = [MyPublicClass colorWithHexString:@"#333333"];
    
    UILabel *telLabel = [[UILabel alloc]initWithFrame:(CGRectMake(13, navHigh+20, self.view.frame.size.width-26, 13))];
    self.telString = [MyPublicClass hidesThePartialInformations:@"13333333333" andLocation:3 andLength:4 writingChangeStyle:@"xxxx"];
    telLabel.text = [NSString stringWithFormat:@"请输入手机%@收到的短信验证码:",self.telString];
    telLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    telLabel.textColor = [MyPublicClass colorWithHexString:@"#757575"];
    [self.view addSubview:telLabel];
    
    UIView *YZMView = [[UIView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(telLabel.frame)+15, self.view.frame.size.width, 50))];
    YZMView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:YZMView];
    
    UILabel *YZMLabel = [self subLabelFrame:(CGRectMake(14, (YZMView.frame.size.height-14)/2, 45, 14)) subLabelText:@"验证码" subLabelFont:font subLabelColor:blackColor];
    [YZMView addSubview:YZMLabel];
    
    self.codeField = [self subFieldFrame:(CGRectMake(CGRectGetMaxX(YZMLabel.frame)+30, 0, YZMView.frame.size.width-CGRectGetMaxX(YZMLabel.frame)-30-100, YZMView.frame.size.height)) subFieldPlaceholder:@"短信验证码" subFieldFont:font subFieldColor:blackColor];
    [self.codeField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];

    [YZMView addSubview:self.codeField];
    
    UIButton *codeButton = [[UIButton alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(self.codeField.frame), 8, 88, (YZMView.frame.size.height-16)))];
    codeButton.backgroundColor = [UIColor whiteColor];
    [codeButton setTitle:@"发送验证码" forState:(UIControlStateNormal)];
    [codeButton setTitleColor:[MyPublicClass colorWithHexString:@"#757575"] forState:(UIControlStateNormal)];
    codeButton.titleLabel.font = font;
    [codeButton addTarget:self action:@selector(sendCode:) forControlEvents:(UIControlEventTouchUpInside)];
    [YZMView addSubview:codeButton];
    [MyPublicClass layerMasksToBoundsForAnyControls:codeButton cornerRadius:1 borderColor:[MyPublicClass colorWithHexString:@"#DDDDDD"] borderWidth:1];
    
    UIButton *codeMessage = [[UIButton alloc]initWithFrame:(CGRectMake(self.view.frame.size.width-85-10, CGRectGetMaxY(YZMView.frame)+19, 88, 20))];
    [codeMessage setTitleColor:[MyPublicClass colorWithHexString:@"#3BA0E6"] forState:(UIControlStateNormal)];
    [codeMessage setTitle:@"收不到验证吗?" forState:(UIControlStateNormal)];
    codeMessage.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    [codeMessage addTarget:self action:@selector(canNotReceiveYZM:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:codeMessage];
    
    self.nextButton = [[UIButton alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(codeMessage.frame)+39, self.view.frame.size.width-24, 44))];
    self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#D1D1D1"];
    [self.nextButton setTitle:@"下一步" forState:(UIControlStateNormal)];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.nextButton addTarget:self action:@selector(next:) forControlEvents:(UIControlEventTouchUpInside)];
    self.nextButton.enabled = NO;
    [self.view addSubview:self.nextButton];
    [MyPublicClass layerMasksToBoundsForAnyControls:self.nextButton cornerRadius:5 borderColor:nil borderWidth:0];
    
}

-(UILabel *)subLabelFrame:(CGRect)rect subLabelText:(NSString *)text subLabelFont:(UIFont *)font subLabelColor:(UIColor *)color{
    
    UILabel *subLabel = [[UILabel alloc]initWithFrame:(rect)];
    subLabel.text = text;
    subLabel.font = font;
    subLabel.textColor = color;
    
    return subLabel;
}

-(UITextField *)subFieldFrame:(CGRect)rect subFieldPlaceholder:(NSString *)placeholder subFieldFont:(UIFont *)font subFieldColor:(UIColor *)color{
    
    UITextField *subField = [[UITextField alloc]initWithFrame:rect];
    subField.placeholder = placeholder;
    subField.font = font;
    subField.textColor = color;
    
    return subField;
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

#pragma mark - 收不到验证码
-(void)canNotReceiveYZM:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"收不到验证码？" message:@"1.请确认135****1803是否是马来亚银行**1471尾号银行卡的预留手机号码\n2.请检查短信是否被手机安全软件拦截\n3.若手机号已停用，建议换一张卡绑定，或联系马来亚银行客户处理\n4.由于运营商网络原因，可能存在延迟，请耐心等待或者重新获取\n5.获取更多帮助，请联系新加坡餐饮平台客服" preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark - 下一步
-(void)next:(UIButton *)sender{
    AuthenticationViewController *authentication = [[AuthenticationViewController alloc] init];
    [self.navigationController pushViewController:authentication animated:YES];
}
#pragma mark - 手机预留信息
-(void)telMessagePrompt:(UIButton *)sender{
    
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
