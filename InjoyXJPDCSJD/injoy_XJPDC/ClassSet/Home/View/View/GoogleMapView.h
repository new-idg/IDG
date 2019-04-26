//
//  GoogleMapView.h
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/4.
//  Copyright © 2018年 CX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface GoogleMapView : UIView<CLLocationManagerDelegate,UIGestureRecognizerDelegate,GMSMapViewDelegate>
-(instancetype)init;
@end
