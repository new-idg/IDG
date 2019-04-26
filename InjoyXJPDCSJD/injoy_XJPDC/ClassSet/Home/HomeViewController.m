//
//  HomeViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/8/28.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "HomeViewController.h"
#import "WMSegmentViewController.h"
#import "SGPNearbyViewController.h"
#import "SGPCollectionViewController.h"
#import "SGPHistoryViewController.h"
#import <Masonry.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

-(void)setup{

    
    SGPNearbyViewController *vc1 = [[SGPNearbyViewController alloc] init];
    SGPCollectionViewController *vc2 = [[SGPCollectionViewController alloc] init];
    SGPHistoryViewController *vc3 = [[SGPHistoryViewController alloc] init];
    WMSegmentViewController *wm = [[WMSegmentViewController alloc] init];
    wm.view.frame = CGRectMake(0, navHigh, Screen_Width, Screen_Height-navHigh-kTabbarHeight-10);
//    wm.view.backgroundColor = [UIColor whiteColor];
    [wm segmentWithTitles:@[@" 附近",@" 收藏",@" 历史"] images:@[@"nearby",@"collection",@"history"] selectImages:@[@"nearby_select",@"collection_select",@"history_select"]];
    
    [wm segmentWithChildViewArrays:@[vc1,vc2,vc3]];
    [self.view addSubview:wm.view];
    [self addChildViewController:wm];
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
