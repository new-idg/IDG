//
//  SCShoppingCarStore.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SCShoppingCarGoods;

@interface SCShoppingCarStore : NSObject

@property (nonatomic, copy) NSString *storeID;
@property (nonatomic, copy) NSString *storeName;
@property (nonatomic, assign) BOOL select;
@property (nonatomic, strong) NSMutableArray <SCShoppingCarGoods *> *goodsArray;

@end
