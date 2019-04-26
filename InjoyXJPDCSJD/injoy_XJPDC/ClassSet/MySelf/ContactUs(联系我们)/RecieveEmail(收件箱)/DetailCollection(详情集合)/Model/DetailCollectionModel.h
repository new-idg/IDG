//
//  DetailCollectionModel.h
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/23.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailCollectionModel : NSObject

@property (nonatomic ,strong) NSString *timeString;

@property (nonatomic ,strong) NSString *titleString;

@property (nonatomic ,strong) NSString *contnetString;

@property (nonatomic ,assign) double cellH;

+(id)modelWithDict:(NSDictionary *)dict;
@end
