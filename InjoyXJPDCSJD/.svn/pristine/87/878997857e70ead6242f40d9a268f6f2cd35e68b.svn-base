//
//  SCShoppingCarBottomView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SCShoppingCarBottomView.h"
#import <Masonry.h>

@interface SCShoppingCarBottomView ()

@property (nonatomic, strong) UIButton *allSelectButton;
@property (nonatomic, strong) UIButton *goPayButton;

@end


@implementation SCShoppingCarBottomView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    self.allSelectButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.allSelectButton setImage:[UIImage imageNamed:@"sc_circle_normal"] forState:UIControlStateNormal];
    [self.allSelectButton setImage:[UIImage imageNamed:@"sc_circle_selected"] forState:UIControlStateSelected];
    [self.allSelectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.allSelectButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.allSelectButton setTitle:@"  全选" forState:UIControlStateNormal];
    [self.allSelectButton setTitle:@"  取消" forState:UIControlStateSelected];
    [self.allSelectButton addTarget:self action:@selector(allSelectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.allSelectButton];
    [self.allSelectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
    self.goPayButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.goPayButton setBackgroundColor:[UIColor redColor]];
    [self.goPayButton setTitle:@"去结算" forState:UIControlStateNormal];
    self.goPayButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.goPayButton addTarget:self action:@selector(goPayButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.goPayButton];
    [self.goPayButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        make.width.mas_equalTo(60);
    }];
    self.totalPriceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.totalPriceLabel.font = [UIFont systemFontOfSize:15];
    self.totalPriceLabel.text = [NSString stringWithFormat:@"合计:💲%@",self.totalPrice ? : @"222.22"];
    [self addSubview:self.totalPriceLabel];
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.allSelectButton.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.goPayButton.mas_left).mas_offset(-10);
        make.top.bottom.mas_equalTo(0);
    }];
}
#pragma mark -- 支付
- (void)goPayButtonClick{
    if (self.delegate && [self.delegate respondsToSelector:@selector(goPayClick)]) {
        [self.delegate goPayClick];
    }
}
#pragma mark -- 全选
- (void)allSelectButtonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (self.delegate && [self.delegate respondsToSelector:@selector(allSelected:)]) {
        [self.delegate allSelected:sender.selected];
    }
}
@end
