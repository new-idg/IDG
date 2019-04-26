//
//  CXEmptyCategory.m
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import "CXEmptyCategory.h"

@interface CXEmptyCategory ()
@property (nonatomic, strong) UIImageView *emptyImageView;
@property (nonatomic, strong) UILabel *emptyLabel;

@end

@implementation CXEmptyCategory

#pragma mark -- setter && getter
- (UIImageView *)emptyImageView{
    if (_emptyImageView == nil) {
        _emptyImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _emptyImageView;
}
- (UILabel *)emptyLabel{
    if (_emptyLabel == nil) {
        _emptyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _emptyLabel.font = [UIFont systemFontOfSize:14];
        _emptyLabel.textColor = [MyPublicClass colorWithHexString:@"#666666" ];
    }
    return _emptyLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)showWithImage:(UIImage *)image placeholder:(NSString *)placeholder viewController:(UIViewController *)viewController{
    
}


@end
