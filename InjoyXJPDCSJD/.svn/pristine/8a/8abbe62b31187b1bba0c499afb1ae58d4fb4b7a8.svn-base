//
//  SGPCanteenViewController.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/5.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SGPCanteenViewController.h"
#import "CanteenCell.h"
#import <UIView+YYAdd.h>
#import "CXLabel.h"
#import <SDCycleScrollView.h>


@interface SGPCanteenViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
/** 表头 */
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UITableView *tableView;
/** 轮播图 */
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
/** 类型图片 */
@property (nonatomic, strong) UIImageView *typeImage;
/** 食堂 */
@property (nonatomic, strong) UILabel *stall;
/** 地址 */
@property (nonatomic, strong) UILabel *address;
/** 商家类型 */
@property (nonatomic, strong) CXLabel *businessType;
/** 营业时间 */
@property (nonatomic, strong) CXLabel *workTime;
/** 摊位数 */
@property (nonatomic, strong) CXLabel *stallNumber;
/** 联系电话 */
@property (nonatomic, strong) CXLabel *phone;
/** 电邮 */
@property (nonatomic, strong) CXLabel *emile;
/** 收藏 */
@property (nonatomic, strong) UIButton *collection;
/** 定位 */
@property (nonatomic, strong) UIButton *location;
/** 特别说明 */
@property (nonatomic, strong) UILabel *specialExplain;

@end

@implementation SGPCanteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = NO;
    
    self.rootTopView.hidden = YES;
    self.title = @"深圳市好运来管理公司食堂";
    [self setRightNavView];
    
    [self.view addSubview:self.tableView];
    
    [self setup];
}

-(void)setup{
    self.headerView = [[UIView alloc] init];
    self.headerView.frame = CGRectMake(0, 0, Screen_Width, 475);
    self.headerView.backgroundColor = kBackgroundColor;
    [self.view addSubview:self.headerView];
    self.tableView.tableHeaderView = self.headerView;
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, Screen_Width, 465);
    view.backgroundColor = [UIColor whiteColor];
    [self.headerView addSubview:view];
    
    self.cycleScrollView = ({
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"tupian1"]];
        cycleScrollView.localizationImageNamesGroup = @[@"tupian1",@"tupian1",@"tupian1"];
        //        _cycleScrollView.titlesGroup = @[@"图片1",@"图片2",@"图片3"];
        cycleScrollView.autoScrollTimeInterval = 5;
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView.titleLabelBackgroundColor = [UIColor clearColor];
        [cycleScrollView clearCache];
        [self.headerView addSubview:cycleScrollView];
        [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(self.headerView);
            make.height.mas_offset(211);
        }];
        cycleScrollView;
    });
    
    self.typeImage = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"hunhe"];
        [self.headerView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headerView).mas_offset(10);
            make.top.mas_equalTo(self.cycleScrollView.mas_bottom).mas_offset(10);
            make.size.mas_offset(CGSizeMake(17, 17));
        }];
        imageView;
    });
    
    self.collection = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"collection1"] forState:UIControlStateNormal];
        [self.headerView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.headerView).mas_offset(-10);
            make.top.equalTo(self.typeImage);
            make.size.mas_offset(CGSizeMake(20, 20));
        }];
        button;
    });
    
    self.stall = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"haha";
        
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.typeImage.mas_right).mas_offset(10);
            make.right.mas_equalTo(self.collection.mas_left).mas_offset(-10);
            make.top.equalTo(self.typeImage);
            make.height.mas_offset(17);
        }];
        label;
    });
    
    self.location = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"nearby"] forState:UIControlStateNormal];
        [self.headerView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.collection.mas_bottom).mas_offset(13);
            make.right.equalTo(self.headerView).mas_offset(-10);
            make.size.mas_offset(CGSizeMake(11, 16));
        }];
        button;
    });
    
    self.address = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"广州市海珠区广州大道333号";
        label.font = [UIFont systemFontOfSize:14];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.location);
            make.left.equalTo(self.typeImage);
            make.right.mas_equalTo(self.location.mas_left).mas_offset(-10);
            make.height.mas_offset(14);
        }];
        label;
    });
    
    self.businessType = ({
        CXLabel *label = [[CXLabel alloc] init];
        label.title = @"商家类型：";
        label.content = @"空调食阁";
        label.titleColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:15];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.address);
            make.top.mas_equalTo(self.address.mas_bottom).mas_offset(13);
            make.right.equalTo(self.headerView).mas_offset(-10);
            make.height.mas_offset(15);
        }];
        label;
    });
    
    self.workTime = ({
        CXLabel *label = [[CXLabel alloc] init];
        label.title = @"营业时间：";
        label.content = @"8：30~22：30";
        label.titleColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:15];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.address);
            make.top.mas_equalTo(self.businessType.mas_bottom).mas_offset(13);
            make.right.equalTo(self.headerView).mas_offset(-10);
            make.height.mas_offset(15);
        }];
        label;
    });
    
    self.stallNumber = ({
        CXLabel *label = [[CXLabel alloc] init];
        label.title = @"摊  位  数：";
        label.content = @"20";
        label.titleColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:15];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.address);
            make.top.mas_equalTo(self.workTime.mas_bottom).mas_offset(13);
            make.right.equalTo(self.headerView).mas_offset(-10);
            make.height.mas_offset(15);
        }];
        label;
    });
    
    self.phone = ({
        CXLabel *label = [[CXLabel alloc] init];
        label.title = @"联系电话：";
        label.content = @"1353537638";
        label.titleColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:15];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.address);
            make.top.mas_equalTo(self.stallNumber.mas_bottom).mas_offset(13);
            make.right.equalTo(self.headerView).mas_offset(-10);
            make.height.mas_offset(15);
        }];
        label;
    });
    
    self.emile = ({
        CXLabel *label = [[CXLabel alloc] init];
        label.title = @"电        邮：";
        label.content = @"1353537638";
        label.titleColor = [UIColor lightGrayColor];
        label.font = [UIFont systemFontOfSize:15];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.address);
            make.top.mas_equalTo(self.phone.mas_bottom).mas_offset(13);
            make.right.equalTo(self.headerView).mas_offset(-10);
            make.height.mas_offset(15);
        }];
        label;
    });
    
    self.specialExplain = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"暂无特别说明";
        label.font = [UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.address);
            make.top.mas_equalTo(self.emile.mas_bottom).mas_offset(13);
            make.right.equalTo(self.headerView).mas_offset(-10);
            make.height.mas_offset(40);
        }];
        label;
    });
}



-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, navHigh, Screen_Width, Screen_Height-navHigh);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CanteenCell";
    CanteenCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CanteenCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.lineUp.text = @"排队人数：467";
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:cell.lineUp.text];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 5)];
    cell.lineUp.attributedText = string;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, Screen_Width, 40);
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *shaixuan = [[UILabel alloc] init];
    shaixuan.frame = CGRectMake(13, 14, 40, 13);
    shaixuan.text = @"筛选：";
    shaixuan.font = [UIFont systemFontOfSize:13];
    [view addSubview:shaixuan];
    
    UIButton *shaixuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shaixuanBtn.frame = CGRectMake(shaixuan.right, 5, 100, 30);
    
    shaixuanBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    shaixuanBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [shaixuanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shaixuanBtn setImage:[UIImage imageNamed:@"xiala"] forState:UIControlStateNormal];
    [shaixuanBtn setImageEdgeInsets:UIEdgeInsetsMake(0, shaixuanBtn.bounds.size.width, 0, -shaixuanBtn.bounds.size.width)];
    

    [shaixuanBtn setTitle:@"煮炒" forState:UIControlStateNormal];
    [view addSubview:shaixuanBtn];
    
    UIButton *shaixuanBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    shaixuanBtn2.frame = CGRectMake(Screen_Width/3*2, 5, 100, 30);
    
    shaixuanBtn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    shaixuanBtn2.titleLabel.font = [UIFont systemFontOfSize:13];
    [shaixuanBtn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shaixuanBtn2 setImage:[UIImage imageNamed:@"xiala"] forState:UIControlStateNormal];
    [shaixuanBtn2 setTitle:@"hala" forState:UIControlStateNormal];
    [shaixuanBtn2 setImageEdgeInsets:UIEdgeInsetsMake(0, shaixuanBtn2.bounds.size.width, 0, -shaixuanBtn.bounds.size.width)];
    [view addSubview:shaixuanBtn2];
    
    return view;
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
