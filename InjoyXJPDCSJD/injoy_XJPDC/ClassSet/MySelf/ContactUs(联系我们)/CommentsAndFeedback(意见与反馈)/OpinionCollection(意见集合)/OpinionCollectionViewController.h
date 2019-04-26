//
//  OpinionCollectionViewController.h
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/22.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger,  OpinionCollectionOptions) {
    OpinionCollectionOptionsBusiness        = 0,
    OpinionCollectionOptionsComplaint       = 1 << 0,
    OpinionCollectionOptionsProposal        = 1 << 1,
    OpinionCollectionOptionsOther           = 1 << 2,

};

@interface OpinionCollectionViewController : UIViewController
@property (nonatomic ,strong) NSString *titleString;

@property (nonatomic ,assign) OpinionCollectionOptions option;

@end
