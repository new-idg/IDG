//
//  CXShopCarView.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/17.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CXShopCarView.h"
#import <Masonry.h>
#import "CXStallShopCarCell.h"
#import "ChooseFlavorModel.h"

@implementation CXShopCarView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    
    //背景图
    UIView *bgView = [[UIView alloc] init];
    bgView.frame = CGRectMake(0, navHigh, Screen_Width, Screen_Height-navHigh);
    bgView.backgroundColor = RGBACOLOR(102, 102, 102, 0.5);
    
    [self addSubview:bgView];
    
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 200, Screen_Width, Screen_Height-200);
    tableView.delegate = self;
    tableView.dataSource = self;
    [bgView addSubview:tableView];
    self.tableView = tableView;
    
}

#pragma mark - UITableView代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"stallShopCarCell";
    CXStallShopCarCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CXStallShopCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    ChooseFlavorModel *model = self.dataArray[indexPath.row];
    
    cell.vegetable.text = model.vegetable;
    cell.price.text = [NSString stringWithFormat:@"S$%@",model.price];
    cell.numberLabel.text = [NSString stringWithFormat:@"%i",model.number];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

#pragma mark - 显示隐藏方法
-(void)showInView:(UIView *)view{
    [view addSubview:self];
}
-(void)hidden{
    [self removeFromSuperview];
}
-(void)setDataArray:(NSMutableArray *)dataArray{
    _dataArray = dataArray;
    [self.tableView reloadData];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
