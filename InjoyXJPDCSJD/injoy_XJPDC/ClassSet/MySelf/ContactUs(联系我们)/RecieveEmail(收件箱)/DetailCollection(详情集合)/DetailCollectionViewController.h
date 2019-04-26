//
//  DetailCollectionViewController.h
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/23.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger,  DetailCollectionOptions) {
    DetailCollectionOptionsSystemNotice         = 0,
    DetailCollectionOptionsMealNotice           = 1 << 0,
    DetailCollectionOptionsInterview            = 1 << 1,
    DetailCollectionOptionsReQueue              = 1 << 2,
    DetailCollectionOptionsQueueReminder        = 2 << 2,

};

@interface DetailCollectionViewController : UIViewController

@property (nonatomic ,strong) NSString *titleString;

@property (nonatomic ,assign) DetailCollectionOptions option;

@end
