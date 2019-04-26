//
//  YMParameterSettingCell.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2019/1/4.
//  Copyright © 2019 CX. All rights reserved.
//

#import "YMParameterSettingCell.h"

@implementation YMParameterSettingCell

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
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.text = @"辣不辣 aaaaaaaaa";
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(13);
        make.centerY.mas_equalTo(0);
    }];
    self.moneySwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.moneySwitch];
    [self.moneySwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-13);
        make.centerY.mas_equalTo(0);
    }];
    self.moneyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.moneyLabel.text = @"+$2.00";
    self.moneyLabel.font = [UIFont systemFontOfSize:15];
    self.moneyLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.moneyLabel];
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).mas_offset(5);
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(self.moneySwitch.mas_left).mas_offset(-20);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
