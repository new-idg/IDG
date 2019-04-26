//
//  SJPSettlementCell.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/18.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SJPSettlementCell.h"
#import "UILabel+VerticalAlign.h"

#define imageSize 63

#define space16 16
#define space15 15
#define space12 12
#define space10 10

#define font14 14
#define font13 13
#define font12 12
#define font10 10

@implementation SJPSettlementCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    
    bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 2;
    bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12);
        make.bottom.mas_equalTo(-0);
        make.left.right.equalTo(self);
    }];
    
    self.deleteBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        [bgView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-space15);
            make.top.mas_equalTo(space15);
            make.size.mas_equalTo(CGSizeMake(font14, font14));
        }];
        button;
    });
    
    self.stallLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:font14];
        label.text = @"都城快餐";
        [bgView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(space15);
            make.top.mas_equalTo(space15);
            make.right.mas_equalTo(self.deleteBtn.mas_left);
            make.top.mas_equalTo(font14);
        }];
        label;
    });
    
    UIView *line1 = [self createLine:self.stallLabel];
    
    self.headerImage = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"tupian1"];
        [bgView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(space15);
            make.top.mas_equalTo(line1.mas_bottom).mas_offset(space15);
            make.size.mas_equalTo(CGSizeMake(imageSize, imageSize));
        }];
        imageView;
    });
    
    self.englishName = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = kFontOfSize(font10);
        label.text = @"engilihgkjhh";
        [bgView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headerImage.mas_right).mas_offset(space12);
            make.top.equalTo(self.headerImage);
            make.right.mas_equalTo(self->bgView).mas_offset(-space12);
            make.height.mas_equalTo(font10);
        }];
        label;
    });
    
    self.vegetable = ({
        UILabel *label = [[UILabel alloc] init];
        label.font = kFontOfSize(font13);
        label.text = @"尖椒炒肉";
        [bgView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.englishName);
            make.top.mas_equalTo(self.englishName.mas_bottom).mas_offset(space10);
            make.right.equalTo(self.englishName);
            make.height.mas_offset(font13);
        }];
        label;
    });
    
    self.numberLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"x1";
        label.textAlignment = NSTextAlignmentRight;
        label.font = kFontOfSize(font10);
        [bgView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.englishName);
            make.top.mas_equalTo(self.vegetable.mas_bottom).mas_offset(space16);
            make.size.mas_equalTo(CGSizeMake(40, font10));
        }];
        label;
    });
    
    self.price = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"S$25";
        label.font = kFontOfSize(font12);
        [bgView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.englishName);
            make.top.mas_equalTo(self.vegetable.mas_bottom).mas_offset(space16);
            make.right.mas_equalTo(self.numberLabel.mas_left);
            make.height.mas_equalTo(font12);
        }];
        label;
    });
    
    UIView *line2 = [self createLine:self.price];
    
    self.selectedLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"基本要求：微辣/加饭/不加葱/打包";
        label.font = kFontOfSize(font13);
        [bgView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerImage);
            make.top.mas_equalTo(line2.mas_bottom).mas_offset(space16);
            make.right.mas_equalTo(self.numberLabel.mas_left);
            make.height.mas_equalTo(font13);
        }];
        label;
    });
    
    self.remarks = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"特殊要求：特殊要求特殊要求特殊要求特殊要求特殊要求特殊要求特殊要求特殊要求";
        label.font = kFontOfSize(font13);
        [label alignTop];
        label.textColor = [UIColor redColor];
        label.numberOfLines = 0;
        [bgView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerImage);
            make.top.mas_equalTo(self.selectedLabel.mas_bottom).mas_offset(space16);
            make.right.mas_equalTo(self.numberLabel.mas_left);
            make.height.mas_equalTo(40);
        }];
        label;
    });
}

-(UIView *)createLine:(UIView *)view{
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = kBackgroundColor;
    [bgView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->bgView).mas_offset(15);
        make.right.equalTo(self->bgView).mas_offset(-15);
        make.top.mas_equalTo(view.mas_bottom).mas_offset(space15);
        make.height.mas_equalTo(1);
    }];
    
    return line;
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
