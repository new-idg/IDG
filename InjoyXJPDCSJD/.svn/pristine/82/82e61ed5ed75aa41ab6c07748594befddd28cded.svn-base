//
//  LanguageSwitchModel.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/26.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "LanguageSwitchModel.h"

@implementation LanguageSwitchModel

+(id)modelWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"Model : %@ Undefined Key: %@ and Value:%@", self, key,value);
}
@end
