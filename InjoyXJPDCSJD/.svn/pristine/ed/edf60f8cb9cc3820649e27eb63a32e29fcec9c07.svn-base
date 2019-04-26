//
//  UserPactViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/15.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "UserPactListViewController.h"
#import "UserPactTableViewCell.h"

#import "UserPactViewController.h"

@interface UserPactListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation UserPactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = RGBA(247, 247, 247, 1);
    
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"协议列表";
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(lineView.frame), self.view.frame.size.width, self.view.frame.size.height-navHigh)) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = RGBA(247, 247, 247, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 49;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *mySelfCell = @"UserPactCell";
    
    UserPactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mySelfCell];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"UserPactTableViewCell" owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UserPactViewController *userPact = [[UserPactViewController alloc]init];
    [self.navigationController pushViewController:userPact animated:YES];
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
