//
//  HistoryCell.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/4.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "HistoryCell.h"
#import <Masonry.h>

@implementation HistoryCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    self.topView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor =RGBACOLOR(250, 250, 250, 1);
        [self.contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.mas_equalTo(self.contentView);
            make.height.mas_equalTo(40);
        }];
        view;
    });
    
    self.timeLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"04/08/2018 20:00";
        label.font = [UIFont systemFontOfSize:13];
        [self.topView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.centerY.equalTo(self.topView.mas_centerY);
            make.height.mas_offset(13);
            make.right.mas_offset(Screen_Width/2);
        }];
        label;
    });

    self.oddNumbers = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"单号：2018080400211101010";
        label.font = [UIFont systemFontOfSize:13];
        [self.topView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(Screen_Width/2);
            make.centerY.equalTo(self.topView.mas_centerY);
            make.height.mas_offset(13);
            make.right.mas_offset(-10);
        }];
        label;
    });
    
    self.location = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"nearby"] forState:UIControlStateNormal];
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-10);
            make.top.mas_equalTo(self.topView.mas_bottom).offset(10);
            make.size.mas_offset(CGSizeMake(15, 20));
        }];
        button;
    });
    
    self.state = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"已取消";
        label.textAlignment = NSTextAlignmentRight;
        label.textColor = [UIColor redColor];
        label.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-10);
            make.top.mas_equalTo(self.location.mas_bottom).mas_offset(5);
            make.size.mas_offset(CGSizeMake(40, 13));
        }];
        label;
    });
    
    self.price = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"$25";
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-10);
            make.top.mas_equalTo(self.state.mas_bottom).mas_offset(5);
            make.size.mas_offset(CGSizeMake(40, 12));
        }];
        label;
    });

    self.titleLabel = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"深圳好运来管理公司食堂";
        label.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).mas_offset(13);
            make.right.mas_equalTo(self.location.mas_left).mas_offset(-10);
            make.top.equalTo(self.location);
            make.height.mas_offset(16);
            
        }];
        label;
    });

    self.typeImage = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"hunhe"];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(5);
            make.size.mas_offset(CGSizeMake(20, 20));
        }];
        imageView;
    });

    self.stall = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"辣记熟食";
        label.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.typeImage.mas_right).mas_offset(5);
            make.top.equalTo(self.typeImage);
            make.right.equalTo(self.state).mas_offset(-10);
            make.height.mas_offset(16);
        }];
        label;
    });

    self.vegetable =({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"土豆肉丝+鱼香肉丝+青菜";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.stall);
            make.top.mas_equalTo(self.stall.mas_bottom).mas_offset(5);
            make.right.mas_equalTo(self.price.mas_left).mas_offset(-10);
            make.height.mas_offset(13);
        }];
        label;
    });

    self.deleteOrder = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"删除订单" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        button.layer.borderWidth = 1;
        button.layer.borderColor = RGBACOLOR(240, 240, 240, 1).CGColor;
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-10);
            make.top.mas_equalTo(self.price.mas_bottom).mas_offset(5);
            make.size.mas_offset(CGSizeMake(80, 30));
        }];
        button;
    });

    self.oneMoreList = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"再来一单" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.layer.borderWidth = 1;
        button.layer.borderColor = RGBACOLOR(240, 240, 240, 1).CGColor;
        [self.contentView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.deleteOrder.mas_left).mas_offset(-10);
            make.top.equalTo(self.deleteOrder);
            make.size.mas_offset(CGSizeMake(80, 30));
        }];
        button;
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
