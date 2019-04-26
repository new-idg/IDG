//
//  SGPNearbyViewController.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SGPNearbyViewController.h"
#import "GlobalDefine.h"
#import "NearbyCell.h"
#import "GoogleMapView.h"
@interface SGPNearbyViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) GoogleMapView *mapView;
@end

@implementation SGPNearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height-navHigh-kTabbarHeight-50-10);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableHeaderView = self.mapView;
    }
    return _tableView;
}

-(GoogleMapView *)mapView{
    if (!_mapView) {
        _mapView = [[GoogleMapView alloc] init];
        _mapView.frame =CGRectMake(0, 0, Screen_Width, mapViewHeight);
        [self.view addSubview:_mapView];
        
    }
    return _mapView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"nearbyCell";
    NearbyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NearbyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
