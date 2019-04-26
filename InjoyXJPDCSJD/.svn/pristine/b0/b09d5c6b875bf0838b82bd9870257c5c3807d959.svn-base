//
//  AccountAndSecurityViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/25.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "AccountAndSecurityViewController.h"

#import "ModifyPassWrodViewController.h"

#define ScrollW self.scrollView.frame.size.width
#define ScrollH self.scrollView.frame.size.height

@interface AccountAndSecurityViewController ()<UITextViewDelegate>
@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) UILabel *userlabel;
@property (nonatomic ,strong) UITextView *payConTextView;
@property (nonatomic ,strong) UITextView *unLockTextView;
@property (nonatomic ,strong) UIView *setGesView;


@end

@implementation AccountAndSecurityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self loadSubView];
}
-(void)loadSubView{
    
    self.title = [MyPublicClass localizedLanguage:@"账号与安全" userDefaultsForKey:APPLANGUAGE];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(lineView.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(lineView.frame)))];
    self.scrollView.backgroundColor = RGBA(247, 247, 247, 1);
    [self.view addSubview:self.scrollView];
    
#pragma mark - 头像
    UIView *headView = [self loadBGViewFrame:(CGRectMake(0, 0, ScrollW, 60))];
    [self.scrollView addSubview:headView];
    
    UILabel *headLabel = [self leftLabelFrame:(CGRectMake(13, 0, ScrollW-13-13-45-33, 60)) labelText:[MyPublicClass localizedLanguage:@"头像" userDefaultsForKey:APPLANGUAGE] fontSize:16 textColor:[MyPublicClass colorWithHexString:@"#333333"]];
    [headView addSubview:headLabel];
   
    UIButton *headButton = [[UIButton alloc]initWithFrame:(CGRectMake(ScrollW-45-33, 8, 45, 45))];
    headButton.backgroundColor = [UIColor redColor];
    [headView addSubview:headButton];
    
    UIImageView *headArrowImage = [self rightImageFrame:(CGRectMake(CGRectGetMaxX(headButton.frame)+13, (headView.frame.size.height-14)/2, 9, 14))];
    [headView addSubview:headArrowImage];
    
#pragma mark- 用户名
    UIView *userNameView = [self loadBGViewFrame:(CGRectMake(0, CGRectGetMaxY(headView.frame)+1, ScrollW, 48))];
    [self.scrollView addSubview:userNameView];
    
    UILabel *userLeftLabel = [self leftLabelFrame:(CGRectMake(13, 0, (ScrollW-26)/2, 48)) labelText:[MyPublicClass localizedLanguage:@"用户名" userDefaultsForKey:APPLANGUAGE] fontSize:16 textColor:[MyPublicClass colorWithHexString:@"#333333"]];
    [userNameView addSubview:userLeftLabel];
    
    self.userlabel = [self leftLabelFrame:(CGRectMake(CGRectGetMaxX(userLeftLabel.frame), 0, (ScrollW-26)/2-20, 48)) labelText:[MyPublicClass localizedLanguage:@"张晓晓" userDefaultsForKey:APPLANGUAGE] fontSize:16 textColor:[MyPublicClass colorWithHexString:@"#333333"]];
    self.userlabel.textAlignment = NSTextAlignmentRight;
    [userNameView addSubview:self.userlabel];
    
    UIImageView *userArrowImage = [self rightImageFrame:(CGRectMake(CGRectGetMaxX(self.userlabel.frame)+13, (userNameView.frame.size.height-14)/2, 9, 14))];
    [userNameView addSubview:userArrowImage];
    
#pragma mark - 安全设置
    UILabel *securityLabel = [self leftLabelFrame:(CGRectMake(13, CGRectGetMaxY(userNameView.frame)+15, ScrollW-26, 13)) labelText:[MyPublicClass localizedLanguage:@"安全设置" userDefaultsForKey:APPLANGUAGE] fontSize:14 textColor:[MyPublicClass colorWithHexString:@"#575757"]];
    [self.scrollView addSubview:securityLabel];
    
#pragma mark - 登录密码
    UIView *passWordView = [self loadBGViewFrame:(CGRectMake(0, CGRectGetMaxY(securityLabel.frame)+8, ScrollW, 48))];
    [self.scrollView addSubview:passWordView];
    
    UILabel *passleftLabel = [self leftLabelFrame:(CGRectMake(13, 0, (ScrollW-26)/2, 48)) labelText:[MyPublicClass localizedLanguage:@"登录密码" userDefaultsForKey:APPLANGUAGE] fontSize:16 textColor:[MyPublicClass colorWithHexString:@"#333333"]];
    [passWordView addSubview:passleftLabel];
    
    UILabel *passRightlabel = [self leftLabelFrame:(CGRectMake(CGRectGetMaxX(passleftLabel.frame), 0, (ScrollW-26)/2-20, 48)) labelText:[MyPublicClass localizedLanguage:@"修改" userDefaultsForKey:APPLANGUAGE] fontSize:16 textColor:[MyPublicClass colorWithHexString:@"#333333"]];
    passRightlabel.textAlignment = NSTextAlignmentRight;
    [passWordView addSubview:passRightlabel];
    
    UIImageView *passArrowImage = [self rightImageFrame:(CGRectMake(CGRectGetMaxX(passRightlabel.frame)+13, (passWordView.frame.size.height-14)/2, 9, 14))];
    [passWordView addSubview:passArrowImage];
    
    UIButton *passButton = [[UIButton alloc]initWithFrame:(CGRectMake(0, 0, passWordView.frame.size.width, passWordView.frame.size.height))];
    [passButton addTarget:self action:@selector(modifyPassWrod:) forControlEvents:(UIControlEventTouchUpInside)];
    [passWordView addSubview:passButton];
    
#pragma mark - 指纹支付
    NSString *redString = [MyPublicClass localizedLanguage:@"《指纹相关协议》" userDefaultsForKey:APPLANGUAGE];
    NSString *payPrompt = [MyPublicClass localizedLanguage:[NSString stringWithFormat:@"开启后,启动新加坡餐饮时,需要使用指纹解锁,同意%@",redString] userDefaultsForKey:APPLANGUAGE];
    CGRect payH = [MyPublicClass stringHeightByWidth:ScrollW-13-86 title:payPrompt font:[UIFont fontWithName:@"PingFang-SC-Medium" size:13]];
    
    UIView *paymentView = [self loadBGViewFrame:(CGRectMake(0, CGRectGetMaxY(passWordView.frame)+1, ScrollW, 17+16+payH.size.height+16+8))];
    [self.scrollView addSubview:paymentView];
    
    UILabel *paymentLabel = [self leftLabelFrame:(CGRectMake(13, 17, ScrollW-13-86, 16)) labelText:[MyPublicClass localizedLanguage:@"指纹支付" userDefaultsForKey:APPLANGUAGE] fontSize:16 textColor:[MyPublicClass colorWithHexString:@"#333333"]];
    [paymentView addSubview:paymentLabel];
    
    self.payConTextView = [[UITextView alloc]initWithFrame:(CGRectMake(12,CGRectGetMaxY(paymentLabel.frame), ScrollW-12-86, payH.size.height+16))];
    self.payConTextView.delegate = self;
    self.payConTextView.editable = NO;
    self.payConTextView.scrollEnabled = NO;
     [paymentView addSubview:self.payConTextView];
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:payPrompt];
    [attStr addAttribute:NSLinkAttributeName value:@"click://" range:NSMakeRange(payPrompt.length-redString.length, redString.length)];
    [attStr addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang-SC-Medium" size:13]} range:NSMakeRange(0, payPrompt.length)];
     [attStr addAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#999999"]} range:NSMakeRange(0, payPrompt.length-redString.length)];
    self.payConTextView.attributedText = attStr;
    self.payConTextView.linkTextAttributes = @{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#F83030"]};

    UISwitch *paySwitch = [[UISwitch alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(self.payConTextView.frame)+(86-51-10), (paymentView.frame.size.height-31)/2, 51, 31))];
    [paymentView addSubview:paySwitch];
    
#pragma mark - 指纹解锁
    UIView *unLockView = [self loadBGViewFrame:(CGRectMake(0, CGRectGetMaxY(paymentView.frame)+1, ScrollW, 17+16+payH.size.height+16+8))];
    [self.scrollView addSubview:unLockView];
    
    UILabel *unLockLabel = [self leftLabelFrame:(CGRectMake(13, 17, ScrollW-13-86, 16)) labelText:[MyPublicClass localizedLanguage:@"APP启动时指纹解锁" userDefaultsForKey:APPLANGUAGE] fontSize:16 textColor:[MyPublicClass colorWithHexString:@"#333333"]];
    [unLockView addSubview:unLockLabel];
    
    self.unLockTextView = [[UITextView alloc]initWithFrame:(CGRectMake(12,CGRectGetMaxY(unLockLabel.frame), ScrollW-12-86, payH.size.height+16))];
    self.unLockTextView.delegate = self;
    self.unLockTextView.editable = NO;
    self.unLockTextView.scrollEnabled = NO;
    [unLockView addSubview:self.unLockTextView];
    
    [MyPublicClass textViewSetHyperlinkString:payPrompt targetString:redString schemeKey:@"clickLock" hyperlinkFont:[UIFont fontWithName:@"PingFang-SC-Medium" size:13] textColor:[MyPublicClass colorWithHexString:@"#999999"] currentTextView:self.unLockTextView hyperlinkColor:[MyPublicClass colorWithHexString:@"#F83030"]];
    
    UISwitch *unLockSwitch = [[UISwitch alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(self.unLockTextView.frame)+(86-51-10), (unLockView.frame.size.height-31)/2, 51, 31))];
    [unLockView addSubview:unLockSwitch];
    
#pragma mark - 手势解锁
    UIView *gestureView = [self loadBGViewFrame:(CGRectMake(0, CGRectGetMaxY(unLockView.frame)+1, ScrollW, 48))];
    [self.scrollView addSubview:gestureView];
    
    UILabel *gestureLabel = [self leftLabelFrame:(CGRectMake(13, (gestureView.frame.size.height-16)/2, ScrollW-13-86, 16)) labelText:[MyPublicClass localizedLanguage:@"APP启动时手势密码解锁" userDefaultsForKey:APPLANGUAGE] fontSize:16 textColor:[MyPublicClass colorWithHexString:@"#333333"]];
    [gestureView addSubview:gestureLabel];
    
    UISwitch *gestureSwitch = [[UISwitch alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(gestureLabel.frame)+(86-51-10), (gestureView.frame.size.height-31)/2, 51, 31))];
    [gestureSwitch addTarget:self action:@selector(switchAction:) forControlEvents:(UIControlEventValueChanged)];

    [gestureView addSubview:gestureSwitch];
    
#pragma mark - 手势设置

    self.setGesView = [self loadBGViewFrame:(CGRectMake(0, CGRectGetMaxY(gestureView.frame)+1, ScrollW, 48))];
    [self.scrollView addSubview:self.setGesView];
    
    UILabel *setGesLabel = [self leftLabelFrame:(CGRectMake(13, (gestureView.frame.size.height-16)/2, ScrollW-13-13-20, 16)) labelText:[MyPublicClass localizedLanguage:@"手势设置" userDefaultsForKey:APPLANGUAGE] fontSize:16 textColor:[MyPublicClass colorWithHexString:@"#333333"]];
    [self.setGesView addSubview:setGesLabel];
    
    UIImageView *setGesArrowImage = [self rightImageFrame:(CGRectMake(CGRectGetMaxX(setGesLabel.frame)+13, (self.setGesView.frame.size.height-14)/2, 9, 14))];
    [self.setGesView addSubview:setGesArrowImage];
    
    
}

-(UIView *)loadBGViewFrame:(CGRect)frame{
    UIView *bgView = [[UIView alloc]initWithFrame:frame];
    bgView.backgroundColor = [UIColor whiteColor];
    return bgView;
}
-(UILabel *)leftLabelFrame:(CGRect)frame labelText:(NSString *)text fontSize:(CGFloat)font textColor:(UIColor *)color{
    
    UILabel *subLabel = [[UILabel alloc]initWithFrame:frame];
    subLabel.text = text;
    subLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:font];
    subLabel.textColor = color;
    subLabel.numberOfLines = 0;
    return subLabel;
}

-(UIImageView *)rightImageFrame:(CGRect)frame{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [UIImage imageNamed:@"arrows-gray"];
    return imageView;
}

#pragma mark - 禁止复制
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    if ([UIMenuController sharedMenuController]) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    
    return NO;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{

    if ([[URL scheme] isEqualToString:@"click"]) {
        NSLog(@"点击了--1--");
        return NO;
    }else if ([[URL scheme] isEqualToString:@"clickLock"]) {
        NSLog(@"点击了--2--");
        return NO;
    }
    return YES;
}

#pragma mark - Switch点击方法
-(void)switchAction:(UISwitch *)sender{
    
    if (sender.isOn) {
        self.setGesView.hidden = NO;
    }else{
        self.setGesView.hidden = YES;

    }
}
#pragma 修改登录密码
-(void)modifyPassWrod:(UIButton *)sender{
    ModifyPassWrodViewController *pass = [[ModifyPassWrodViewController alloc]init];
    [self.navigationController pushViewController:pass animated:YES];
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
