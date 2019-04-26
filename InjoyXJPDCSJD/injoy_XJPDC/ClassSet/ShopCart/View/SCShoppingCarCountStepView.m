//
//  SCShoppingCarCountStepView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SCShoppingCarCountStepView.h"
#import <Masonry.h>

@interface SCShoppingCarCountStepView ()<UITextFieldDelegate>

@property (nonatomic, assign) SCCountStepStyle style;
@property (nonatomic, strong) UIButton * increaseButton;
@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UITextField *numberTextField;
@property (nonatomic, strong) UIButton * decreaseButton;

@end

@implementation SCShoppingCarCountStepView

#pragma mark -- settter &&getter
- (UIButton *)increaseButton{
    if (_increaseButton == nil) {
        _increaseButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_increaseButton setBackgroundImage:[UIImage imageNamed:@"sc_increase_icon"] forState:UIControlStateNormal];
        [_increaseButton addTarget:self action:@selector(increaseButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _increaseButton;
}
- (UIButton *)decreaseButton{
    if (_decreaseButton == nil) {
        _decreaseButton = [[UIButton alloc] initWithFrame:CGRectZero];
        [_decreaseButton setBackgroundImage:[UIImage imageNamed:@"sc_decrease_icon"] forState:UIControlStateNormal];
        [_decreaseButton addTarget:self action:@selector(decreaseButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _decreaseButton;
}
- (UILabel *)numberLabel{
    if (_numberLabel == nil) {
        _numberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _numberLabel.font = [UIFont systemFontOfSize:15];
        _numberLabel.textColor = [UIColor blackColor];
        _numberLabel.text = [NSString stringWithFormat:@"%ld",self.stepNumber];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _numberLabel;
}
- (UITextField *)numberTextField{
    if (_numberTextField == nil) {
        _numberTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _numberTextField.delegate = self;
        _numberTextField.borderStyle = UITextBorderStyleRoundedRect;
        _numberTextField.keyboardType = UIKeyboardTypeNumberPad;
        _numberTextField.textAlignment = NSTextAlignmentCenter;
        _numberTextField.text = [NSString stringWithFormat:@"%ld",self.stepMinNumber];
    }
    return _numberTextField;
}

- (instancetype)initWithStyle:(SCCountStepStyle)style{
    self = [super init];
    if (self) {
        self.style = style;
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    self.stepNumber = 1;
    self.stepMaxNumber = 999;
    self.stepMinNumber = 1;
    
    [self addSubview:self.increaseButton];
    [self.increaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.mas_equalTo(0);
        make.width.height.mas_equalTo(20);
    }];
    [self addSubview:self.decreaseButton];
    [self.decreaseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(0);
        make.width.height.mas_equalTo(20);
    }];
    if (self.style == SCCountStepStyleLabel) {
        [self addSubview:self.numberLabel];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(self.decreaseButton.mas_right).mas_offset(0);
            make.right.mas_equalTo(self.increaseButton.mas_left).mas_offset(0);
        }];
    } else {
        [self addSubview:self.numberTextField];
        [self.numberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.left.mas_equalTo(self.decreaseButton.mas_right).mas_offset(0);
            make.right.mas_equalTo(self.increaseButton.mas_left).mas_offset(0);
        }];
    }
}
#pragma mark -- target
- (void)increaseButtonClick{
    self.stepCurrentNumber ++;
 
    if (self.style == SCCountStepStyleLabel) {
        self.numberLabel.text = [NSString stringWithFormat:@"%ld",self.stepCurrentNumber];
    } else {
        self.numberTextField.text = [NSString stringWithFormat:@"%ld",self.stepCurrentNumber];
    }
    if (self.block) {
        self.block(self.stepCurrentNumber);
    }
}
- (void)decreaseButtonClick{
    self.stepCurrentNumber --;
  
    if (self.style == SCCountStepStyleLabel) {
        self.numberLabel.text = [NSString stringWithFormat:@"%ld", self.stepCurrentNumber];
    } else {
        self.numberTextField.text = [NSString stringWithFormat:@"%ld", self.stepCurrentNumber];
    }
    if (self.block) {
        self.block( self.stepCurrentNumber);
    }
}
@end
