//
//  ModifyNewPassWrodViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/11/7.
//  Copyright © 2018 CX. All rights reserved.
//

#import "ModifyNewPassWrodViewController.h"

@interface ModifyNewPassWrodViewController ()<UITextFieldDelegate>

@property (nonatomic ,strong) MyPublicTextField *oneField;
@property (nonatomic ,strong) MyPublicTextField *twoField;

@property (nonatomic ,strong) UIButton *nextButton;


@end

@implementation ModifyNewPassWrodViewController

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
    
    self.oneField = [self loadTextFieldFrame:CGRectMake(12, CGRectGetMaxY(lineView.frame)+15, self.view.frame.size.width-24, 45) placeholder:@"请输入新密码"];
    self.oneField.tag = 101;
    [self.oneField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];
    [self.view addSubview:self.oneField];
   
    self.twoField = [self loadTextFieldFrame:(CGRectMake(12, CGRectGetMaxY(self.oneField.frame)+15, self.view.frame.size.width-24, 45)) placeholder:@"请输入确认密码"];
    self.twoField.tag = 102;
    [self.twoField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];
    [self.view addSubview:self.twoField];
    
    NSString *megString = [MyPublicClass localizedLanguage:@"密码长度6~20个字符，包括数字和英文字母" userDefaultsForKey:APPLANGUAGE];
    CGRect rect = [MyPublicClass stringHeightByWidth:ScreenWidth-26 title:megString font:[UIFont fontWithName:@"PingFang-SC-Medium" size:13]];
    
    UILabel *megLabel = [[UILabel alloc]initWithFrame:(CGRectMake(13, CGRectGetMaxY(self.twoField.frame)+19, self.view.frame.size.width-26, rect.size.height+10))];
    megLabel.text = megString;
    megLabel.textColor = [MyPublicClass colorWithHexString:@"#757575"];
    megLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    megLabel.numberOfLines = 0;
    [self.view addSubview:megLabel];
    
    
    self.nextButton = [[UIButton alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(megLabel.frame)+38, self.view.frame.size.width-24, 44))];
    self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#D1D1D1"];
    [self.nextButton setTitle:[MyPublicClass localizedLanguage:@"确认" userDefaultsForKey:APPLANGUAGE] forState:(UIControlStateNormal)];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [self.nextButton addTarget:self action:@selector(next:) forControlEvents:(UIControlEventTouchUpInside)];
    self.nextButton.enabled = NO;
    [self.view addSubview:self.nextButton];
    [MyPublicClass layerMasksToBoundsForAnyControls:self.nextButton cornerRadius:5 borderColor:nil borderWidth:0];
    
}

-(MyPublicTextField *)loadTextFieldFrame:(CGRect)frame placeholder:(NSString *)placeholder{
    
    MyPublicTextField *textField = [[MyPublicTextField alloc]initWithFrame:frame];
    textField.delegate = self;
    textField.textRectDx = 12;
    textField.editingRectDx = 12;
    textField.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    [MyPublicClass setTextField:textField placeholderColor:[MyPublicClass colorWithHexString:@"#999999"]];
    textField.backgroundColor = [UIColor whiteColor];
    textField.placeholder = [MyPublicClass localizedLanguage:placeholder userDefaultsForKey:APPLANGUAGE];
    [MyPublicClass layerMasksToBoundsForAnyControls:textField cornerRadius:6 borderColor:nil borderWidth:0];
    
    return textField;
}

#pragma mark - 下一步
-(void)next:(UIButton *)sender{
    
    if (![MyPublicClass validatePassword:self.oneField.text minLength:@"6" maxLength:@"20"] || ![MyPublicClass validatePassword:self.twoField.text minLength:@"6" maxLength:@"20"]) {
        NSLog(@"错误");
    }
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return [MyPublicClass textField:textField customInputLength:range customReplacementString:string maxLength:20];
}

-(void)editChange:(UITextField *)textField{
    
    if ([MyPublicClass stringIsNull:self.oneField.text] &&
        [MyPublicClass stringIsNull:self.twoField.text]) {
        self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#D1D1D1"];
        self.nextButton.enabled = NO;
    }else{
        self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#F83030"];
        self.nextButton.enabled = YES;
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.oneField resignFirstResponder];
    [self.twoField resignFirstResponder];
}

#pragma mark - 防止界面跳转时，键盘没有回收
-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.oneField resignFirstResponder];
    [self.twoField resignFirstResponder];
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
