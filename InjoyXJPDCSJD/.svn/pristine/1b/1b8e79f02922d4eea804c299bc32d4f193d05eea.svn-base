//
//  YMDateSelecteView.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^YMDateSelecteViewBlock)(NSString *startDate,NSString *endDate);

@interface YMDateSelecteView : UIView

@property (nonatomic, copy) YMDateSelecteViewBlock block;
/**
 日期选择

 @param title 标题
 @param startDate 开始时间,不传默认是今天
 @param endDate 结束时间,不传默认是今天
 @return instancetype
 */
- (instancetype)initWithTitle:(NSString *)title startDate:(NSDate *)startDate endDate:(NSDate *)endDate;

@end
