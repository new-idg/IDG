//
//  SCShoppingCarHeaderView.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SCShoppingCarStore;

@protocol CXShoppingCarHeaderViewDelegate <NSObject>
@optional
//选择某个店
- (void)shoppingCarHeaderSeleteStore:(SCShoppingCarStore *)store selected:(BOOL)selected;
//删除某个商店
- (void)shoppingCarHeaderDeleteStore:(SCShoppingCarStore *)store;
@end


@interface SCShoppingCarHeaderView : UITableViewHeaderFooterView

//@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, strong) SCShoppingCarStore *store;
@property (nonatomic, weak) id <CXShoppingCarHeaderViewDelegate> delegate;

@end
