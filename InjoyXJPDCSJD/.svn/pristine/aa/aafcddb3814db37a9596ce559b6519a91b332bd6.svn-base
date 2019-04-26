//
//  CXChooseView.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/6.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CXChooseView.h"
#import <UIView+YYAdd.h>

@implementation CXChooseView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor =RGBACOLOR(82, 82, 82, 1);
    bgView.frame = CGRectMake(0, self.frame.size.height-50, Screen_Width, 50);
    [self addSubview:bgView];
    
    self.shopCart = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shopCart.frame = CGRectMake(12, self.frame.size.height-62, 50, 50);
    [self.shopCart setImage:[UIImage imageNamed:@"shopcart_gray"] forState:UIControlStateNormal];
    self.shopCart.imageEdgeInsets = UIEdgeInsetsMake(12, 12, 12, 12);
    self.shopCart.backgroundColor =RGBACOLOR(102, 102, 102, 1);
    self.shopCart.layer.cornerRadius = 25;
    self.shopCart.layer.masksToBounds = YES;
    [self.shopCart addTarget:self action:@selector(shopCartAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.shopCart];
    
    self.settlement = [UIButton buttonWithType:UIButtonTypeCustom];
    self.settlement.frame = CGRectMake(Screen_Width-100, 12, 100, 50);
    [self.settlement setTitle:@"去结算" forState:UIControlStateNormal];
    self.settlement.backgroundColor = RGBACOLOR(114, 114, 114, 1);
    self.settlement.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.settlement setTitleColor:RGBACOLOR(194, 194, 194, 1) forState:UIControlStateNormal];
    [self.settlement addTarget:self action:@selector(settlementAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.settlement];
    
    self.chooseGoods = [[UILabel alloc] init];
    self.chooseGoods.frame = CGRectMake(self.shopCart.right+11, 19+12, Screen_Height-self.shopCart.right-11-self.settlement.frame.size.width, 13);
    self.chooseGoods.font = [UIFont systemFontOfSize:13];
    self.chooseGoods.text = @"未选购商品";
    self.chooseGoods.textColor = [UIColor whiteColor];
    [self addSubview:self.chooseGoods];
}
-(void)shopCartAction:(UIButton *)sender{
    [self.delegate chooseViewSelectIndex:0];
}
-(void)settlementAction:(UIButton *)sender{
    [self.delegate chooseViewSelectIndex:1];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
