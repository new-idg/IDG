//
//  AddToBankCardViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/10.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "AddToBankCardViewController.h"

#import "VerifyBankCardInformationViewController.h"
#import "InputLoginPassWordViewController.h"

#import "PromptBoxViewController.h"
#import "PromptBoxCancelHeadViewController.h"

@interface AddToBankCardViewController ()<UITextFieldDelegate,PromptBoxViewDelegate ,PromptBoxCancelHeadViewDelegate>

@property (nonatomic ,strong) UITextField *cardNumField;

@property (nonatomic ,strong) UIButton *nextButton;

@property (nonatomic ,strong) UILabel *cardNumber;


@end

@implementation AddToBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"添加银行卡";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UILabel *messageLabel = [[UILabel alloc]initWithFrame:(CGRectMake(12, navHigh+23, self.view.frame.size.width-24, 55))];
    messageLabel.text = @"为了保证您的资金安全，请绑定账户本人的银行卡，支出银行卡有DBS、UOB、OCBC、    MAYBANK、CITIBANK，信用卡仅支出Master和Visa两种";
    messageLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    messageLabel.textColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
    messageLabel.numberOfLines = 0;
    [self.view addSubview:messageLabel];
    
    UIView *cardView = [[UIView alloc]init];
    cardView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cardView];
    
    UIView *CKRView = [[UIView alloc]init];
    CKRView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:CKRView];
    
    if (self.option == AddTOBankCardOptionFirst) {
        CKRView.hidden = YES;
        cardView.frame =(CGRectMake(0, CGRectGetMaxY(messageLabel.frame)+15, self.view.frame.size.width, 50));
    }else{
        CKRView.hidden = NO;
        CKRView.frame = (CGRectMake(0, CGRectGetMaxY(messageLabel.frame)+15, self.view.frame.size.width, 50));
        cardView.frame =(CGRectMake(0, CGRectGetMaxY(CKRView.frame)+1, self.view.frame.size.width, 50));
    }
#pragma mark - 卡号部分
    UILabel *number = [[UILabel alloc]initWithFrame:(CGRectMake(12, (cardView.frame.size.height-14)/2, 50, 14))];
    number.text = @"卡   号";
    number.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    number.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    
    [cardView addSubview:number];
    
    self.cardNumField = [[UITextField alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(number.frame)+20, 0, cardView.frame.size.width-CGRectGetMaxX(number.frame)-20, cardView.frame.size.height))];
    self.cardNumField.delegate = self;
    self.cardNumField.placeholder = @"卡号";
    self.cardNumField.font = [UIFont systemFontOfSize:15];
    self.cardNumField.keyboardType = UIKeyboardTypeNumberPad;
    self.cardNumField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.cardNumField addTarget:self action:@selector(editChange:) forControlEvents:(UIControlEventEditingChanged)];
    [cardView addSubview:self.cardNumField];
    
#pragma mark - 持卡人卡部分

    UILabel *CKRLabel = [[UILabel alloc]initWithFrame:(CGRectMake(12, (CKRView.frame.size.height-14)/2, 50, 14))];
    CKRLabel.text = @"持卡人";
    CKRLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    CKRLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [CKRView addSubview:CKRLabel];
    
    UILabel *CKRName = [[UILabel alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(CKRLabel.frame)+20, 0, CKRView.frame.size.width-CGRectGetMaxX(CKRLabel.frame)-20-46, CKRView.frame.size.height))];
    CKRName.text = [MyPublicClass hidesThePartialInformations:@"张三丰" andLocation:1 andLength:2 writingChangeStyle:[MyPublicClass hiddenLength:2 repeatString:@"*"]];
//    @"张**";
    CKRName.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    CKRName.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [CKRView addSubview:CKRName];
    
    UIButton *CKRMessage = [[UIButton alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(CKRName.frame)+20, (CKRView.frame.size.height-20)/2, 20, 20))];
    [CKRMessage setImage:[UIImage imageNamed:@"prompt"] forState:(UIControlStateNormal)];
    [CKRMessage addTarget:self action:@selector(messagePrompt:) forControlEvents:(UIControlEventTouchUpInside)];
    [CKRView addSubview:CKRMessage];
    
#pragma mark - 银行卡部分
    UIImageView *cardImage = [[UIImageView alloc]initWithFrame:(CGRectMake(13, CGRectGetMaxY(cardView.frame)+19, 17, 14))];
    cardImage.image = [UIImage imageNamed:@"bankCardIcon"];
    [self.view addSubview:cardImage];
    
    self.cardNumber = [[UILabel alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(cardImage.frame)+9, CGRectGetMaxY(cardView.frame)+19, self.view.frame.size.width-CGRectGetMaxX(cardImage.frame)-9-26, 13))];
    self.cardNumber.text = @"马来亚银行信用卡";
    self.cardNumber.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:13];
    self.cardNumber.textColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
    [self.view addSubview:self.cardNumber];
    
    
    self.nextButton = [[UIButton alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(cardImage.frame)+39, self.view.frame.size.width-24, 44))];
    self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#D1D1D1"];
    [self.nextButton setTitle:@"下一步" forState:(UIControlStateNormal)];
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

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return [MyPublicClass systemTextField:textField systemRange:range replacementString:string enterLength:23];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
   
    [self.cardNumField resignFirstResponder];

}

#pragma mark - 下一步
-(void)next:(UIButton *)sender{
    VerifyBankCardInformationViewController *information = [[VerifyBankCardInformationViewController alloc]init];
    information.option = BankCardInformationOptionFirst;
    [self.navigationController pushViewController:information animated:YES];
}
#pragma mark - 持卡人信息提示
-(void)messagePrompt:(UIButton *)sender{
 
    PromptBoxViewController *box = [[PromptBoxViewController alloc]init];
    box.titleString = @"持卡人";
    box.contentString = @"1.请确认135****1803是否是马来亚银行**1471尾号银行卡的预留手机号码\n2.请检查短信是否被手机安全软件拦截\n3.若手机号已停用，建议换一张卡绑定，或联系马来亚银行客户处理\n4.由于运营商网络原因，可能存在延迟，请耐心等待或者重新获取\n5.获取更多帮助，请联系新加坡餐饮平台客服";
    box.option = PromptBoxButtonNumberTwo;
    box.leftButtonColor = [MyPublicClass colorWithHexString:@"#FF3E3E"];
    box.leftButtonString = @"知道了";
    box.rightButtonColor = [MyPublicClass colorWithHexString:@"#575757"];
    box.rightButtonString = @"注销实名";
    box.delegate = self;
    [box parentView:self showViewController:box];
}

-(void)selectRightButton{
    
    PromptBoxCancelHeadViewController *box = [[PromptBoxCancelHeadViewController alloc]init];
    box.contentString = @"注销实名认证后，您的银行卡即将解绑，是否确认注销";
    box.option = PromptBoxCancelHeadButtonNumberTwo;
    box.leftButtonColor = [MyPublicClass colorWithHexString:@"#FF3E3E"];
    box.leftButtonString = @"取消注销";
    box.rightButtonColor = [MyPublicClass colorWithHexString:@"#575757"];
    box.rightButtonString = @"确认注销";
    box.delegate = self;
    [box parentView:self showViewController:box];
   
}

-(void)selectCancelHeadRightButton{
    InputLoginPassWordViewController *input = [[InputLoginPassWordViewController alloc]init];
    [self.navigationController pushViewController:input animated:YES];
}

#pragma mark - 防止界面跳转时，键盘没有回收
-(void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.cardNumField resignFirstResponder];
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
