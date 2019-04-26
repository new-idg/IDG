//
//  CanteenCell.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/5.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CanteenCell.h"

@implementation CanteenCell

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
            make.left.equalTo(self.contentView).mas_offset(12);
            make.top.equalTo(self.contentView).mas_offset(15);
            make.size.mas_offset(CGSizeMake(70, 70));
        }];
        imageView;
    });
    
    self.typeImage = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"suancaiyu"];
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headerImage.mas_right).mas_offset(12);
            make.top.equalTo(self.headerImage);
            make.size.mas_offset(CGSizeMake(17, 17));
        }];
        imageView;
    });
    
    self.stall = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"#02-027：麻辣火锅";
        label.font = [UIFont boldSystemFontOfSize:16];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.typeImage.mas_right).mas_offset(7);
            make.top.equalTo(self.headerImage);
            make.right.equalTo(self.contentView).mas_offset(-10);
            make.height.mas_offset(16);
        }];
        label;
    });
    
    self.englishName = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Spicy hot pot";
        label.font = [UIFont systemFontOfSize:15];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeImage);
            make.top.mas_equalTo(self.stall.mas_bottom).mas_offset(12);
            make.right.equalTo(self.contentView).mas_offset(-10);
            make.height.mas_offset(15);
        }];
        label;
    });
    
    self.mainCamp = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"主营：饭食";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor grayColor];
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeImage);
            make.top.mas_equalTo(self.englishName.mas_bottom).mas_offset(12);
            make.size.mas_offset(CGSizeMake(100, 13));
        }];
        label;
    });
    
    self.lineUp = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"排队人数：5";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor redColor];
        
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:label.text];
        [string addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
        label.attributedText = string;
        
        [self addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(Screen_Width/3*2);
            make.top.mas_equalTo(self.englishName.mas_bottom).mas_offset(12);
            make.right.equalTo(self.contentView).mas_offset(-10);
            make.height.mas_offset(13);
        }];
        label;
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
