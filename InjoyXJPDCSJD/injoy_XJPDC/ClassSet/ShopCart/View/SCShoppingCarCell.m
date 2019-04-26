//
//  SCShoppingCarCell.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SCShoppingCarCell.h"
#import <Masonry.h>
#import "SCShoppingCarCountStepView.h"
#import "SCShoppingCarGoods.h"

@interface SCShoppingCarCell ()

@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *nameLanbel;
@property (nonatomic, strong) UILabel *chineseNameLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) SCShoppingCarCountStepView *stepView;

@end

@implementation SCShoppingCarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setGoods:(SCShoppingCarGoods *)goods{
    _goods = goods;
    _nameLanbel.text = goods.goodsName;
    _chineseNameLabel.text = goods.goodsName;
    _priceLabel.text = [NSString stringWithFormat:@"$%.2f",goods.price];
    _stepView.stepCurrentNumber = goods.count;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    self.selectButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.selectButton setImage:[UIImage imageNamed:@"sc_circle_normal"] forState:UIControlStateNormal];
    [self.selectButton setImage:[UIImage imageNamed:@"sc_circle_selected"] forState:UIControlStateSelected];
    [self.selectButton addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.selectButton];
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(20);
    }];
    self.imgView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imgView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(40);
        make.width.height.mas_equalTo(63);
    }];
    self.nameLanbel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLanbel.text = @"malatang";
    self.nameLanbel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.nameLanbel];
    [self.nameLanbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(self.imgView.mas_right).mas_offset(10);
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(-10);
    }];
    self.chineseNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.chineseNameLabel.text = @"麻辣烫";
    self.chineseNameLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.chineseNameLabel];
    [self.chineseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLanbel.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.imgView.mas_right).mas_offset(10);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(-10);
    }];
    self.priceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.priceLabel.text = @"💲 8/100g";
    self.priceLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.chineseNameLabel.mas_bottom).mas_offset(0);
        make.left.mas_equalTo(self.imgView.mas_right).mas_offset(10);
        make.width.mas_equalTo(100);
        make.bottom.mas_equalTo(-5);
    }];
    self.stepView = [[SCShoppingCarCountStepView alloc] initWithStyle:SCCountStepStyleLabel];
    self.stepView.stepMinNumber = 1;
    self.stepView.stepNumber = 1;
    self.stepView.stepMaxNumber = 999;
    [self.contentView addSubview:self.stepView];
    [self.stepView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(70);
    }];
}
- (void)selectButtonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    self.goods.select = sender.selected;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
