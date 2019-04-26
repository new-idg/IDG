//
//  YMMyOrderHeaderView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/19.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMMyOrderHeaderView.h"
#import "YMMyOrderInfo.h"
#import "SPPageMenu.h"
#import "PickerViewController.h"

@interface YMMyOrderHeaderView ()<SPPageMenuDelegate>

@property (nonatomic, strong) YMMyOrderInfo *orderInfo;

@end

@implementation YMMyOrderHeaderView

- (instancetype)initWithOrderInfo:(YMMyOrderInfo *)orderInfo{
    self = [super init];
    if (self) {
        self.orderInfo = orderInfo;
        [self setupSubview];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    UILabel *orderTotalCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    orderTotalCountLabel.text = @"订单总数";
    orderTotalCountLabel.font = [UIFont systemFontOfSize:13];
    orderTotalCountLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [self addSubview:orderTotalCountLabel];
    [orderTotalCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(15);
    }];
    
    UILabel *countLabel =  [[UILabel alloc] initWithFrame:CGRectZero];
    countLabel.text = self.orderInfo.totalCount ? : @"500份";
    countLabel.textAlignment = NSTextAlignmentCenter;
    countLabel.font = [UIFont systemFontOfSize:13];
    countLabel.textColor = [UIColor colorWithRed:248/255.0 green:48/255.0 blue:48/255.0 alpha:1];
    [self addSubview:countLabel];
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(23);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    UIButton *dateButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [dateButton setTitle:@"01-08-2018 至 01-08-2018" forState:UIControlStateNormal];
    dateButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [dateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:dateButton];
    [dateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(countLabel.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    CGFloat marginX = 15;//间距x
    CGFloat marginY = 20;//间距y
    CGFloat gridWidth = Screen_Width / 2 - marginX * 2;//格子的宽度
    CGFloat gridHeight = 20;//格子的高度
    NSInteger rowNumber = 2;//每行几个
    NSArray *titleArray = @[@"已完成数:",@"已完成总金额:",@"未完成数:",@"未完成总金额:"];
    for ( int  i = 0; i < 4 ; i++) {
        UILabel *label = [[UILabel alloc] init];
        label.text = titleArray[i];
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make){
            make.left.mas_equalTo(marginX + i % rowNumber * (gridWidth + marginX));
            make.top.mas_equalTo(80 + i / rowNumber * (gridHeight + marginY));
            make.width.mas_equalTo(gridWidth);
            make.height.mas_equalTo(gridHeight);
        }];
    }

    UIView *spaceView = [[UIView alloc] initWithFrame:CGRectZero];
//    spaceView.backgroundColor =  [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
    spaceView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:spaceView];
    [spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(200);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
    }];

}

- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedAtIndex:(NSInteger)index{
    NSLog(@"点击的index:%ld",index);
 
}
@end
