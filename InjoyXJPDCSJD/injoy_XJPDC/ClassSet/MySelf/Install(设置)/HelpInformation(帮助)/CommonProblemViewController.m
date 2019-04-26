//
//  CommonProblemViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/25.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CommonProblemViewController.h"

@interface CommonProblemViewController ()

@end

@implementation CommonProblemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"常见问题";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
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
