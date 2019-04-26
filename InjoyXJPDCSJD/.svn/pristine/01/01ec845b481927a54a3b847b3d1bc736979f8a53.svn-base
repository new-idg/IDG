//
//  GlobalDefine.h
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#ifndef GlobalDefine_h
#define GlobalDefine_h



//------------------------------------适配iphoneX-------------------------------------
//判断是否iPhone X
#define IS_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// status bar height.
#define kStatusBarHeight (IS_iPhoneX ? 44.f : 20.f)
// Navigation bar height.

#define kTabbarHeight 49.f
// Tabbar safe bottom margin.

#define kTabbarSafeBottomMargin  (IS_iPhoneX ? 34.f : 0.f)
// Status bar & navigation bar height.

#define kStatusBarAndNavigationBarHeight (IS_iPhoneX ? 88.f : 64.f)
//------------------------------------适配iphoneX-------------------------------------




// 屏幕高度
#define Screen_Height ([UIScreen mainScreen].bounds.size.height - kTabbarSafeBottomMargin)
// 屏幕宽度
#define Screen_Width [UIScreen mainScreen].bounds.size.width
// tabBar高度
#define TabBar_Height kTabbarHeight
/** 导航栏高 */
#define navHigh kStatusBarAndNavigationBarHeight
/** 地图高度 */
#define mapViewHeight 220
/** cell高度 */
#define CellHeight 67


#define CXWeakSelf(type) __weak typeof(type) weak##type = type;
#define CXStrongSelf(type) __strong typeof(type) type = weak##type;

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define GOOLEAPPKEY @"AIzaSyAiv_qJnJncFa8bmi8C6Vtc15ZAxwLNL4E"

#define HUD_SHOW(text) \
{ \
HUD_HIDE; \
MBProgressHUD* hud = [MBProgressHUD showHUDAddedTo:KEY_WINDOW.rootViewController.view animated:NO]; \
hud.labelText = text;                                                                                \
}
/** 隐藏菊花 */
#define HUD_HIDE [MBProgressHUD hideAllHUDsForView:KEY_WINDOW.rootViewController.view animated:NO];
#define HUD_SendShow(kHudSendMessage) [self showHudInView:KEY_WINDOW hint:kHudSendMessage];

#define HUD_SHOW_IN(view) \
{ \
HUD_HIDE_IN(view); \
MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:NO]; \
hud.labelText = nil;                                                                                \
}
#define HUD_HIDE_IN(view) [MBProgressHUD hideAllHUDsForView:view animated:NO];

// 字体
#define kFontOfSize(_size) ([UIFont systemFontOfSize:_size])

//自定义NSLog
#define NSLog(...) printf("outPut Log is %f %s\r \n\n", [[NSDate date]timeIntervalSince1970],[[NSString stringWithFormat:__VA_ARGS__]UTF8String])//NSLog(__VA_ARGS__)
#define Image(imageName) [UIImage imageNamed:imageName]

// 颜色
#define kColorWithRGB(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
#define kBackgroundColor RGBACOLOR(247.f, 247.f, 247.f, 1.f)
/** 浅蓝色 */
#define KLightBlue kColorWithRGB(88,185,252)

/************************** 弹框宏定义 **************************/
// 弹框头部背景色
#define kDialogHeaderBackgroundColor kColorWithRGB(228, 230, 229)
// 弹框按钮背景色
#define kDialogButtonBackgroundColor kColorWithRGB(115, 115, 115)
// 弹框蒙版色
#define kDialogCoverBackgroundColor RGBACOLOR(0, 0, 0, .35)
// 弹框内容背景色
#define kDialogContentBackgroundColor kColorWithRGB(241, 241, 241)
// 弹框宽度
#define kDialogWidth 300 * (Screen_Width / 360.0)
// 弹框头部高度
#define kDialogHeaderHeight 50 * (Screen_Width / 360.0)
// 弹框内容高度（单行）
#define kDialogContentHeight 75 * (Screen_Width / 360.0)
// 弹框底部高度
#define kDialogFooterHeight 50 * (Screen_Width / 360.0)
// 弹框按钮宽度（2个按钮）
#define kDialogButtonWidth 100 * (Screen_Width / 360.0)
// 弹框按钮宽度（2个按钮）
#define kDialogButtonHeight 30 * (Screen_Width / 360.0)
// 按钮距弹框左右间距（2个按钮）
#define kDialogButtonMargin 30 * (Screen_Width / 360.0)
// 弹框按钮字体
#define kDialogButtonFont [UIFont systemFontOfSize:15]
// 弹框标题字体
#define kDialogTitleFont [UIFont systemFontOfSize:17]
// 弹框按钮图片缩进
#define kDialogButtonImageInsets UIEdgeInsetsMake(0, -8 * (Screen_Width / 320.0), 0, 0)
// 弹框按钮文字缩进
#define kDialogButtonTitleInsets UIEdgeInsetsMake(0, 8 * (Screen_Width / 320.0), 0, 0)
// 弹框文字空格
#define kDialogTextSpacing @" "


/** keywindow */
#define KEY_WINDOW ([UIApplication sharedApplication].keyWindow)
#endif /* GlobalDefine_h */
