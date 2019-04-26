//
//  YMQueueOrderTableViewCell.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMQueueOrderTableViewCell.h"

@implementation YMQueueOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    self.goodsPictureImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.goodsPictureImageView.backgroundColor = [UIColor redColor];
    
    [self.contentView addSubview:self.goodsPictureImageView];
    [self.goodsPictureImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.width.height.mas_equalTo(32);
    }];
    
    self.englishNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.englishNameLabel.text = @"01: Lemon tea";
    self.englishNameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.englishNameLabel];
    [self.englishNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.goodsPictureImageView.mas_top);
        make.left.mas_equalTo(self.goodsPictureImageView.mas_right).mas_offset(10);
    }];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.text = @"青柠柠檬茶";
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.goodsPictureImageView.mas_bottom);
        make.left.mas_equalTo(self.goodsPictureImageView.mas_right).mas_offset(10);
    }];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
