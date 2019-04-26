//
//  CXPayMethodView.h
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/19.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CXPayMethodViewDelegate <NSObject>
-(void)payMethodViewRow:(NSInteger)row;

@end
@interface CXPayMethodView : UIView<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *selectButton;
}
@property (nonatomic, assign) id<CXPayMethodViewDelegate> delegate;
-(instancetype)init;
-(void)show;
-(void)hidden;
@end
