//
//  SCShoppingCarHeaderView.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SCShoppingCarHeaderView.h"
#import <Masonry.h>
#import "SCShoppingCarStore.h"

@interface SCShoppingCarHeaderView ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *subNameLabel;
@property (nonatomic, strong) UIButton *selectButton;
@property (nonatomic, strong) UIButton *deleteButton;

@end

@implementation SCShoppingCarHeaderView

- (void)setStore:(SCShoppingCarStore *)store{
    _store = store;
    self.nameLabel.text = store.storeName;
    self.subNameLabel.text = store.storeName;
}
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubview];
    }
    return self;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubview];
    }
    return self;
}
- (void)setupSubview{
    self.backgroundColor = [UIColor whiteColor];
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.text = @"广州好运来管理公司食阁";
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
    self.selectButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.selectButton setImage:[UIImage imageNamed:@"sc_circle_normal"] forState:UIControlStateNormal];
    [self.selectButton setImage:[UIImage imageNamed:@"sc_circle_selected"] forState:UIControlStateSelected];
    [self.selectButton addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.selectButton];
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.mas_equalTo(-10);
        make.width.height.mas_equalTo(20);
    }];
    self.subNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.subNameLabel.text = @"珠江新城都城快餐";
    self.subNameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.subNameLabel];
    [self.subNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.left.mas_equalTo(40);
        make.right.mas_equalTo(-40);
        make.height.mas_equalTo(20);
    }];
    
    self.deleteButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.deleteButton setImage:[UIImage imageNamed:@"sc_delete_icon"] forState:UIControlStateNormal];
    [self.deleteButton addTarget:self action:@selector(deleteButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.deleteButton];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(-10);
        make.width.height.mas_equalTo(20);
    }];
    
}

- (void)deleteButtonClick:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(shoppingCarHeaderDeleteStore:)]) {
        [self.delegate shoppingCarHeaderDeleteStore:self.store];
    }
}
- (void)selectButtonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if(self.delegate && [self.delegate respondsToSelector:@selector(shoppingCarHeaderSeleteStore:selected:)]){
        [self.delegate shoppingCarHeaderSeleteStore:self.store selected:sender.selected];
    }
}
@end
