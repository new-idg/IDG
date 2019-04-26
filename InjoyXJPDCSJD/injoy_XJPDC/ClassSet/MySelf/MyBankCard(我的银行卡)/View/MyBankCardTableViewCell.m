//
//  MyBankCardTableViewCell.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/10.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "MyBankCardTableViewCell.h"

@interface MyBankCardTableViewCell ()

@property (nonatomic ,strong) UIView *bgView;
@property (nonatomic ,strong) CAGradientLayer *gl;

@property (nonatomic ,strong) UIImageView *bankImage;

@property (nonatomic ,strong) UILabel *bankName;

@property (nonatomic ,strong) UILabel *bankStyle;

@property (nonatomic ,strong) UILabel *bankNumber;

@end;

@implementation MyBankCardTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGBA(247, 247, 247, 1);
        [self loadSubView];
    }
    return self;
}
-(void)loadSubView{
    self.bgView = [[UIView alloc]init];
    [self.contentView addSubview:self.bgView];
    [MyPublicClass layerMasksToBoundsForAnyControls:self.bgView cornerRadius:6 borderColor:nil borderWidth:0];
    
    self.gl = [CAGradientLayer layer];
    [self.bgView.layer addSublayer:self.gl];

    self.bankImage = [[UIImageView alloc]init];
    self.bankImage.backgroundColor = [UIColor blueColor];
    [self.bgView addSubview:self.bankImage];
    
    self.bankName = [[UILabel alloc]init];
    self.bankName.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16];
    self.bankName.backgroundColor = [MyPublicClass colorWithHexString:@"#FFFFFF"];
    self.bankName.textAlignment = NSTextAlignmentLeft;
    [self.bgView addSubview:self.bankName];
    
    self.bankStyle = [[UILabel alloc]init];
    self.bankStyle.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    self.bankStyle.backgroundColor = [MyPublicClass colorWithHexString:@"#FFFFFF"];
    self.bankStyle.textAlignment = NSTextAlignmentLeft;
    [self.bgView addSubview:self.bankStyle];
    
    self.bankNumber = [[UILabel alloc]init];
    self.bankNumber.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:18];
    self.bankNumber.backgroundColor = [MyPublicClass colorWithHexString:@"#FFFFFF"];
    self.bankNumber.textAlignment = NSTextAlignmentLeft;
    [self.bgView addSubview:self.bankNumber];
    
    
}
-(void)layoutIfNeeded{
    [self loadSubViewFram];
}
-(void)loadSubViewFram{
    self.bgView.frame = CGRectMake(12,15,self.frame.size.width-24,self.frame.size.height-15);
    
    self.gl.frame = CGRectMake(0,0,self.bgView.frame.size.width,self.bgView.frame.size.height);
    self.gl.startPoint = CGPointMake(0, 0);
    self.gl.endPoint = CGPointMake(1, 1);
    self.gl.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:103/255.0 blue:121/255.0 alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:253/255.0 green:89/255.0 blue:91/255.0 alpha:1].CGColor];
    self.gl.locations = @[@(0.0),@(1.0f)];
    
    self.bankImage.frame = CGRectMake(20, 19, 30, 30);
    
    self.bankName.frame = CGRectMake(CGRectGetMaxX(self.bankImage.frame)+11, CGRectGetMinY(self.bankImage.frame), self.bgView.frame.size.width-CGRectGetMaxX(self.bankImage.frame)-11-10, 15);
    
    self.bankStyle.frame = CGRectMake(CGRectGetMaxX(self.bankImage.frame)+11, CGRectGetMaxY(self.bankName.frame)+6, self.bgView.frame.size.width-CGRectGetMaxX(self.bankImage.frame)-11-10, 12);
    
    self.bankNumber.frame = CGRectMake(CGRectGetMaxX(self.bankImage.frame)+11, CGRectGetMaxY(self.bankStyle.frame)+17, self.bgView.frame.size.width-CGRectGetMaxX(self.bankImage.frame)-11-10, 14);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
