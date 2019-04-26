//
//  CXChooseFlavorCell.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/6.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CXChooseFlavorCell.h"

@implementation CXChooseFlavorCell
-(UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        _textLabel.layer.cornerRadius = 2;
        _textLabel.font = [UIFont systemFontOfSize:13];
        _textLabel.layer.masksToBounds = YES;
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_textLabel];
    }
    
    return _textLabel;
}
@end
