//
//  YMDateSelecteView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMDateSelecteView.h"
#import <Masonry.h>

@interface YMDateSelecteView ()

@property (nonatomic, strong) UIDatePicker *datePicker;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *startDateButton;
@property (nonatomic, strong) UIButton *endDateButton;
@property (nonatomic, strong) UIButton *sureButton;

@end

@implementation YMDateSelecteView


- (instancetype)initWithTitle:(NSString *)title startDate:(NSDate *)startDate endDate:(NSDate *)endDate{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    
}

@end
