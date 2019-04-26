//
//  YMMineTableViewCell.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import "YMMineTableViewCell.h"

@implementation YMMineTableViewCell

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
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(20);
    }];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(self.imgView.mas_right).mas_offset(15);
    }];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
