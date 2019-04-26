//
//  LanguageSwitchModel.h
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/26.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LanguageSwitchModel : NSObject

@property (nonatomic ,strong) NSString *languageString;
@property (nonatomic ,strong) NSString *languageCode;
@property (nonatomic ,assign) BOOL select;

+(id)modelWithDict:(NSDictionary *)dict;
@end
