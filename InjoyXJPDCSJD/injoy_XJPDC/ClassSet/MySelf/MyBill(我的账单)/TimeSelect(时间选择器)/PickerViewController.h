//
//  PickerViewController.h
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/9/25.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PickerViewDelegate<NSObject>
@required
-(void)showTime:(NSDictionary *)timeDictionary;
@end

@interface PickerViewController : UIViewController

@property (nonatomic ,assign) id<PickerViewDelegate>delegate;

@end
