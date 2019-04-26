//
//  SingaporeTabBarViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/8/28.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SingaporeTabBarViewController.h"
#import "SingaporeNavViewController.h"

#import "CXNormalNavigationController.h"
#import "HomeViewController.h"
#import "ShopCartViewController.h"
#import "OrderViewController.h"
#import "MySelfViewController.h"
#import "YMMineTableViewController.h"
#import "YMQueueOrderViewController.h"
#import "YMAdjectiveOrderViewController.h"
#import "YMSelledOrderViewController.h"

@interface SingaporeTabBarViewController ()

@end

@implementation SingaporeTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    HomeViewController *home = [[HomeViewController alloc]init];
//    [self addChildVc:home title:@"首页" imageName:@"home" selectedImage:@"home_select"];
    YMQueueOrderViewController *queueOrderViewController = [[YMQueueOrderViewController alloc] init];
    [self addChildVc:queueOrderViewController title:@"排队订单" imageName:@"order" selectedImage:@"order_select"];
    
//    ShopCartViewController *shopCart = [[ShopCartViewController alloc]init];
//    [self addChildVc:shopCart title:@"购物车" imageName:@"shopcart" selectedImage:@"shopcart_select"];
    YMAdjectiveOrderViewController *adjectiveOrderViewController = [[YMAdjectiveOrderViewController alloc] init];
    [self addChildVc:adjectiveOrderViewController title:@"手动订单" imageName:@"tabbar_adjective_normal" selectedImage:@"tabbar_adjective_selected"];
    
//    OrderViewController *order = [[OrderViewController alloc]init];
//    [self addChildVc:order title:@"排队订单" imageName:@"order" selectedImage:@"order_select"];
    YMSelledOrderViewController *selledOrderViewController = [[YMSelledOrderViewController alloc] init];
    [self addChildVc:selledOrderViewController title:@"售完设置" imageName:@"tabbar_selled_normal" selectedImage:@"tabbar_selled_selected"];
    
//    MySelfViewController *mySelf = [[MySelfViewController alloc]init];
//    [self addChildVc:mySelf title:@"我的" imageName:@"mySelf" selectedImage:@" "];
    YMMineTableViewController *mineTableViewController = [[YMMineTableViewController alloc] init];
    [self addChildVc:mineTableViewController title:@"我的" imageName:@"mySelf" selectedImage:@" "];
    
    
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"item name = %@", item.title);
}

- (instancetype)init
{
    if (self = [super init]) {
        
        self.tabBar.barTintColor = [UIColor whiteColor];
        [self.tabBar setBackgroundColor:[UIColor whiteColor]];
//                [self.tabBar setBackgroundColor:[UIColor redColor]];
    }
    return self;
}
- (void)addChildVc:(UIViewController *)Vc title:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedImage
{
    Vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor colorWithRed:161/255.0 green:161/255.0 blue:161/255.0 alpha:1];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    NSMutableDictionary *attrSelected = [NSMutableDictionary dictionary];
    attrSelected[NSForegroundColorAttributeName] = [UIColor colorWithRed:255/255.0 green:79/255.0 blue:100/255.0 alpha:1];
    attrSelected[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [[UITabBarItem appearance]setTitleTextAttributes:attr forState:UIControlStateNormal];
    [[UITabBarItem appearance]setTitleTextAttributes:attrSelected forState:UIControlStateSelected];
    
    SingaporeNavViewController *nav = [[SingaporeNavViewController alloc]initWithRootViewController:Vc];
    nav.tabBarItem.title = title;
    [self addChildViewController:nav];
}

@end
