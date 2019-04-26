//
//  LanguageSwitchTableViewCell.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/24.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "LanguageSwitchTableViewCell.h"

@interface LanguageSwitchTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *selectLange;
@end

@implementation LanguageSwitchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(LanguageSwitchModel *)model{
    _model = model;
    self.titleLabel.text = model.languageString;
    self.selectLange.hidden = model.select;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
