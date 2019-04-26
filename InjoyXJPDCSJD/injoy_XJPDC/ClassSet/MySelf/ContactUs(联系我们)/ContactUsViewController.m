//
//  ContactUsViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/18.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "ContactUsViewController.h"

#import "ContactUsTableViewCell.h"

#import "CommentsAndFeedbackViewController.h"
#import "RecieveEmailViewController.h"
#import "SendEmailViewController.h"


@interface ContactUsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataArray;
@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);

    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"联系我们";
    
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
    
    self.dataArray = @[@"意见与反馈",@"公司简介",@"收件箱",@"发件箱"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 48;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *contactUsCell = @"ContactUsCell";
    
    ContactUsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:contactUsCell];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ContactUsTableViewCell" owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.titleLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            CommentsAndFeedbackViewController *comments = [[CommentsAndFeedbackViewController alloc]init];
            [self.navigationController pushViewController:comments animated:YES];
        }
            break;
        case 1:{
            
        }
            break;
        case 2:{
            RecieveEmailViewController *recieve = [[RecieveEmailViewController alloc]init];
            [self.navigationController pushViewController:recieve animated:YES];
        }
            break;
        case 3:{
            SendEmailViewController *send = [[SendEmailViewController alloc]init];
            [self.navigationController pushViewController:send animated:YES];
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
