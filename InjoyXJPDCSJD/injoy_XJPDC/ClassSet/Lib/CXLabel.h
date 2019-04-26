//
//  CXLabel.h
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/5.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CXLabel : UILabel
/** title */
@property (nonatomic, copy) NSString *title;
/** content */
@property (nonatomic, strong) NSString *content;
/** titleColor */
@property (nonatomic, strong) UIColor *titleColor;
@end
