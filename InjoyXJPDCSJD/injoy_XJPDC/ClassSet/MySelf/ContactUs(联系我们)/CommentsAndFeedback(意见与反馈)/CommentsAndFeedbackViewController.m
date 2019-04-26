//
//  CommentsAndFeedbackViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/18.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CommentsAndFeedbackViewController.h"

#import "ContactUsTableViewCell.h"

#import "OpinionCollectionViewController.h"

@interface CommentsAndFeedbackViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataArray;

@property (nonatomic ,strong) UILabel *name;
@property (nonatomic ,strong) UILabel *address;
@property (nonatomic ,strong) UILabel *tel;
@property (nonatomic ,strong) UILabel *email;
@property (nonatomic ,strong) UILabel *fax;
@property (nonatomic ,strong) UILabel *support;
@property (nonatomic ,strong) UILabel *website;


@end

@implementation CommentsAndFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(247, 247, 247, 1);

    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"意见和反馈";
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    UILabel *message = [[UILabel alloc]initWithFrame:(CGRectMake(12, CGRectGetMaxY(lineView.frame)+15, self.view.frame.size.width-24, 15))];
    message.text = @"我们期待听到您的声音，把最好的体验带给您";
    message.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
    message.textColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
    [self.view addSubview:message];
    
    self.dataArray = @[@"商业与反馈",@"投诉",@"建议",@"其它反馈"];
    
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(message.frame)+15, self.view.frame.size.width, 48*4)) style:(UITableViewStylePlain)];
    self.tableView.bounces = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
//    RGBA(247, 247, 247, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
 
    UIView *bottomView = [[UIView alloc]initWithFrame:(CGRectMake(12,self.view.frame.size.height-kTabbarSafeBottomMargin-25*7-22, self.view.frame.size.width-24, 25*7))];
    
    [self.view addSubview:bottomView];
    
    self.name = [self subLabelFrame:(CGRectMake(0, 0, bottomView.frame.size.width, bottomView.frame.size.height/7)) labelText:@"名称：新加坡餐饮股份有限公司"];
    [bottomView addSubview:self.name];
    
    self.address = [self subLabelFrame:(CGRectMake(0, CGRectGetMaxY(self.name.frame), bottomView.frame.size.width, bottomView.frame.size.height/7)) labelText:@"地址：广州珠江新城华夏路"];
    [bottomView addSubview:self.address];
    
    self.tel = [self subLabelFrame:(CGRectMake(0, CGRectGetMaxY(self.address.frame), bottomView.frame.size.width, bottomView.frame.size.height/7)) labelText:@"电话：020-100451002"];
    [bottomView addSubview:self.tel];
    
    self.email = [self subLabelFrame:(CGRectMake(0, CGRectGetMaxY(self.tel.frame), bottomView.frame.size.width, bottomView.frame.size.height/7)) labelText:@"邮箱：8888888@qq.com"];
    [bottomView addSubview:self.email];
    
    self.fax = [self subLabelFrame:(CGRectMake(0, CGRectGetMaxY(self.email.frame), bottomView.frame.size.width, bottomView.frame.size.height/7)) labelText:@"传真：012123554"];
    [bottomView addSubview:self.fax];
    
    self.support = [self subLabelFrame:(CGRectMake(0, CGRectGetMaxY(self.fax.frame), bottomView.frame.size.width, bottomView.frame.size.height/7)) labelText:@"64小时技术服务支持：+888888888"];
    [bottomView addSubview:self.support];
    
    self.website = [self subLabelFrame:(CGRectMake(0, CGRectGetMaxY(self.support.frame), bottomView.frame.size.width, bottomView.frame.size.height/7)) labelText:@"网站：http//:www.baidu.com"];
    [bottomView addSubview:self.website];
    
    
}
-(UILabel *)subLabelFrame:(CGRect)frame labelText:(NSString *)text{
    
    UILabel *subLabel = [[UILabel alloc]initWithFrame:(frame)];
    subLabel.text = text;
    subLabel.textAlignment = NSTextAlignmentLeft;
    subLabel.textColor = [MyPublicClass colorWithHexString:@"#B3B3B3"];
    subLabel.font = [UIFont fontWithName:@"PingFang SC" size:15];
    
    return subLabel;
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
            OpinionCollectionViewController *opinion = [[OpinionCollectionViewController alloc]init];
            opinion.titleString = @"其他反馈";
            opinion.option = OpinionCollectionOptionsBusiness;
            [self.navigationController pushViewController:opinion animated:YES];
        }
            break;
        case 1:{
            OpinionCollectionViewController *opinion = [[OpinionCollectionViewController alloc]init];
            opinion.titleString = @"投诉";
            opinion.option = OpinionCollectionOptionsComplaint;

            [self.navigationController pushViewController:opinion animated:YES];
        }
            break;
        case 2:{
            OpinionCollectionViewController *opinion = [[OpinionCollectionViewController alloc]init];
            opinion.titleString = @"建议";
            opinion.option = OpinionCollectionOptionsProposal;

            [self.navigationController pushViewController:opinion animated:YES];
        }
            break;
        case 3:{
            OpinionCollectionViewController *opinion = [[OpinionCollectionViewController alloc]init];
            opinion.titleString = @"其他反馈";
            opinion.option = OpinionCollectionOptionsOther;
            [self.navigationController pushViewController:opinion animated:YES];
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
