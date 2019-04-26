//
//  DetailCollectionTableViewCell.h
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/23.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DetailCollectionModel.h"

@interface DetailCollectionTableViewCell : UITableViewCell

@property (nonatomic ,strong) DetailCollectionModel *model;

+(double)heightForRowAtCell:(DetailCollectionModel *)model;


@end
