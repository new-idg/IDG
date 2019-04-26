//
//  OpinionCollectionViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/22.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "OpinionCollectionViewController.h"

@interface OpinionCollectionViewController ()<UITextViewDelegate>
@property (nonatomic ,strong) UITextView *textView;
@property (nonatomic ,strong) UILabel *placeholder;
@property (nonatomic ,strong) UIButton *nextButton;
@end

@implementation OpinionCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = self.titleString;
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    self.textView = [[UITextView alloc]initWithFrame:(CGRectMake(12, navHigh+10, self.view.frame.size.width-24, self.view.frame.size.height/3))];
    self.textView.textContainerInset = UIEdgeInsetsMake(14, 9, 0, 9);
    self.textView.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    self.textView.delegate = self;
    [self.view addSubview:self.textView];
    [MyPublicClass layerMasksToBoundsForAnyControls:self.textView cornerRadius:5 borderColor:[MyPublicClass colorWithHexString:@"#EEEEEE"] borderWidth:1];
    
    self.placeholder = [[UILabel alloc]initWithFrame:(CGRectMake(9, 0, self.textView.frame.size.width-18, 60))];
    self.placeholder.numberOfLines = 0;
    self.placeholder.text = @"请留下您的宝贵的信息，我们将在3个工作日内回复您(10~10000个字符）";
    self.placeholder.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    self.placeholder.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [self.textView addSubview:self.placeholder];
    
    
    self.nextButton = [[UIButton alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(self.textView.frame)+30, self.view.frame.size.width-24, 44))];
    self.nextButton.backgroundColor = [MyPublicClass colorWithHexString:@"#F83030"];
    [self.nextButton setTitle:@"确认" forState:(UIControlStateNormal)];
    [self.nextButton setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
//    [self.nextButton addTarget:self action:@selector(next:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.nextButton];
    [MyPublicClass layerMasksToBoundsForAnyControls:self.nextButton cornerRadius:5 borderColor:nil borderWidth:0];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        self.placeholder.hidden = YES;
    }
    
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text.length == 0) {
        self.placeholder.hidden = NO;
    }else{
        self.placeholder.hidden = YES;
    }
    
    if (textView.text.length <10 && ![MyPublicClass stringIsNull:textView.text]){
        textView.text = @"不能低于10个字符";
    }
}
- (void)textViewDidChange:(UITextView *)textView{
//    if (textView.text.length > 100) {
//        textView.text = [textView.text substringToIndex:100];
//    }
    
}
//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
//
//    NSString *string = [textView.text stringByReplacingCharactersInRange:range withString:text];
//
//    if (string.length > 100) {
//
//            textView.text = [string substringWithRange:(NSMakeRange(0, 100))];
//    }else{
//        textView.text = string;
//    }
//
//    return NO;
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textView resignFirstResponder];
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
