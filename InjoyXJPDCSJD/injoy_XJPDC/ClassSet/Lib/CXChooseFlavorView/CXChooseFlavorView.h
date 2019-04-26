//
//  CXChooseFlavorView.h
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/6.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChooseFlavorModel.h"

#define vegetableViewHeight 120
#define allViewHeight 547
#define vegetableViewY Screen_Height-allViewHeight
#define lineSpace 16
#define closeSpace 20
#define imageSpace 95
#define itemWidth (Screen_Width - lineSpace*4)/3
#define itemHeight 34
#define itemSpace 13
#define cellHeaderViewHeight 40
#define cellFooterViewHeight 60

typedef void (^ChooseFlavorBlock)(ChooseFlavorModel *model);

@interface CXChooseFlavorView : UIView
/** <#Description#> */
@property (nonatomic, strong) ChooseFlavorModel *model;
/** block */
@property (nonatomic, copy) ChooseFlavorBlock chooseFlavorBlock;
-(instancetype)init;
-(instancetype)initWithFrame:(CGRect)frame;
-(void)setChooseFlavorModel:(ChooseFlavorModel *)model;
-(void)showInView:(UIView *)view;
-(void)hidden;
@end
