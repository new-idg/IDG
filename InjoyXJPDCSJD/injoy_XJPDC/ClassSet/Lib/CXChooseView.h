//
//  CXChooseView.h
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/6.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

#define chooseViewHeight 62
@protocol CXChooseViewDelegate <NSObject>
-(void)chooseViewSelectIndex:(NSInteger)index;

@end
@interface CXChooseView : UIView

/** 购物车按钮 */
@property (nonatomic, strong) UIButton *shopCart;
/** 选购商品 */
@property (nonatomic, strong) UILabel *chooseGoods;
/** 去结算 */
@property (nonatomic, strong) UIButton *settlement;
/** delete */
@property (nonatomic, assign) id<CXChooseViewDelegate> delegate;

-(instancetype)init;
-(instancetype)initWithFrame:(CGRect)frame;
@end
