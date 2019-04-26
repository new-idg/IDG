//
//  YMQueueOrderFooterView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMQueueOrderFooterView.h"
#import <Masonry.h>

@interface YMQueueOrderFooterView ()

@property (nonatomic, strong) UILabel *orderSelectedLabel;///<已选
@property (nonatomic, strong) UILabel *orderRemarkLabel;///<备注
@property (nonatomic, strong) UILabel *totalPriceLabel;///<总价

@end

@implementation YMQueueOrderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (instancetype)initWithQueueOrder{
    self = [super initWithFrame:CGRectZero];
    if(self){
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
- (instancetype)init{
    self = [super init];
    if(self){
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    self.contentView .backgroundColor = [UIColor whiteColor];
    
    self.orderSelectedLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.orderSelectedLabel.text = @"已选：小杯/去冰/正常糖";
    self.orderSelectedLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.orderSelectedLabel];
    [self.orderSelectedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
//        make.right.mas_equalTo(-10);
    }];
    
    self.orderRemarkLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.orderRemarkLabel.text = @"备注：暂无特别备注";
    self.orderRemarkLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.orderRemarkLabel];
    [self.orderRemarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.orderSelectedLabel.mas_bottom).mas_offset(10);
//        make.right.mas_equalTo(-10);
    }];
    self.totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.totalPriceLabel.text = @"S$12";
    self.totalPriceLabel.textColor = [UIColor redColor];
    self.totalPriceLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.totalPriceLabel];
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.orderRemarkLabel.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(-10);
    }];
    UILabel *totalLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    totalLabel.text = @"合计:";
    totalLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:totalLabel];
    [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.totalPriceLabel.mas_top);
        make.right.mas_equalTo(self.totalPriceLabel.mas_left);
    }];
    NSArray *titleArray = @[@"呼叫面谈",@"通知取餐",@"已取"];
    NSMutableArray *buttonArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectZero];
        button.backgroundColor = [UIColor colorWithRed:60/255.0 green:160/255.0 blue:230/255.0 alpha:1];
        button.tag = i;
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        button.layer.shadowOffset = CGSizeMake(0,2);
        button.layer.shadowOpacity = 1;
        button.layer.shadowRadius = 3;
        button.layer.cornerRadius = 18.5;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [buttonArray addObject:button];
    }
    [buttonArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:10 tailSpacing:10];
    [buttonArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@100);
        make.height.equalTo(@37);
    }];
 
    
}
- (void)buttonClick:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(queueOrderFooterViewSelectedIIndex:)]) {
        [self.delegate queueOrderFooterViewSelectedIIndex:sender.tag];
    }
  
}
@end
