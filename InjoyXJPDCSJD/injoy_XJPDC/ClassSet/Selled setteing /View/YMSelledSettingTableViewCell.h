//
//  YMSelledSettingTableViewCell.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/19.
//  Copyright © 2018 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YMSelledSeetingOrder;

typedef NS_ENUM(NSInteger, YMSelledSettingCellStyle) {
    YMSelledSettingCellStyleNormal = 0,///<常规,不包含右侧的操作
    YMSelledSettingCellStyleParameter = 1,///<包含参数设置
    YMSelledSettingCellStyleAdd///<包含加号,点击加号出现步进器
};

typedef void(^YMOrderResidueStockChangeBlock)(NSInteger residueStock);
typedef void(^YMOrderParameterSettingBlock)(YMSelledSeetingOrder *order);


@interface YMSelledSettingTableViewCell : UITableViewCell

@property (nonatomic, strong) YMSelledSeetingOrder *order;
@property (nonatomic, copy) YMOrderResidueStockChangeBlock block;
@property (nonatomic, copy) YMOrderParameterSettingBlock parameterSettingBlock;
@property (nonatomic, assign) YMSelledSettingCellStyle cellStyle;///<cell样式

@end
