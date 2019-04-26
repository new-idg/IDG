//
//  NearbyModel.h
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NearbyModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *distance;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, assign) int type;
@end
