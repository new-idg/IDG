//
//  DetailCollectionViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/23.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "DetailCollectionViewController.h"

#import "DetailCollectionModel.h"
#import "DetailCollectionTableViewCell.h"



@interface DetailCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataArray;


@end

@implementation DetailCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = self.titleString;
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(lineView.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(lineView.frame))) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = RGBA(247, 247, 247, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.dataArray = [[NSMutableArray alloc]init];
    NSArray *titleArr = @[@{@"timeString":@"18/08 12:03",
                            @"titleString":@"投诉处理结果",
                            @"contnetString":@"尊敬的李小 姐，您好，首先对我们服务的不到位表示抱歉，我们将尽快核实调查了解请况，并根据投诉对商家做出合理的处罚，处理结果将会以电话反馈给您，谢谢您的敦促。"},
                          @{@"timeString":@"18/08 12:03",
                            @"titleString":@"商业合作回复",
                            @"contnetString":@"尊敬的李小 姐，您好，感谢您的来访信息，为了能够促成我们愉快的合作，特邀您与2018年9月10号来我公司详谈，感谢并期待您的到访。"},
                          @{@"timeString":@"18/08 12:03",
                            @"titleString":@"反馈建议回复",
                            @"contnetString":@"尊敬的李小 姐，您好，【杨记拉面】提醒您，您在本店订单号为201801021556666145的订单前方排队人数已经少于10人，系统发现您尚未到大档口，若蓝牙和GPS未检测到您的位置，请尽快前往档口扫描店二维码确认到店，否则将重新排队。"}];
    for (NSInteger i = 0; i <titleArr.count ; i++) {
        
        DetailCollectionModel *model = [DetailCollectionModel modelWithDict:[titleArr objectAtIndex:i]];
        
        [self.dataArray addObject:model];
    }
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailCollectionModel *model = [self.dataArray objectAtIndex:indexPath.row];
    
    return [DetailCollectionTableViewCell heightForRowAtCell:model];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    static NSString *detailCollectionCell = @"myBankCardCell";
    
    DetailCollectionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:detailCollectionCell];
    if (cell == nil) {
        
        cell = [[DetailCollectionTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:detailCollectionCell];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    DetailCollectionModel *model = [self.dataArray objectAtIndex:indexPath.row];

    
    cell.model = model;
    
    
    return cell;
   
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
