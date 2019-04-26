//
//  MyBankCardModel.h
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/10.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyBankCardModel : NSObject

@property (nonatomic ,strong) NSString *bankImage;
@property (nonatomic ,strong) NSString *bankName;
@property (nonatomic ,strong) NSString *bankStyle;
@property (nonatomic ,strong) NSString *bankNumber;

+(id)modelWithDict:(NSDictionary *)dict;

@end
