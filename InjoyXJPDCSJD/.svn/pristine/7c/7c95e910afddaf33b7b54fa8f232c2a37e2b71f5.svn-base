//
//  SCShoppingCarFooterView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SCShoppingCarFooterView.h"
#import <Masonry.h>
#import <YYCategories.h>

@interface SCShoppingCarFooterView ()

@property (nonatomic, strong) UILabel *baseDemandLabel;
@property (nonatomic, strong) UILabel *specialDemandLabel;
@property (nonatomic, strong) UILabel *totalLabel;
@end

@implementation SCShoppingCarFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubview];
    }
    return self;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    self.backgroundColor = [UIColor whiteColor];

    self.baseDemandLabel = [[UILabel alloc] init];
    self.baseDemandLabel.text = @"基本要求: 微辣/加饭/不加葱/打包";
    self.baseDemandLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.baseDemandLabel];
    [self.baseDemandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(20);
    }];
    self.specialDemandLabel = [[UILabel alloc] init];
    self.specialDemandLabel.font = [UIFont systemFontOfSize:14];
    self.specialDemandLabel.text = @"特殊要求: 特殊要求特殊要求特殊要求特殊要求";
    [self addSubview:self.specialDemandLabel];
    [self.specialDemandLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.baseDemandLabel.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(20);
    }];
    UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
    line.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.height.mas_equalTo(1);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.specialDemandLabel.bottom).mas_offset(10);
    }];
    self.totalLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.totalLabel.text = @"合计 23💲";
    self.totalLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.totalLabel];
    [self.totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(30);
    }];
}
@end
