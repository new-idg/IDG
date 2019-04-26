//
//  DetailCollectionTableViewCell.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/23.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "DetailCollectionTableViewCell.h"

@interface DetailCollectionTableViewCell()

@property (nonatomic ,strong) UIView *timeView;

@property (nonatomic ,strong) UILabel *timeLabel;

@property (nonatomic ,strong) UIView *subView;

@property (nonatomic ,strong) UILabel *titleLabel;

@property (nonatomic ,strong) UILabel *contentLabel;

@end

@implementation DetailCollectionTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = RGBA(247, 247, 247, 1);

        
        self.timeView = [[UIView alloc]init];
        [self.contentView addSubview:self.timeView];
        
        self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
        self.timeLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
        [self.timeView addSubview:self.timeLabel];
        
        self.subView = [[UIView alloc]init];
        self.subView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.subView];
        [MyPublicClass layerMasksToBoundsForAnyControls:self.subView cornerRadius:4 borderColor:nil borderWidth:0];
        
        self.titleLabel = [[UILabel alloc]init];
        self.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
        self.titleLabel.textColor = [UIColor colorWithRed:2/255.0 green:2/255.0 blue:2/255.0 alpha:1];
        [self.subView addSubview:self.titleLabel];
        
        self.contentLabel = [[UILabel alloc]init];
        self.contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        self.contentLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        self.contentLabel.numberOfLines = 0;
        [self.subView addSubview:self.contentLabel];
        
        
        
    }
    return self;
}

-(void)setModel:(DetailCollectionModel *)model{
    _model = model;
    
    self.timeView.frame = CGRectMake(0, 0, ScreenWidth, 50);
    
    self.timeLabel.frame = CGRectMake(0, 0, self.timeView.frame.size.width, self.timeView.frame.size.height);
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.text = model.timeString;
    
    model.cellH = [MyPublicClass stringHeightByWidth:ScreenWidth-54 title:model.contnetString font:[UIFont fontWithName:@"PingFang-SC-Medium" size:14]].size.height;
    
    self.subView.frame = CGRectMake(12, CGRectGetMaxY(self.timeView.frame), ScreenWidth-24, 45+model.cellH+15);

    self.titleLabel.frame = CGRectMake(15, 15, self.subView.frame.size.width-30, 15);
    self.titleLabel.text = model.titleString;
    
    self.contentLabel.frame = CGRectMake(15, CGRectGetMaxY(self.titleLabel.frame)+15, self.subView.frame.size.width-30, model.cellH);
    self.contentLabel.text = model.contnetString;
    
    
}
+(double)heightForRowAtCell:(DetailCollectionModel *)model{
    
    
    model.cellH = [MyPublicClass stringHeightByWidth:ScreenWidth-54 title:model.contnetString font:[UIFont fontWithName:@"PingFang-SC-Medium" size:14]].size.height;
    
    double h = 45+model.cellH+15+50;
    
    return h;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
