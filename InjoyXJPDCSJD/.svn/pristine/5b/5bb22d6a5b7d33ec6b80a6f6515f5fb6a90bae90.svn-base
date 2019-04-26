//
//  RecieveEmailViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/18.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "RecieveEmailViewController.h"

#import "EmailRecieveORSendTableViewCell.h"

#import "DetailCollectionViewController.h"

@interface RecieveEmailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataArray;

@end

@implementation RecieveEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"收件箱";
    
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
    
    self.dataArray = @[
  @{@"name":@"系统通知",@"image":@"systemNotice"},
  @{@"name":@"取餐通知",@"image":@"mealNotice"},
  @{@"name":@"呼叫面谈",@"image":@"Interview"},
  @{@"name":@"重新排队通知",@"image":@"reQueue"},
  @{@"name":@"排队提醒",@"image":@"queueReminder"}];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *recieveORSendCell = @"recieveORSendCell";
    
    EmailRecieveORSendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:recieveORSendCell];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"EmailRecieveORSendTableViewCell" owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
    cell.leftImage.image = [UIImage imageNamed:[dic objectForKey:@"image"]];
    cell.titleLabel.text = [dic objectForKey:@"name"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            DetailCollectionViewController *detail = [[DetailCollectionViewController alloc]init];
            detail.option = DetailCollectionOptionsSystemNotice;
            detail.titleString = @"系统通知";
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;
        case 1:{
            DetailCollectionViewController *detail = [[DetailCollectionViewController alloc]init];
            detail.option = DetailCollectionOptionsMealNotice;
            detail.titleString = @"取餐通知";
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;
        case 2:{
            DetailCollectionViewController *detail = [[DetailCollectionViewController alloc]init];
            detail.option = DetailCollectionOptionsInterview;
            detail.titleString = @"呼叫面谈";
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;
        case 3:{
            DetailCollectionViewController *detail = [[DetailCollectionViewController alloc]init];
            detail.option = DetailCollectionOptionsReQueue;
            detail.titleString = @"重新排队通知";
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;
        case 4:{
            DetailCollectionViewController *detail = [[DetailCollectionViewController alloc]init];
            detail.option = DetailCollectionOptionsQueueReminder;
            detail.titleString = @"排队提醒";
            [self.navigationController pushViewController:detail animated:YES];
        }
            break;
        default: 
            break;
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
