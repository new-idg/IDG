//
//  HelpInformationViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/25.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "HelpInformationViewController.h"

#import "InstallTableViewCell.h"

#import "UserTermsViewController.h"

@interface HelpInformationViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataArray;

@end

@implementation HelpInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"帮助信息";
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
    
    self.dataArray = @[@{@"name":@"软件使用说明"},@{@"name":@"常见问题"}];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 48;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *installCell = @"installCell";
    
    InstallTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:installCell];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InstallTableViewCell" owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dic = [self.dataArray objectAtIndex:indexPath.row];
    cell.titleLabel.text = [dic objectForKey:@"name"];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            UserTermsViewController *user = [[UserTermsViewController alloc]init];
            user.titelString = @"软件使用说明";
            [self.navigationController pushViewController:user animated:YES];
        }
            break;
        case 1:{
            
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
