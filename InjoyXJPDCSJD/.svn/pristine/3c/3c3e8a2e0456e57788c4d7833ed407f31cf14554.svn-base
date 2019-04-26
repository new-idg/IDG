//
//  StallCell.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/5.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "StallCell.h"

@implementation StallCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    self.headerImage = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"suancaiyu"];
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self).mas_offset(10);
            make.size.mas_offset(CGSizeMake(95, 95));
        }];
        imageView;
    });
    
    self.englishName = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"01:Acid fish";
        label.font = [UIFont systemFontOfSize:12];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headerImage.mas_right).mas_offset(10);
            make.top.equalTo(self.headerImage);
            make.right.mas_offset(-10);
            make.height.mas_offset(12);
        }];
        label;
    });
    
    self.vegetable = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"酸菜鱼";
        label.font = [UIFont systemFontOfSize:15];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headerImage.mas_right).mas_offset(10);
            make.top.mas_equalTo(self.englishName.mas_bottom).mas_offset(10);
            make.right.mas_offset(-10);
            make.height.mas_offset(12);
        }];
        label;
    });
    
    self.vegetableIntroduce = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"招牌菜：主要原料：草鱼，芥菜";
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor lightGrayColor];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headerImage.mas_right).mas_offset(10);
            make.top.mas_equalTo(self.vegetable.mas_bottom).mas_offset(10);
            make.right.mas_offset(-10);
            make.height.mas_offset(12);
        }];
        label;
    });
    
    self.salesVolume = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"月售：20份";
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor lightGrayColor];
        
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headerImage.mas_right).mas_offset(10);
            make.top.mas_equalTo(self.vegetableIntroduce.mas_bottom).mas_offset(10);
            make.size.mas_offset(CGSizeMake(80, 10));
        }];
        label;
    });
    
    self.calorie = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"卡路里：低";
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor lightGrayColor];
        
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.salesVolume.mas_right).mas_offset(10);
            make.top.equalTo(self.salesVolume);
            make.size.mas_offset(CGSizeMake(80, 10));
        }];
        label;
    });
    
    self.price = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"s$ 25";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor redColor];
        
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.salesVolume);
            make.top.mas_equalTo(self.salesVolume.mas_bottom).mas_offset(10);
            make.size.mas_offset(CGSizeMake(100, 13));
        }];
        label;
    });
    
    self.addBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-10);
            make.top.equalTo(self.price);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        button;
    });
    
    self.numberLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.addBtn.mas_left);
            make.top.equalTo(self.addBtn);
            make.size.mas_equalTo(CGSizeMake(40, 22));
        }];
        label;
    });
    
    self.minusBtn = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"minus"] forState:UIControlStateNormal];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.numberLabel.mas_left);
            make.top.equalTo(self.addBtn);
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
        button;
    });
}

-(void)setCellModel:(ChooseFlavorModel *)model{
    self.headerImage.image = [UIImage imageNamed:model.imageUrl];
    self.englishName.text = model.englishName;
    self.vegetable.text = model.vegetable;
    self.vegetableIntroduce.text = model.vegetableIntroduce;
    self.salesVolume.text = [NSString stringWithFormat:@"月售：%@",model.salesVolume];
    self.calorie.text = [NSString stringWithFormat:@"卡路里：%@",model.calorie];
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
