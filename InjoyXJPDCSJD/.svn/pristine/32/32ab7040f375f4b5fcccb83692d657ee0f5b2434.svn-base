//
//  CXLabel.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/5.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CXLabel.h"

@implementation CXLabel

-(void)setTitle:(NSString *)title{
    _title = title;
    NSString *string =[NSString stringWithFormat:@"%@%@",self.title,self.content];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange range = [string rangeOfString:self.title];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range];
    self.attributedText = attString;
}

-(void)setContent:(NSString *)content{
    _content = content;
    NSString *string =[NSString stringWithFormat:@"%@%@",self.title,self.content];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange range = [string rangeOfString:self.title];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range];
    self.attributedText = attString;
}

-(void)setTitleColor:(UIColor *)titleColor{
    NSString *string =[NSString stringWithFormat:@"%@%@",self.title,self.content];
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    
    NSRange range = [string rangeOfString:self.title];
    [attString addAttribute:NSForegroundColorAttributeName value:titleColor range:range];
    self.attributedText = attString;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
