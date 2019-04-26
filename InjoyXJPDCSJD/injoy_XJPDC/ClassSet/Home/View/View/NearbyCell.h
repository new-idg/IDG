//
//  NearbyCell.h
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NearbyModel.h"

@interface NearbyCell : UITableViewCell
/** 类型图片 */
@property (nonatomic, strong) UIImageView *typeImage;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;
/** 地址 */
@property (nonatomic, strong) UILabel *addressLabel;
/** 距离 */
@property (nonatomic, strong) UILabel *distanceLabel;
/** 编号 */
@property (nonatomic, strong) UILabel *codeLabel;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)setWithModel:(NearbyModel *)model;

@end
