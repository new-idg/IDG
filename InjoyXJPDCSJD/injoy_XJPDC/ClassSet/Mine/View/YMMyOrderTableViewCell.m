//
//  YMMyOrderTableViewCell.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/19.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMMyOrderTableViewCell.h"

@implementation YMMyOrderTableViewCell

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
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(60);
    }];
    
    self.englishNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.englishNameLabel.text = @"01:fried noodles";
    self.englishNameLabel.font = [UIFont systemFontOfSize:14];
    self.englishNameLabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    [self.contentView addSubview:self.englishNameLabel];
    [self.englishNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(self.imgView.mas_right).mas_offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(11);
    }];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.text = @"扬州炒面";
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    self.nameLabel.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    [self.contentView addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.englishNameLabel.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.englishNameLabel.mas_left);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(11);
    }];
    
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.priceLabel.text = @"$: 22";
    self.priceLabel.font = [UIFont systemFontOfSize:15];
    self.priceLabel.textColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1];
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_offset(10);
        make.left.mas_equalTo(self.englishNameLabel.mas_left);
        make.right.mas_equalTo(-100);
        make.height.mas_equalTo(11);
    }];
    
    self.countLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.countLabel.text = @"X1";
    self.countLabel.textAlignment = NSTextAlignmentRight;
    self.countLabel.font = [UIFont systemFontOfSize:13];
    self.countLabel.textColor = [UIColor colorWithRed:70/255.0 green:70/255.0 blue:70/255.0 alpha:1];
    [self.contentView addSubview:self.countLabel];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.priceLabel.mas_top);
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(11);
    }];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
