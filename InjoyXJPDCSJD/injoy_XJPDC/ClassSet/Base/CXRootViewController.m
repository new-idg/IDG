//
//  CXRootViewController.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CXRootViewController.h"
#import "GlobalDefine.h"

@interface CXRootViewController ()

@end

@implementation CXRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor =kBackgroundColor;
    [self.view addSubview:self.rootTopView];
    [self setLeftNavView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CXSgpTopView *)rootTopView{
    if (!_rootTopView) {
        _rootTopView = [[CXSgpTopView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, navHigh)];
        _rootTopView.backgroundColor = RGBACOLOR(252, 64, 69, 1);
        
    }
    return _rootTopView;
}

-(void)setLeftNavView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 20, 30);
    [btn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left = [[UIBarButtonItem alloc] init];
    left.customView = btn;
    
    self.navigationItem.leftBarButtonItem = left;
}

-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setRightNavView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"scan2"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0, 20, 30);
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] init];
    left.customView = btn;
    
    self.navigationItem.rightBarButtonItem = left;
}




@end
