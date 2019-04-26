//
//  YMAdjectiveOrderBottomView.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2019/1/5.
//  Copyright © 2019 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YMAdjectiveOrderBottomViewBlock)(NSString *title);
@interface YMAdjectiveOrderBottomView : UIView

@property (nonatomic, strong) UIButton *shoppingCarButton;
@property (nonatomic, strong) UILabel *totalCountLabel;
@property (nonatomic, strong) UILabel *totalPriceLabel;
@property (nonatomic, strong) UIButton *orderButton;
@property (nonatomic, copy) YMAdjectiveOrderBottomViewBlock block;
@end
