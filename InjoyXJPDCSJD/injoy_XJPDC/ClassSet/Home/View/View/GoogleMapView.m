//
//  GoogleMapView.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/4.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "GoogleMapView.h"

@interface GoogleMapView ()
{
    GMSCameraPosition *CameraPosition;
    CLLocationManager *locationManager;
    GMSMapView *mapView;
    NSString *currentCity;
}
@end

@implementation GoogleMapView
-(instancetype)init{
    self = [super init];
    if (self) {
        [CLLocationManager locationServicesEnabled];
        [self startStandardUpdates];
    }
    return self;
}

-(void)startStandardUpdates{
    
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    [locationManager requestAlwaysAuthorization];
    currentCity = [NSString new];
    [locationManager requestWhenInUseAuthorization];
    
    //设置寻址精度
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter = 5.0;
    [locationManager startUpdatingLocation];
    
}

//定位失败后调用此代理方法
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //设置提示提醒用户打开定位服务
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"允许定位提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:nil];
//
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    [alert addAction:okAction];
//    [alert addAction:cancelAction];
//    [self presentViewController:alert animated:YES completion:nil];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [locationManager stopUpdatingHeading];
    //旧址
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    //打印当前的经度与纬度
    NSLog(@"%f,%f",currentLocation.coordinate.latitude,currentLocation.coordinate.longitude);
    if (CameraPosition == nil) {
        
        
        CameraPosition = [GMSCameraPosition cameraWithLatitude:currentLocation.coordinate.latitude longitude:currentLocation.coordinate.longitude zoom:10];
        
        mapView = [GMSMapView mapWithFrame:CGRectMake(0, 0, Screen_Width, mapViewHeight) camera:CameraPosition];
        mapView.settings.compassButton = YES;
        mapView.delegate = self;
        [self addSubview:mapView];
        
        //标记的经纬度
        CLLocationCoordinate2D position = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
        GMSMarker *marker = [GMSMarker markerWithPosition:position];
        //标记的显示文字
        marker.title = @"hello world";
        //标记的显示图片
        //        marker.iconView
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"hunhe"];
        imageView.frame = CGRectMake(0, 0, 20, 20);
        
        marker.iconView = imageView;
        marker.map = mapView;
        marker.appearAnimation = kGMSMarkerAnimationPop;
        
    }
    
    //反地理编码
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            currentCity = placeMark.locality;
            if (!currentCity) {
                currentCity = @"无法定位当前城市";
            }
            
            /*看需求定义一个全局变量来接收赋值*/
            NSLog(@"----%@",placeMark.country);//当前国家
            NSLog(@"%@",currentCity);//当前的城市
            //            NSLog(@"%@",placeMark.subLocality);//当前的位置
            //            NSLog(@"%@",placeMark.thoroughfare);//当前街道
            //            NSLog(@"%@",placeMark.name);//具体地址
            
        }
    }];
    
}

- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate{
    
}
//POI检索才会调用
- (void)mapView:(GMSMapView *)mapView didTapPOIWithPlaceID:(NSString *)placeID
           name:(NSString *)name
       location:(CLLocationCoordinate2D)location{
    
    
}

- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate{
    GMSMarker *marker = [GMSMarker markerWithPosition:coordinate];
    //标记的显示文字
    marker.title = @"hello world";
    //标记的显示图片
    //        marker.iconView
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"hunhe"];
    imageView.frame = CGRectMake(0, 0, 20, 20);
    
    marker.iconView = imageView;
    marker.map = mapView;
    marker.appearAnimation = kGMSMarkerAnimationPop;
}



@end
