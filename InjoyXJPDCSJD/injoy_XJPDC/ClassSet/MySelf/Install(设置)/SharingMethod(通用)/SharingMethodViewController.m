//
//  SharingMethodViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/11/7.
//  Copyright © 2018 CX. All rights reserved.
//

#import "SharingMethodViewController.h"

@interface SharingMethodViewController ()

@property (nonatomic ,strong) UIButton *cacheButton;

@property (nonatomic ,strong) UIButton *qualityButton;

@property (nonatomic ,strong) UIButton *autoUpdateButton;

@property (nonatomic ,strong) UISwitch *noticePushSwitch;

@property (nonatomic ,strong) UISwitch *soundSwitch;

@end

@implementation SharingMethodViewController

-(UIButton *)cacheButton{
    if (!_cacheButton) {
        _cacheButton = [[UIButton alloc]init];
        [_cacheButton setTitleColor:[MyPublicClass colorWithHexString:@"#757575"] forState:(UIControlStateNormal)];
        _cacheButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        _cacheButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _cacheButton;
}

-(UIButton *)qualityButton{
    if (!_qualityButton) {
        _qualityButton = [[UIButton alloc]init];
        [_qualityButton setTitleColor:[MyPublicClass colorWithHexString:@"#757575"] forState:(UIControlStateNormal)];
        _qualityButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        _qualityButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _qualityButton;
}

-(UIButton *)autoUpdateButton{
    if (!_autoUpdateButton) {
        _autoUpdateButton = [[UIButton alloc]init];
        [_autoUpdateButton setTitleColor:[MyPublicClass colorWithHexString:@"#757575"] forState:(UIControlStateNormal)];
        _autoUpdateButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        _autoUpdateButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _autoUpdateButton;
}

-(UISwitch *)noticePushSwitch{
    if (!_noticePushSwitch) {
        _noticePushSwitch = [[UISwitch alloc]init];
    }
    return _noticePushSwitch;
}
-(UISwitch *)soundSwitch{
    if (!_soundSwitch) {
        _soundSwitch = [[UISwitch alloc]init];
    }
    return _soundSwitch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    
    self.title = [MyPublicClass localizedLanguage:@"通用" userDefaultsForKey:APPLANGUAGE];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    [self.cacheButton setTitle:@"22.88MB" forState:(UIControlStateNormal)];
    UIView *cacheView = [self loadCellFrame:(CGRectMake(0, CGRectGetMaxY(lineView.frame), self.view.frame.size.width, 48)) leftText:@"清除图片缓存" subControl:self.cacheButton buttonOrSwitchOption:YES];
    [self.view addSubview:cacheView];
    
    [self.qualityButton setTitle:@"普通" forState:(UIControlStateNormal)];
    UIView *qualityView = [self loadCellFrame:(CGRectMake(0, CGRectGetMaxY(cacheView.frame), self.view.frame.size.width, 48)) leftText:@"非WIFI下图片质量" subControl:self.qualityButton buttonOrSwitchOption:YES];
    [self.view addSubview:qualityView];
    
    [self.autoUpdateButton setTitle:@"仅WIFI下" forState:(UIControlStateNormal)];
    UIView *autoUpdateView = [self loadCellFrame:(CGRectMake(0, CGRectGetMaxY(qualityView.frame), self.view.frame.size.width, 48)) leftText:@"自动下载更新安装包" subControl:self.autoUpdateButton buttonOrSwitchOption:YES];
    [self.view addSubview:autoUpdateView];
    
    UIView *noticePushView = [self loadCellFrame:(CGRectMake(0, CGRectGetMaxY(autoUpdateView.frame), self.view.frame.size.width, 48)) leftText:@"通知推送" subControl:self.noticePushSwitch buttonOrSwitchOption:NO];
    [self.view addSubview:noticePushView];
    
    UIView *soundView = [self loadCellFrame:(CGRectMake(0, CGRectGetMaxY(noticePushView.frame), self.view.frame.size.width, 48)) leftText:@"声音提示" subControl:self.soundSwitch buttonOrSwitchOption:NO];
    [self.view addSubview:soundView];
    
}

-(UIView *)loadCellFrame:(CGRect)frame leftText:(NSString *)leftText subControl:(UIControl *)control buttonOrSwitchOption:(BOOL)option{
    
    UIView *subView = [[UIView alloc]initWithFrame:frame];
    subView.backgroundColor = [UIColor whiteColor];
    
    UILabel *leftLabel = [[UILabel alloc]init];
    leftLabel.text = [MyPublicClass localizedLanguage:leftText userDefaultsForKey:APPLANGUAGE];
    leftLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16];
    leftLabel.textColor = [MyPublicClass colorWithHexString:@"#333333"];
    [subView addSubview:leftLabel];
    
    if (option == YES) {
        
        leftLabel.frame = CGRectMake(13, 0, (subView.frame.size.width-26)*0.8, subView.frame.size.height-1);
        control.frame = CGRectMake(CGRectGetMaxX(leftLabel.frame), 0, (subView.frame.size.width-26)*0.2, subView.frame.size.height-1);
    }else{
        
         leftLabel.frame = CGRectMake(13, 0, (subView.frame.size.width-26)-70, subView.frame.size.height-1);
        control.frame = CGRectMake(CGRectGetMaxX(leftLabel.frame)+18,(subView.frame.size.height-31)/2, 51,31);
    }
    
    [subView addSubview:control];
    
    UIView *lienView = [[UIView alloc]initWithFrame:(CGRectMake(12,CGRectGetMaxY(leftLabel.frame) ,subView.frame.size.width-12, 1))];
    lienView.backgroundColor = [MyPublicClass colorWithHexString:@"#EEEEEE"];
    [subView addSubview:lienView];
    
    return subView;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
