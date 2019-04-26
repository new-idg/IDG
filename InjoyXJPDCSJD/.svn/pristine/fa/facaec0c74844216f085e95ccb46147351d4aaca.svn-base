//
//  YMAlertView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/19.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMAlertView.h"

@interface YMAlertView ()

@property (nonatomic, strong) UIButton *bgView;
@property (nonatomic, strong) UILabel *titleLabel;///<标题
@property (nonatomic, strong) UILabel *messageLabel;///<信息
@property (nonatomic, strong) UIButton *sureButton;///<确定

@end

@implementation YMAlertView
#pragma mark --setter && getter
- (UIButton *)bgView{
    if (_bgView == nil) {
        _bgView = [[UIButton alloc] initWithFrame:CGRectZero];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = .3;
        [_bgView addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bgView;
}
- (UILabel *)titleLabel{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = RGBACOLOR(36, 36, 36, 1);
        _titleLabel.font = [UIFont systemFontOfSize:17];
    }
    return _titleLabel;
}
- (UILabel *)messageLabel{
    if (_messageLabel == nil) {
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel.textColor = RGBACOLOR(36, 36, 36, 1);
        _messageLabel.font = [UIFont systemFontOfSize:14];
        _messageLabel.numberOfLines = 0;
    }
    return _messageLabel;
}
- (UIButton *)sureButton{
    if (_sureButton == nil) {
        _sureButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        _sureButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [_sureButton setTitleColor:RGBACOLOR(36, 36, 36, 1) forState:UIControlStateNormal];
        [_sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}
#pragma mark --instancetype
- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message{
    self = [super init];
    if (self) {
        [self setupSubview];
        self.titleLabel.text = [title copy];
        self.messageLabel.text = [message copy];
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
#pragma mark -- action
- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window == nil) {
        window = [UIApplication sharedApplication].delegate.window;
    }
    [UIView animateWithDuration:.25 animations:^{
        [window addSubview:self];
    }];
}
- (void)sureButtonClick{
    [UIView animateWithDuration:.25 animations:^{
        [self.bgView removeFromSuperview];
        [self removeFromSuperview];
    }];
}
- (void)setupSubview{
    //self
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor clearColor];
    //bg
    self.bgView.frame = self.bounds;
    [self addSubview:self.bgView];
    //contentView
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectZero];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.clipsToBounds = YES;
    contentView.layer.cornerRadius = 3;
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(53);
        make.right.mas_equalTo(-53);
    }];
    [contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    [contentView addSubview:self.messageLabel];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(5);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
    }];
    [contentView addSubview:self.sureButton];
    [self.sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.messageLabel.mas_bottom).mas_offset(10);
        make.bottom.left.right.mas_equalTo(0);
    }];
}

@end
