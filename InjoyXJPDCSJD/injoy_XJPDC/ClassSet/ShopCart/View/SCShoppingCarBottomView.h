//
//  SCShoppingCarBottomView.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShoppingCarBottomDelegate<NSObject>
@optional

- (void)allSelected:(BOOL)selected;
- (void)goPayClick;

@end

@interface SCShoppingCarBottomView : UIView

@property (nonatomic, copy) NSString *totalPrice;
@property (nonatomic, strong) UILabel *totalPriceLabel;

@property (nonatomic, weak) id <ShoppingCarBottomDelegate> delegate;

@end
