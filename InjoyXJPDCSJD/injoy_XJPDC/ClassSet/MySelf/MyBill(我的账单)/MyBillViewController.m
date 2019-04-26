//
//  MyBillViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/9/19.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "MyBillViewController.h"
#import "MyBillTableViewCell.h"

#import "PickerViewController.h"
#import "BillingDetailsViewController.h"


@interface MyBillViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) UILabel *topPriceLabel;
@end

@implementation MyBillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self loadSubView];
}
-(void)loadSubView{
    self.title = @"我的账单";
     self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    [self loadTableView];

}
-(void)loadTableView{
    
    UIView *topView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 85+1))];//线和间距的size
    topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topView];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [topView addSubview:lineView];
    
    UILabel *spendLabel = [[UILabel alloc]initWithFrame:(CGRectMake(21, 12, self.view.frame.size.width-42, 14))];
    spendLabel.text = @"支出";
    spendLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:15];
    spendLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [topView addSubview:spendLabel];
    
    self.topPriceLabel = [[UILabel alloc]initWithFrame:(CGRectMake(21, CGRectGetMaxY(spendLabel.frame)+3, self.view.frame.size.width-42, 17))];
    self.topPriceLabel.textAlignment = NSTextAlignmentCenter;
    NSString *priceString = @"S$1200.00";
    self.topPriceLabel.attributedText = [MyPublicClass attributedString:priceString SetTheFontOfSize:13 SetTheTextRange:(NSMakeRange(0, 2)) UnsetTextRange:(NSMakeRange(2, priceString.length-2)) UnsetFontOfSize:20];
    self.topPriceLabel.textColor = [UIColor colorWithRed:248/255.0 green:48/255.0 blue:48/255.0 alpha:1];
    [topView addSubview:self.topPriceLabel];
    
    
    UIView *timeView = [[UIView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(self.topPriceLabel.frame), topView.frame.size.width, 42))];
    [topView addSubview:timeView];
    
    UILabel *centerLabel = [[UILabel alloc]initWithFrame:(CGRectMake((timeView.frame.size.width-11)/2, 15, 11, 11))];
    centerLabel.text = @"至";
    centerLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    centerLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    [timeView addSubview:centerLabel];
    
    UIImageView *leftImage = [[UIImageView alloc] initWithFrame:(CGRectMake(CGRectGetMinX(centerLabel.frame)-10-12, 15, 12, 12))];
    leftImage.image = [UIImage imageNamed:@"arrows-down"];
    [timeView addSubview:leftImage];
    
    UILabel *leftLable = [[UILabel alloc]initWithFrame:(CGRectMake(CGRectGetMinX(leftImage.frame)-6-72, 15, 72, 10))];
    leftLable.text = @"07-08-2018";
    leftLable.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    leftLable.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [timeView addSubview:leftLable];
    
    
    UILabel *rightLable = [[UILabel alloc]initWithFrame:(CGRectMake(CGRectGetMaxX(centerLabel.frame)+12, 15, 72, 10))];
    rightLable.text = @"08-08-2018";
    rightLable.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12];
    rightLable.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
    [timeView addSubview:rightLable];
    
    UIImageView *rightImage = [[UIImageView alloc] initWithFrame:(CGRectMake(CGRectGetMaxX(rightLable.frame)+8, 15, 12, 12))];
    rightImage.image = [UIImage imageNamed:@"arrows-down"];
    [timeView addSubview:rightImage];
    
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:(CGRectMake(leftLable.frame.origin.x, 0, leftLable.frame.size.width, timeView.frame.size.height))];
    [leftButton addTarget:self action:@selector(selectTime:) forControlEvents:(UIControlEventTouchUpInside)];
    [timeView addSubview:leftButton];
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:(CGRectMake(rightLable.frame.origin.x, 0, rightLable.frame.size.width, timeView.frame.size.height))];
    [rightButton addTarget:self action:@selector(selectTime:) forControlEvents:(UIControlEventTouchUpInside)];
    [timeView addSubview:rightButton];
    
    UIView *spacView = [[UIView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(topView.frame), self.view.frame.size.width, 10))];
    spacView.backgroundColor = RGBA(247, 247, 247, 1);
    [self.view addSubview:spacView];
    
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(spacView.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(spacView.frame))) style:(UITableViewStylePlain)];
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
    
    return 70;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *myBillCell = @"myBillCell";
    
    MyBillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myBillCell];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyBillTableViewCell" owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BillingDetailsViewController *billDetail = [[BillingDetailsViewController alloc]init];
    [self.navigationController pushViewController:billDetail animated:YES];
}


#pragma mark - 时间选择器
-(void)selectTime:(UIButton *)sender{
 
//    TimeSelectViewController *timeSelectView = [[TimeSelectViewController alloc]init];
    PickerViewController *timeSelectView = [[PickerViewController alloc]init];
    timeSelectView.modalPresentationStyle = UIModalPresentationCustom;
    timeSelectView.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];

    [self presentViewController:timeSelectView animated:YES completion:^{}];
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
