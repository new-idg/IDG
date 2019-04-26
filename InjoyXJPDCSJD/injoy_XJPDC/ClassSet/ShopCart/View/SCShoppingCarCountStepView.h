//
//  SCShoppingCarCountStepView.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SCCountStepStyle) {
    SCCountStepStyleLabel = 0,//中间一个固定的数字,不能输入
    SCCountStepStyleLabelTextField//输入框
};

typedef void(^ShoppingCarCountBlock)(NSInteger stepNumber);

@interface SCShoppingCarCountStepView : UIView

@property (nonatomic, assign) NSInteger stepCurrentNumber;///<当前的单位
@property (nonatomic, assign) NSInteger stepNumber;///<每次步进的单位
@property (nonatomic, assign) NSInteger stepMinNumber;///<最小步进的单位
@property (nonatomic, assign) NSInteger stepMaxNumber;///<最大步进的单位
@property (nonatomic, copy) ShoppingCarCountBlock block;

- (instancetype)initWithStyle:(SCCountStepStyle)style;

@end
