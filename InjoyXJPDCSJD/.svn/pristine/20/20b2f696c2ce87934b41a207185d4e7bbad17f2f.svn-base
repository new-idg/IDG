//
//  YMMineTableHeaderView.h
//  injoy_XJPDC
//
//  Created by yuemiao on 2018/11/17.
//  Copyright © 2018 CX. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YMMineTableHeaderViewDelegate <NSObject>

- (void)tableHeaderViewClick;

@end

@interface YMMineTableHeaderView : UIView

- (instancetype)initWithAvatarImageURL:(NSString *)url name:(NSString *)name phoneNumber:(NSString *)phoneNumber;

@property (nonatomic, weak) id <YMMineTableHeaderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
