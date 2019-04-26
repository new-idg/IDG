//
//  PromptBoxViewController.h
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/17.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSUInteger,  PromptBoxButtonNumbers) {
    PromptBoxButtonNumberOne     = 0,
    PromptBoxButtonNumberTwo     = 1 << 0,
    
};

@protocol PromptBoxViewDelegate<NSObject>

@optional
-(void)selectRightButton;
-(void)selectLeftButton;
@end

@interface PromptBoxViewController : UIViewController

/**
  当选择one时，只需要调用left按钮 左边按钮退出View
 */
@property (nonatomic ,assign) PromptBoxButtonNumbers option;

@property (nonatomic ,assign) id<PromptBoxViewDelegate>delegate;

@property (nonatomic ,strong) NSString *titleString;
@property (nonatomic ,strong) NSString *contentString;

@property (nonatomic ,strong) NSString *leftButtonString;
@property (nonatomic ,strong) UIColor *leftButtonColor;

@property (nonatomic ,strong) NSString *rightButtonString;
@property (nonatomic ,strong) UIColor *rightButtonColor;


/**
显示提示框

 @param view self
 @param controller promptBoxView
 */
-(void)parentView:(UIViewController *)view showViewController:(UIViewController *)controller;

@end
