//
//  SGPStallViewController.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/5.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SGPStallViewController.h"
#import <SDCycleScrollView.h>
#import "StallCell.h"
#import "CXChooseView.h"
#import "CXLabel.h"
#import "CXChooseFlavorView.h"
#import <UITableView+YYAdd.h>
#import "SJPSettlementViewController.h"
#import "CXShopCarView.h"

@interface SGPStallViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,CXChooseViewDelegate>
/** 表头 */
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UITableView *tableView;
/** 摊位 */
@property (nonatomic, strong) UILabel *stall;
/** 摊位英文名 */
@property (nonatomic, strong) UILabel *stallEnglishName;
/** 换一家 */
@property (nonatomic, strong) UIButton *changeStall;
/** 轮播图 */
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
/** 类型图 */
@property (nonatomic, strong) UIImageView *typeImageView;
/** 清真 */
@property (nonatomic, strong) UILabel *hala;
/** 收藏按钮 */
@property (nonatomic, strong) UIButton *collection;
/** 卫生 */
@property (nonatomic, strong) CXLabel *hygiene;
/** 主营品种 */
@property (nonatomic, strong) CXLabel *mainVariety;
/** 排队人数 */
@property (nonatomic, strong) CXLabel *lineUpNumber;
/** 特别说明 */
@property (nonatomic, strong) UILabel *specialExplain;
/** 选择规格 */
@property (nonatomic, strong) CXChooseFlavorView *chooseFlavorView;
/** 已选数组 */
@property (nonatomic, strong) NSMutableArray<ChooseFlavorModel *> *selectedArray;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray<ChooseFlavorModel *> *dataArray;
/** 购物车 */
@property (nonatomic, strong) CXShopCarView *shopCarView;
/** 下方自定义购物车 */
@property (nonatomic, strong) CXChooseView *chooseView;
@end

@implementation SGPStallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    for (int i = 0; i < 5; i++) {
        ChooseFlavorModel *model = [[ChooseFlavorModel alloc] init];
        model.imageUrl = @"tupian1";
        model.englishName = @"asdfdsf";
        if (i == 0) {
            model.vegetable = @"蛋炒饭";
        }else if (i == 1){
            model.vegetable = @"酸菜鱼";
        }else if (i == 2){
            model.vegetable = @"水煮鱼";
        }else if (i == 3){
            model.vegetable = @"火锅";
        }else if (i == 4){
            model.vegetable = @"季季红";
        }
        
        model.choosed = @"已选：大份/中辣/食堂";
        model.price = [NSNumber numberWithInteger:80];
        model.dataArray = [NSMutableArray arrayWithArray:@[@[@"大份",@"中分",@"小份"],@[@"劲辣",@"中辣",@"微辣",@"不辣"],@[@"堂食",@"打包"]]];
        model.vegetableIntroduce = @"招牌菜：主要原料：草鱼，芥菜";
        model.salesVolume = [NSNumber numberWithInt:20];
        model.calorie = @"低";
        [self.dataArray addObject:model];
    }
    
    [self setnavView];
    [self setHeaderView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.chooseView];

}

-(void)setHeaderView{
    self.headerView = [[UIView alloc] init];
    self.headerView.frame = CGRectMake(0, 0, Screen_Width, 444);
    self.headerView.backgroundColor = kBackgroundColor;
    
    [self.view addSubview:self.headerView];
    self.tableView.tableHeaderView = self.headerView;
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, Screen_Width, 434);
    view.backgroundColor = [UIColor whiteColor];
    [self.headerView addSubview:view];
    
    self.changeStall = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"换一家" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = RGBACOLOR(247, 66, 70, 1);
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        button.layer.cornerRadius = 14;
        button.layer.masksToBounds = YES;
        [self.headerView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-12);
            make.top.mas_offset(16);
            make.size.mas_offset(CGSizeMake(64, 28));
        }];
        
        button;
    });
    
    self.stall = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"#27-028：蜀客酸菜鱼";
        label.font = [UIFont systemFontOfSize:15];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(12);
            make.top.mas_offset(12);
            make.right.mas_equalTo(self.changeStall.mas_left).mas_offset(-12);
            make.height.mas_offset(15);
        }];
        label;
    });
    
    self.stallEnglishName = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"Suke acid fish";
        label.font = [UIFont systemFontOfSize:15];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.stall);
            make.top.mas_equalTo(self.stall.mas_bottom).mas_offset(11);
            make.right.mas_equalTo(self.changeStall.mas_left).mas_offset(-12);
            make.height.mas_offset(15);
        }];
        label;
    });
    
    self.cycleScrollView = ({
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"tupian1"]];
        cycleScrollView.localizationImageNamesGroup = @[@"tupian1",@"tupian1",@"tupian1"];
        //        _cycleScrollView.titlesGroup = @[@"图片1",@"图片2",@"图片3"];
//        cycleScrollView.imageURLStringsGroup//网络图片
        cycleScrollView.autoScrollTimeInterval = 5;
        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        cycleScrollView.titleLabelBackgroundColor = [UIColor clearColor];
        [cycleScrollView clearCache];
        [self.headerView addSubview:cycleScrollView];
        [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.stallEnglishName.mas_bottom).mas_offset(12);
            make.left.right.equalTo(self.headerView);
            make.height.mas_offset(211);
        }];
        cycleScrollView;
    });
    
    self.typeImageView = ({
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"hunhe"];
        [self.headerView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.stall);
            make.top.mas_equalTo(self.cycleScrollView.mas_bottom).mas_offset(16);
            make.size.mas_offset(CGSizeMake(17, 17));
        }];
        imageView;
    });
    
    self.collection = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"collection"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"collected"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(collectionAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.headerView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-12);
            make.top.equalTo(self.typeImageView);
            make.size.mas_offset(CGSizeMake(20, 20));
        }];
        button;
    });
    
    self.hala = ({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"hala";
        label.font = [UIFont systemFontOfSize:11];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.typeImageView.mas_right).mas_offset(9);
            make.top.bottom.equalTo(self.typeImageView);
            make.right.mas_equalTo(self.collection.mas_left).mas_offset(-10);
        }];
        label;
    });
    
    self.hygiene = ({
        CXLabel *label = [[CXLabel alloc] init];
        label.title = @"卫    生：";
        label.content = @"A";
        label.font = [UIFont systemFontOfSize:14];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeImageView);
            make.top.mas_equalTo(self.typeImageView.mas_bottom).mas_offset(15);
            make.right.mas_offset(-12);
            make.height.mas_offset(14);
        }];
        label;
    });
    
    self.mainVariety = ({
        CXLabel *label = [[CXLabel alloc] init];
        label.title = @"主营品种：";
        label.content = @"煮炒类型";
        label.font = [UIFont systemFontOfSize:14];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeImageView);
            make.top.mas_equalTo(self.hygiene.mas_bottom).mas_offset(15);
            make.right.mas_offset(-12);
            make.height.mas_offset(14);
        }];
        label;
    });
    
    self.lineUpNumber = ({
        CXLabel *label = [[CXLabel alloc] init];
        label.title = @"排队人数：";
        label.content = @"12";
        label.font = [UIFont systemFontOfSize:14];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeImageView);
            make.top.mas_equalTo(self.mainVariety.mas_bottom).mas_offset(15);
            make.right.mas_offset(-12);
            make.height.mas_offset(14);
        }];
        label;
    });
    
    self.specialExplain = ({
        CXLabel *label = [[CXLabel alloc] init];
        label.title = @"特别说明：";
        label.content = @"暂无特别说明";
        label.font = [UIFont systemFontOfSize:14];
        [self.headerView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeImageView);
            make.top.mas_equalTo(self.lineUpNumber.mas_bottom).mas_offset(15);
            make.right.mas_offset(-12);
            make.height.mas_offset(14);
        }];
        label;
    });
}

-(void)collectionAction:(UIButton *)sender{
    sender.selected = !sender.selected;
}

-(void)setnavView{
    self.navigationController.navigationBar.hidden = NO;
    
    self.rootTopView.hidden = YES;
    self.title = @"深圳市好运来管理公司食堂";
    [self setRightNavView];
}

#pragma mark - 懒加载
-(NSMutableArray<ChooseFlavorModel *> *)selectedArray{
    if (!_selectedArray) {
        _selectedArray = @[].mutableCopy;
    }
    return _selectedArray;
}

-(NSMutableArray<ChooseFlavorModel *> *)dataArray{
    if (!_dataArray) {
        _dataArray = @[].mutableCopy;
    }
    return _dataArray;
}

-(CXChooseView *)chooseView{
    if (!_chooseView) {
        _chooseView = [[CXChooseView alloc] initWithFrame:CGRectMake(0, Screen_Height-chooseViewHeight, Screen_Width, chooseViewHeight)];
        _chooseView.delegate = self;
    }
    return _chooseView;
}

-(CXChooseFlavorView *)chooseFlavorView{
    if (!_chooseFlavorView) {
        _chooseFlavorView = [[CXChooseFlavorView alloc] init];
        _chooseFlavorView.frame = self.view.bounds;
    }
    return _chooseFlavorView;
}

-(CXShopCarView *)shopCarView{
    if (!_shopCarView) {
        _shopCarView = [[CXShopCarView alloc] init];
        _shopCarView.frame = CGRectMake(0, navHigh, Screen_Width, Screen_Height-navHigh);
        _shopCarView.dataArray = self.selectedArray;
    }
    return _shopCarView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, navHigh, Screen_Width, Screen_Height-navHigh-chooseViewHeight+12);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

#pragma mark - UITableView代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"StallCell";
    StallCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[StallCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    ChooseFlavorModel *model = self.dataArray[indexPath.row];
    [cell setCellModel:model];
    cell.addBtn.tag = indexPath.row+100;
    [cell.addBtn addTarget:self action:@selector(addOrder:) forControlEvents:UIControlEventTouchUpInside];
    cell.minusBtn.tag = indexPath.row + 1000;
    [cell.minusBtn addTarget:self action:@selector(minusOrderAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 133;
}
#pragma mark - ChooseView代理
-(void)chooseViewSelectIndex:(NSInteger)index{
    if (index == 0) {
        if (self.selectedArray.count > 0) {
            [self.shopCarView showInView:self.view];
        }else{
            
        }
        
    }else{
        SJPSettlementViewController *vc = [[SJPSettlementViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - 加号方法
-(void)addOrder:(UIButton *)sender{
    
    ChooseFlavorModel *model = self.dataArray[sender.tag-100];
    [self.chooseFlavorView setChooseFlavorModel:model];
    [self.chooseFlavorView showInView:self.view];
    CXWeakSelf(self);
    self.chooseFlavorView.chooseFlavorBlock = ^(ChooseFlavorModel *model) {
        
        NSLog(@"\n菜名 = %@",model.vegetable);
        if (weakself.selectedArray.count == 0) {
            model.number++;
            [weakself.selectedArray addObject:model];
            StallCell *cell = [weakself.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag-100 inSection:0]];
            cell.numberLabel.text = [NSString stringWithFormat:@"%i",model.number];
        }else{
            [weakself judgeWhetherSelected:model row:sender.tag-100];
        }
    };
}

-(void)judgeWhetherSelected:(ChooseFlavorModel *)chooseFlavorModel row:(NSInteger)row{
    for (ChooseFlavorModel *model in self.selectedArray){
        if ([model.vegetable isEqualToString:chooseFlavorModel.vegetable]) {
            model.number++;
            StallCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
            cell.numberLabel.text = [NSString stringWithFormat:@"%i",model.number];
            return;
        }
    }
    chooseFlavorModel.number++;
    [self.selectedArray addObject:chooseFlavorModel];
    StallCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
    cell.numberLabel.text = [NSString stringWithFormat:@"%i",chooseFlavorModel.number];
}

#pragma mark - 减号方法
-(void)minusOrderAction:(UIButton *)sender{
    ChooseFlavorModel *model = self.dataArray[sender.tag - 1000];
    
    if (model.number == 1){
        [self.selectedArray removeObject:model];
    }
    model.number--;
    StallCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:sender.tag-1000 inSection:0]];
    if (model.number == 0) {
        cell.numberLabel.text = @"";
    }else{
        cell.numberLabel.text = [NSString stringWithFormat:@"%i",model.number];
    }
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
