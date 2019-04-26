//
//  ShopCartViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/8/28.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "ShopCartViewController.h"
#import <Masonry.h>
//#import "MyPublicClass.h"
#import "GlobalDefine.h"
#import "SCShoppingCarCell.h"
#import "SCShoppingCarFooterView.h"
#import "SCShoppingCarHeaderView.h"
#import "SCShoppingCarBottomView.h"
#import "SCShoppingCarStore.h"
#import "SCShoppingCarGoods.h"


@interface ShopCartViewController ()<UITableViewDelegate,UITableViewDataSource,ShoppingCarBottomDelegate,CXShoppingCarHeaderViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end
static NSString *const shoppingCarCellIdentity = @"shoppingCarCellIdentity";
static NSString *const shoppingCarHeaderIdentity = @"shoppingCarHeaderIdentity";
static NSString *const shoppingCarFooterIdentity = @"shoppingCarFooterIdentity";

@implementation ShopCartViewController

#pragma mark -- setter && getter
- (UITableView *)tableView{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 93;
        [_tableView registerClass:[SCShoppingCarCell class] forCellReuseIdentifier:shoppingCarCellIdentity];
        [_tableView registerClass:[SCShoppingCarHeaderView class] forHeaderFooterViewReuseIdentifier:shoppingCarHeaderIdentity];
        [_tableView registerClass:[SCShoppingCarFooterView class] forHeaderFooterViewReuseIdentifier:shoppingCarFooterIdentity];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}
- (NSMutableArray *)dataArray{
    if(_dataArray == nil){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.barTintColor = [MyPublicClass colorWithHexString:@"#F83030"];
    self.navigationItem.title = @"购物车";
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"common_scan_icon"] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = right;
    [self loadData];
    
    SCShoppingCarBottomView *bottomView = [[SCShoppingCarBottomView alloc] init];
    bottomView.delegate = self;
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
        make.bottom.mas_equalTo(-50);
    }];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(navHigh);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-50-50);
    }];
}
#pragma mark --rightBarButtonItemClick
- (void)rightBarButtonItemClick{
    
}
#pragma mark -- loadData
-  (void)loadData{
    for (NSInteger i = 0; i < 4; i ++ ) {
        SCShoppingCarStore *store = [[SCShoppingCarStore alloc] init];
        store.storeName = [NSString stringWithFormat:@"广州好运来公司%d",(int)i];
        store.select = NO;
        store.goodsArray = [NSMutableArray array];
        for (NSInteger j = 0; j < 2; j ++ ) {
            SCShoppingCarGoods *goods  = [[SCShoppingCarGoods alloc] init];
            goods.goodsName = [NSString stringWithFormat:@"孜然牛肉%ld",j];
            goods.select = NO;
            goods.price = 66.62;
            goods.count = 1;
            [store.goodsArray addObject:goods];
        }
        [self.dataArray addObject:store];
    }
    [self.tableView reloadData];
}
#pragma mark -- UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    SCShoppingCarHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:shoppingCarHeaderIdentity];
    header.backgroundColor = [UIColor whiteColor];
    header.store = self.dataArray[section];
    return header;
}
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    view.tintColor = [UIColor whiteColor];
}
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section{
    view.tintColor = [UIColor whiteColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    SCShoppingCarFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:shoppingCarFooterIdentity];
    footer.backgroundColor = [UIColor whiteColor];
    return footer;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 2;
    SCShoppingCarStore *store = self.dataArray[section];
    return store.goodsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SCShoppingCarCell *cell = [tableView dequeueReusableCellWithIdentifier:shoppingCarCellIdentity forIndexPath:indexPath];
    SCShoppingCarStore *store = self.dataArray[indexPath.section];
    SCShoppingCarGoods *goods = store.goodsArray[indexPath.row];
    cell.goods = goods;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"删除");
    }];
    action.backgroundColor = [UIColor redColor];
    return @[action];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 120;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}

#pragma mark -- SCShoppingCarBottomViewDelegate
- (void)goPayClick{
    
}
- (void)allSelected:(BOOL)selected{
    for (SCShoppingCarStore *store in self.dataArray) {
        store.select = selected;//店铺
        for (SCShoppingCarGoods *goods in store.goodsArray) {
            goods.select = selected;//商品
        }
    }
    [self.tableView reloadData];
}
#pragma mark -- SCShoppingCarHeaderViewDelegate
- (void)shoppingCarHeaderSeleteStore:(SCShoppingCarStore *)store selected:(BOOL)selected{
    for (SCShoppingCarGoods *goods in store.goodsArray) {
        goods.select = selected;
    }
    [self.tableView reloadData];
}
- (void)shoppingCarHeaderDeleteStore:(SCShoppingCarStore *)store{
//    if ([self.dataArray containsObject:store]) {
//        [self.dataArray removeObject:store];
//    }
//    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
