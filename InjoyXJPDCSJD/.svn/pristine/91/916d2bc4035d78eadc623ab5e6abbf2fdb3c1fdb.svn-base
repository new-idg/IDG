//
//  CollectionCell.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/4.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CollectionCell.h"
#import <Masonry.h>

@implementation CollectionCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    self.typeImage = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"hunhe"];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_offset(20);
            make.size.mas_offset(CGSizeMake(20, 20));
        }];
        imageView;
    });
    
    
    
    self.codeLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"518888";
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).mas_offset(-10);
            make.top.mas_offset(5);
            make.size.mas_offset(CGSizeMake(80, 20));
        }];
        label;
    });
    
    self.location = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"nearby"] forState:UIControlStateNormal];
        
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-10);
            make.top.equalTo(self.codeLabel.mas_bottom).mas_offset(5);
            make.size.mas_offset(CGSizeMake(15, 20));
        }];
        button;
    });
    
    self.distanceLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"200m";
        label.font = [UIFont systemFontOfSize:11];
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor grayColor];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.location.mas_left).mas_offset(-10);
            make.top.equalTo(self.codeLabel.mas_bottom).mas_offset(5);
            make.size.mas_offset(CGSizeMake(80, 20));
        }];
        label;
    });
    
    
    
    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"深圳好运来管理公司食堂";
        label.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeImage.mas_right).mas_offset(10);
            make.right.equalTo(self.distanceLabel.mas_left).mas_offset(-10);
            make.top.equalTo(self.contentView).mas_offset(5);
            make.height.mas_offset(20);
        }];
        label;
    });
    
    self.addressLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"深圳市南山区桃园路2号";
        label.textColor = [UIColor grayColor];
        label.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeImage.mas_right).mas_offset(10);
            make.right.equalTo(self.distanceLabel.mas_left).mas_offset(-10);
            make.top.equalTo(self.titleLabel.mas_bottom).mas_offset(5);
            make.height.mas_offset(20);
        }];
        label;
    });
}

-(void)setWithModel:(NearbyModel *)model{
    
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
