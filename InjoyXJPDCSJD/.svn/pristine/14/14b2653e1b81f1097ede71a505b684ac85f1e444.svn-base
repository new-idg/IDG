//
//  CXStallShopCarCell.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/17.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CXStallShopCarCell.h"
#import <Masonry.h>

@implementation CXStallShopCarCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    self.vegetable = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).mas_offset(13);
            make.centerY.equalTo(self.contentView);
            make.size.mas_offset(CGSizeMake(100, 14));
        }];
        label;
    });
    
    self.price = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor redColor];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_centerX);
            make.centerY.equalTo(self.contentView);
            make.size.mas_offset(CGSizeMake(100, 14));
        }];
        label;
    });
    
    self.addBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).mas_offset(-12);
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        button;
    });
    
    self.numberLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.addBtn.mas_left);
            make.centerY.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(40, 11));
        }];
        label;
    });
    
    self.minusBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.numberLabel.mas_left);
            make.centerY.equalTo(self.addBtn);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        button;
    });
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
