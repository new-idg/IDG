//
//  ChooseFlavorModel.h
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/6.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChooseFlavorModel : NSObject
/** 图片 */
@property (nonatomic, copy) NSString *imageUrl;
/** 英文名 */
@property (nonatomic, copy) NSString *englishName;
/** 菜名 */
@property (nonatomic, copy) NSString *vegetable;
/** 菜品介绍 */
@property (nonatomic, strong) NSString *vegetableIntroduce;
/** 已选 */
@property (nonatomic, copy) NSString *choosed;
/** 价格 */
@property (nonatomic, strong) NSNumber *price;
/** 销售额 */
@property (nonatomic, strong) NSNumber *salesVolume;
/** 卡路里 */
@property (nonatomic, strong) NSString *calorie;
/** dataArray */
@property (nonatomic, strong) NSMutableArray *dataArray;
/** 备注 */
@property (nonatomic, copy) NSString *remarks;
/** 规格 */
@property (nonatomic, copy) NSString *specifications;
/** 辣度 */
@property (nonatomic, copy) NSString *hot;
/** 是否打包 */
@property (nonatomic, assign) BOOL isPack;
/** 数量 */
@property (nonatomic, assign) int number;


@end
