//
//  SCShoppingCarCell.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  SCShoppingCarGoods;

@interface SCShoppingCarCell : UITableViewCell

@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, strong) SCShoppingCarGoods *goods;

@end
