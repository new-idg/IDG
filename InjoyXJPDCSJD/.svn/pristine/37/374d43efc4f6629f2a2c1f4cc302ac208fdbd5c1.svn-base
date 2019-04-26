//
//  YMAdjectiveOrderBottomView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2019/1/5.
//  Copyright © 2019 CX. All rights reserved.
//

#import "YMAdjectiveOrderBottomView.h"

@implementation YMAdjectiveOrderBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview{
    self.backgroundColor = [UIColor colorWithRed:64/255.0 green:64/255.0 blue:64/255.0 alpha:1.0];
    
    self.shoppingCarButton = [[UIButton alloc] initWithFrame:CGRectZero];
    self.shoppingCarButton.backgroundColor = [UIColor redColor];
    self.shoppingCarButton.clipsToBounds = YES;
    self.shoppingCarButton.layer.cornerRadius = 25;
    [self.shoppingCarButton setImage:[UIImage imageNamed:@"shopcart"] forState:UIControlStateNormal];
    [self.shoppingCarButton addTarget:self action:@selector(shoppingCarButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.shoppingCarButton];
    [self.shoppingCarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.bottom.mas_equalTo(-12);
        make.width.height.mas_equalTo(50);
    }];
    self.totalCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.totalCountLabel.font = [UIFont systemFontOfSize:11];
    self.totalCountLabel.textColor = [UIColor whiteColor];
    [self.shoppingCarButton addSubview:self.totalCountLabel];
    [self.totalCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(2);
        make.right.mas_equalTo(-10);
    }];
    self.totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.totalPriceLabel.font = [UIFont systemFontOfSize:17];
    self.totalPriceLabel.text = @"未选购商品";
    [self addSubview:self.totalPriceLabel];
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.shoppingCarButton.mas_right).mas_offset(10);
        make.left.mas_equalTo(80);
        make.centerY.mas_equalTo(0);
    }];
    self.orderButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.orderButton setTitle:@"下单" forState:UIControlStateNormal];
    [self.orderButton addTarget:self action:@selector(orderButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.orderButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:self.orderButton];
    [self.orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
}
- (void)shoppingCarButtonClick{
    NSLog(@"手动下单,点击了购物车图标");
    if (self.block) {
        self.block(@"购物车");
    }
}
- (void)orderButtonClick{
    NSLog(@"手动下单,点击了下单");
    if (self.block) {
        self.block(@"下单");
    }
}
@end
