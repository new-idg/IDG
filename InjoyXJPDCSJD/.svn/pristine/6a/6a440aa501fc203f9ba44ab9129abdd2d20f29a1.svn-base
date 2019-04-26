//
//  CXPayMethodView.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/19.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CXPayMethodView.h"

@implementation CXPayMethodView
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
    
    UILabel *selectPayMothod = [[UILabel alloc] init];
    selectPayMothod.text = @"    选择支付方式";
    selectPayMothod.frame = CGRectMake(0, 0, Screen_Width, 60);
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, bgView.frame.size.height-400, Screen_Width, 400);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = selectPayMothod;
    [bgView addSubview:tableView];
    
    UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
    close.frame = CGRectMake(Screen_Width-16-20, 20, 20, 20);
    [close setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [close addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [tableView addSubview:close];
}

-(void)closeAction{
    [self removeFromSuperview];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CXPayMethodView";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }else{
        for (UIButton *btn in cell.subviews) {
            [btn removeFromSuperview];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    selectBtn.frame = CGRectMake(Screen_Width-16-21, 17, 21, 21);
    selectBtn.tag = indexPath.row+100;
    [selectBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
    [selectBtn setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
//    [selectBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:selectBtn];
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"applepay"];
        cell.textLabel.text = @"Apple Pay";
        selectButton = selectBtn;
        selectBtn.selected = YES;
    }else if (indexPath.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"alipay"];
        cell.textLabel.text = @"支付宝";
    }else if (indexPath.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"wechat"];
        cell.textLabel.text = @"微信";
    }else if (indexPath.row == 3){
        cell.imageView.image = [UIImage imageNamed:@"bank"];
        cell.textLabel.text = @"银行卡支付";
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIButton *button = [self viewWithTag:indexPath.row+100];
    
    selectButton.selected = NO;
    button.selected = YES;
    selectButton = button;
    [self.delegate payMethodViewRow:button.tag-100];
}


//-(void)selectBtnAction:(UIButton *)sender{
////    selectBtn = sender;
////    NSLog(@"%i",sender.tag-100);
//    selectButton.selected = NO;
//    sender.selected = YES;
//    selectButton = sender;
//    [self.delegate payMethodViewRow:sender.tag-100];
//}

-(void)show{
    [KEY_WINDOW addSubview:self];
}

-(void)hidden{
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
