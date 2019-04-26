//
//  YMMineTableHeaderView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMMineTableHeaderView.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <Masonry.h>


@interface YMMineTableHeaderView()

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *phoneNumberImageView;
@property (nonatomic, strong) UILabel *phoneNumberLabel;

@end

@implementation YMMineTableHeaderView

- (instancetype)initWithAvatarImageURL:(UIImage *)url name:(NSString *)name phoneNumber:(NSString *)phoneNumber{
    self = [super init];
    if (self) {
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview{
    self.backgroundColor = [MyPublicClass colorWithHexString:@"#F83030"];
    
    self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"weChat"]];
    [self addSubview:self.avatarImageView];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(70);
    }];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.font = [UIFont systemFontOfSize:20];
    self.nameLabel.text = @"张三";
    self.nameLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(15);
        make.top.mas_equalTo(self.avatarImageView.mas_top).mas_offset(10);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(20);
    }];
    self.phoneNumberImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.phoneNumberImageView.image = [UIImage imageNamed:@"phone-white"];
    [self addSubview:self.phoneNumberImageView];
    [self.phoneNumberImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel);
        make.bottom.mas_equalTo(self.avatarImageView.mas_bottom).mas_offset(-10);
        make.width.mas_equalTo(8);
        make.height.mas_equalTo(13);
    }];
    
    self.phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.phoneNumberLabel.font = [UIFont systemFontOfSize:13];
    self.phoneNumberLabel.textColor = [UIColor whiteColor];
    self.phoneNumberLabel.text = @"186****8603";
    [self addSubview:self.phoneNumberLabel];
    [self.phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.phoneNumberImageView.mas_right).mas_offset(5);
        make.bottom.mas_equalTo(self.phoneNumberImageView.mas_bottom);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(self.phoneNumberImageView);
    }];
    
    UIImageView *arrowImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    arrowImageView.image = [UIImage imageNamed:@"arrows-white"];
    [self addSubview:arrowImageView];
    [arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
    }];
    
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
    singleTapGesture.numberOfTapsRequired = 1;
    singleTapGesture.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:singleTapGesture];
    
}
- (void)handleSingleTap:(UITapGestureRecognizer *)tagGestureRecognizer{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableHeaderViewClick)]) {
        [self.delegate tableHeaderViewClick];
    }
}

@end
