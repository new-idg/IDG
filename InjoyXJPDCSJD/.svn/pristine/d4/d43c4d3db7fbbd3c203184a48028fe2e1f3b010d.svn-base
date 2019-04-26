//
//  PromptBoxViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/17.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "PromptBoxViewController.h"

#define DefaultH 231
#define TopH 67
#define BottomH 48

@interface PromptBoxViewController ()

@property (nonatomic ,strong) UIView *bgView;

/** 标题 */
@property (nonatomic ,strong) UILabel *titleLabel;

/** 内容*/
@property (nonatomic ,strong) UITextView *contentView;

/** 左边按钮 */
@property (nonatomic ,strong) UIButton *leftButton;

/** 右边按钮 */
@property (nonatomic ,strong) UIButton *rightButton;

@end

@implementation PromptBoxViewController

-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
        [MyPublicClass layerMasksToBoundsForAnyControls:_bgView cornerRadius:6 borderColor:nil borderWidth:0];
    }
    return _bgView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:17];
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

-(UITextView *)contentView{
    if (!_contentView) {
        _contentView = [[UITextView alloc]init];
        _contentView.editable = NO;
        _contentView.selectable = NO;
        _contentView.scrollEnabled = NO;
        _contentView.font = [UIFont fontWithName:@"PingFang SC" size:14];
        _contentView.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    }
    return _contentView;
}
-(UIButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [[UIButton alloc]init];
        [_leftButton setTitle:self.leftButtonString forState:(UIControlStateNormal)];
        [_leftButton setTitleColor:self.leftButtonColor forState:(UIControlStateNormal)];
        _leftButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
        [_leftButton addTarget:self action:@selector(letfButton:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _leftButton;
}

-(UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [[UIButton alloc]init];
        [_rightButton setTitle:self.rightButtonString forState:(UIControlStateNormal)];
        [_rightButton setTitleColor:self.rightButtonColor forState:(UIControlStateNormal)];
        _rightButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
        [_rightButton addTarget:self action:@selector(rightButton:) forControlEvents:(UIControlEventTouchUpInside)];

    }
    return _rightButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
//    self.view.backgroundColor = [UIColor blackColor];
    [self loadSubView];
}
-(void)loadSubView{
    
    CGFloat bgW = ScreenWidth-38*2;
    
    CGFloat KBcontentH =  [MyPublicClass stringHeightByWidth:bgW-23*2 title:self.contentString font:[UIFont systemFontOfSize:14]].size.height;
    
    CGFloat fixContnetH = DefaultH-TopH-BottomH;

    CGFloat contentH = 0.0;
   
    CGFloat BGH = 0.0;
    
    self.titleLabel.frame = CGRectMake(0,0, bgW, TopH);
    self.titleLabel.text = self.titleString;
    [self.bgView addSubview:self.titleLabel];
    
    
    if (fixContnetH > KBcontentH+10) {
        contentH = fixContnetH;
        BGH = DefaultH;

    }else{
        contentH = KBcontentH+30;
        BGH = TopH+BottomH+contentH;
    }
    
    self.contentView.frame = CGRectMake(23, CGRectGetMaxY(self.titleLabel.frame),bgW-23*2, contentH);
    self.contentView.text = self.contentString;
    [self.bgView addSubview:self.contentView];
    
    UIView *bottomView = [[UIView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(self.contentView.frame), bgW, BottomH))];
    [self.bgView addSubview:bottomView];
   
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, bottomView.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:@"#E9E9E9"];
    [bottomView addSubview:lineView];
    
    if (self.option == PromptBoxButtonNumberOne) {
        self.leftButton.frame = CGRectMake(0, 1, bottomView.frame.size.width, bottomView.frame.size.height-1);
        [bottomView addSubview:self.leftButton];
    }else{
        UIView *middleLineView = [[UIView alloc]initWithFrame:(CGRectMake((bottomView.frame.size.width-1)/2, 1, 1, bottomView.frame.size.height-1))];
        middleLineView.backgroundColor = [MyPublicClass colorWithHexString:@"#E9E9E9"];
        [bottomView addSubview:middleLineView];
        
        self.rightButton.frame = CGRectMake(0, 1, (bottomView.frame.size.width-1)/2, bottomView.frame.size.height-1);
        [bottomView addSubview:self.rightButton];
        
        self.leftButton.frame = CGRectMake(CGRectGetMaxX(self.rightButton.frame), 1, (bottomView.frame.size.width-1)/2, bottomView.frame.size.height-1);
        [bottomView addSubview:self.leftButton];
        
    }
    
    self.bgView.frame = CGRectMake(38, (ScreenHeight-BGH)/2, bgW, BGH);
    [self.view addSubview:self.bgView];
}


-(void)letfButton:(UIButton *)sender{
    [self dismissView];
    if ([self.delegate respondsToSelector:@selector(selectLeftButton)]) {
        [self.delegate selectLeftButton];
    }
}

-(void)rightButton:(UIButton *)sender{
    [self dismissView];
    if ([self.delegate respondsToSelector:@selector(selectRightButton)]) {
        [self.delegate selectRightButton];
    }
    
}
-(void)dismissView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)parentView:(UIViewController *)view showViewController:(UIViewController *)controller{
    controller.modalPresentationStyle = UIModalPresentationCustom;
    controller.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [view presentViewController:controller animated:YES completion:^{}];
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
