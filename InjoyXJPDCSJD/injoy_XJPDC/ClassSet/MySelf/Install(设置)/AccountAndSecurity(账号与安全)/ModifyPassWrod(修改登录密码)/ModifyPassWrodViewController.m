//
//  ModifyPassWrodViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/11/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "ModifyPassWrodViewController.h"

#import "ModifyNewPassWrodViewController.h"
#import "ForgetPassWordViewController.h"


@interface ModifyPassWrodViewController ()<UITextFieldDelegate>

@property (nonatomic ,strong) MyPublicTextField *textField;

@property (nonatomic ,strong) UIButton *nextButton;

@end

@implementation ModifyPassWrodViewController

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
    
    MyPublicTextField *oldField = [[MyPublicTextField alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(lineView.frame)+20, self.view.frame.size.width-24, 45))];
    oldField.textRectDx = 12;
    oldField.editingRectDx = 12;
    oldField.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    [MyPublicClass setTextField:oldField placeholderColor:[MyPublicClass colorWithHexString:@"#999999"]];
    oldField.backgroundColor = [UIColor whiteColor];
    oldField.placeholder = [MyPublicClass localizedLanguage:@"请输入旧密码" userDefaultsForKey:APPLANGUAGE];
    [self.view addSubview:oldField];
    [MyPublicClass layerMasksToBoundsForAnyControls:oldField cornerRadius:6 borderColor:nil borderWidth:0];
    self.textField = oldField;
    
    [oldField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];

    
    
    NSString *forgetString = [MyPublicClass localizedLanguage:@"忘记密码？" userDefaultsForKey:APPLANGUAGE];
    CGRect rect = [MyPublicClass stringHeightByWidth:ScreenWidth-38 title:forgetString font:[UIFont fontWithName:@"PingFang-SC-Medium" size:13]];
    
    UIButton *forgetPW = [[UIButton alloc]initWithFrame:(CGRectMake(self.view.frame.size.width-rect.size.width-10-19, CGRectGetMaxY(oldField.frame)+7, rect.size.width+10, 40))];
    [forgetPW setTitleColor:[MyPublicClass colorWithHexString:@"#3BA0E6"] forState:(UIControlStateNormal)];
    [forgetPW setTitle:forgetString forState:(UIControlStateNormal)];
    forgetPW.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    [forgetPW addTarget:self action:@selector(forgetPassWord:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:forgetPW];
    
    
    
    self.nextButton = [[UIButton alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(forgetPW.frame)+29, self.view.frame.size.width-24, 44))];
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
    
    ModifyNewPassWrodViewController *newPW = [[ModifyNewPassWrodViewController alloc]init];
    [self.navigationController pushViewController:newPW animated:YES];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.textField resignFirstResponder];
}

#pragma mark - 忘记密码
-(void)forgetPassWord:(UIButton *)sender{
    ForgetPassWordViewController *forget = [[ForgetPassWordViewController alloc]init];
    [self.navigationController pushViewController:forget animated:YES];
}


#pragma mark - 防止界面跳转时，键盘没有回收
-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.textField resignFirstResponder];
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
