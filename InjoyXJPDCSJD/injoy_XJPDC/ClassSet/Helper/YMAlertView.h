//
//  YMAlertView.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/19.
//  Copyright © 2018 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMAlertView : UIView


- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;

- (void)show;
@end
