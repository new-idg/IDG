//
//  SCShoppingCarGoods.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCShoppingCarGoods : NSObject

@property (nonatomic, copy) NSString *goodsID;
@property (nonatomic, copy) NSString *goodsName;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) BOOL select;


@end
