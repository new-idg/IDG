//
//  VerifyBankCardInformationViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/12.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "VerifyBankCardInformationViewController.h"

#import "SMSVerificationViewController.h"
#import "UserPactListViewController.h"


@interface VerifyBankCardInformationViewController ()

@property (nonatomic ,strong) UITextField *CKRField;

@property (nonatomic ,strong) UITextField *IDField;

@property (nonatomic ,strong) UITextField *telField;

@property (nonatomic ,strong) UIButton *nextButton;

@end

@implementation VerifyBankCardInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"验证银行卡信息";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];

    UIView *topView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 85))];//线和间距的size
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [topView addSubview:lineView];
    
    UIFont *font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    UIColor *lightBlackColor = [MyPublicClass colorWithHexString:@"#575757"];
    UIColor *blackColor = [MyPublicClass colorWithHexString:@"#333333"];

    
    UILabel *bankCard = [self subLabelFrame:(CGRectMake(13, 19, 45, 10)) subLabelText:@"银行卡" subLabelFont:font subLabelColor:lightBlackColor];
    [topView addSubview:bankCard];
    
    UILabel *bankCardName = [self subLabelFrame:(CGRectMake(CGRectGetMaxX(bankCard.frame)+30, 19, topView.frame.size.width-CGRectGetMaxX(bankCard.frame)-30-10, 14)) subLabelText:@"马来亚银行" subLabelFont:font subLabelColor:lightBlackColor];
    [topView addSubview:bankCardName];
    
    UILabel *cardNumber = [self subLabelFrame:(CGRectMake(13, CGRectGetMaxY(bankCard.frame)+19, 45, 14)) subLabelText:@"卡   号" subLabelFont:font subLabelColor:lightBlackColor];
    [topView addSubview:cardNumber];

    UILabel *bankCardNumber = [self subLabelFrame:(CGRectMake(CGRectGetMaxX(cardNumber.frame)+30, CGRectGetMaxY(bankCardName.frame)+20, topView.frame.size.width-CGRectGetMaxX(cardNumber.frame)-30-10, 14)) subLabelText:@"6212 6220 1900 2888 790" subLabelFont:font subLabelColor:lightBlackColor];
    [topView addSubview:bankCardNumber];
    
    UILabel *message = [[UILabel alloc]init];
    message.text = @"提醒：后续只能绑定该持卡人的银行卡";
    message.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    message.textColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
    [self.view addSubview:message];
    
    
    UIView *CKRView = [[UIView alloc]init];
    CKRView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:CKRView];
    
    UIView *IDCardView = [[UIView alloc]init];
    IDCardView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:IDCardView];

    UIView *telNumberView = [[UIView alloc]init];
    telNumberView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:telNumberView];

    
    if (self.option == BankCardInformationOptionFirst) {
        message.frame = CGRectMake(12, CGRectGetMaxY(topView.frame)+19, self.view.frame.size.width-24, 13);
        CKRView.frame = CGRectMake(0, CGRectGetMaxY(message.frame)+10, self.view.frame.size.width, 50);
        IDCardView.frame = CGRectMake(0, CGRectGetMaxY(CKRView.frame)+1, self.view.frame.size.width, 50);
        telNumberView.frame = CGRectMake(0, CGRectGetMaxY(IDCardView.frame)+1, self.view.frame.size.width, 50);
    }else{
        message.hidden = YES;
        CKRView.hidden = YES;
        IDCardView.hidden = YES;
        telNumberView.frame = CGRectMake(0, CGRectGetMaxY(topView.frame)+20, self.view.frame.size.width, 50);
    }
   
#pragma mark - 持卡人界面
    UILabel *CKRLabel = [self subLabelFrame:(CGRectMake(14, (CKRView.frame.size.height-14)/2, 45, 14)) subLabelText:@"持卡人" subLabelFont:font subLabelColor:blackColor];
    [CKRView addSubview:CKRLabel];
    
    self.CKRField = [self subFieldFrame:(CGRectMake(CGRectGetMaxX(CKRLabel.frame)+30, 0, CKRView.frame.size.width-CGRectGetMaxX(CKRLabel.frame)-30-20, CKRView.frame.size.height)) subFieldPlaceholder:@"持卡人姓名" subFieldFont:font subFieldColor:blackColor];
    self.CKRField.tag = 101;
    [self.CKRField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];
    [CKRView addSubview:self.CKRField];
    
#pragma mark - 身份证界面
    UILabel *IDLabel = [self subLabelFrame:(CGRectMake(14, (IDCardView.frame.size.height-14)/2, 45, 14)) subLabelText:@"身份证" subLabelFont:font subLabelColor:blackColor];
    [IDCardView addSubview:IDLabel];
    
    self.IDField = [self subFieldFrame:(CGRectMake(CGRectGetMaxX(IDLabel.frame)+30, 0, IDCardView.frame.size.width-CGRectGetMaxX(IDLabel.frame)-30-20, IDCardView.frame.size.height)) subFieldPlaceholder:@"请输入证件号码" subFieldFont:font subFieldColor:blackColor];
    self.IDField.tag = 102;
    [self.IDField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];
    [IDCardView addSubview:self.IDField];

#pragma mark - 手机号界面
    UILabel *telLabel = [self subLabelFrame:(CGRectMake(14, (telNumberView.frame.size.height-14)/2, 45, 14)) subLabelText:@"手机号" subLabelFont:font subLabelColor:blackColor];
    [telNumberView addSubview:telLabel];
    
    self.telField = [self subFieldFrame:(CGRectMake(CGRectGetMaxX(telLabel.frame)+30, 0, telNumberView.frame.size.width-CGRectGetMaxX(telLabel.frame)-30-46, telNumberView.frame.size.height)) subFieldPlaceholder:@"银行预留号码" subFieldFont:font subFieldColor:blackColor];
    self.telField.keyboardType = UIKeyboardTypeNumberPad;
    self.telField.tag = 103;
    [self.telField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];
    [telNumberView addSubview:self.telField];
    
    UIButton *CKRMessage = [[UIButton alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(self.telField.frame)+13, (telNumberView.frame.size.height-20)/2, 20, 20))];
    [CKRMessage setImage:[UIImage imageNamed:@"prompt"] forState:(UIControlStateNormal)];
    [CKRMessage addTarget:self action:@selector(telMessagePrompt:) forControlEvents:(UIControlEventTouchUpInside)];
    [telNumberView addSubview:CKRMessage];
    
    UILabel *pactLabel = [self subLabelFrame:(CGRectMake(13, CGRectGetMaxY(telNumberView.frame)+19, 30, 13)) subLabelText:@"同意" subLabelFont:[UIFont fontWithName:@"PingFang-SC-Medium" size:13] subLabelColor:[MyPublicClass colorWithHexString:@"#757575"]];
    [self.view addSubview:pactLabel];
    
    UIButton *pactButton = [[UIButton alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(pactLabel.frame), CGRectGetMaxY(telNumberView.frame)+19, 80, 13))];
    [pactButton setTitleColor:[MyPublicClass colorWithHexString:@"#FF3E3E"] forState:(UIControlStateNormal)];
    [pactButton setTitle:@"《用户协议》" forState:(UIControlStateNormal)];
    pactButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    [pactButton addTarget:self action:@selector(pactList:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:pactButton];
    
    self.nextButton = [[UIButton alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(pactButton.frame)+39, self.view.frame.size.width-24, 44))];
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

-(void)editChange:(UITextField *)textField{
    
    if ([MyPublicClass stringIsNull:self.CKRField.text] &&
        [MyPublicClass stringIsNull:self.IDField.text] &&
        [MyPublicClass stringIsNull:self.telField.text]) {
        self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#D1D1D1"];
        self.nextButton.enabled = NO;
    }else{
        self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#F83030"];
        self.nextButton.enabled = YES;
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

#pragma mark - 用户协议
-(void)pactList:(UIButton *)sender{
    UserPactListViewController *userPact = [[UserPactListViewController alloc]init];
    [self.navigationController pushViewController:userPact animated:YES];
}

#pragma mark - 下一步
-(void)next:(UIButton *)sender{
    SMSVerificationViewController *sms = [[SMSVerificationViewController alloc]init];
    [self.navigationController pushViewController:sms animated:YES];
}
#pragma mark - 手机预留信息
-(void)telMessagePrompt:(UIButton *)sender{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"手机号" message:@"银行预留手机号是在银行卡时填写的手机号，若遗忘、换号可联系银行客服电话处理" preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - 防止界面跳转时，键盘没有回收
-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.view endEditing:YES];
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
