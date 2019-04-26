//
//  SJPSettlementViewController.m
//  injoy_XJPDC
//  结算
//  Created by HelloIOS on 2018/9/18.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SJPSettlementViewController.h"
#import "SJPSettlementCell.h"
#import "CXPayMethodView.h"
#import "SJPContactsViewController.h"

@interface SJPSettlementViewController ()<UITableViewDelegate,UITableViewDataSource,CXPayMethodViewDelegate>
/** tableView */
@property (nonatomic, strong) UITableView *tableView;
/** 表头 */
@property (nonatomic, strong) UIView *headerView;
/** 联系人 */
@property (nonatomic, strong) UIButton *contactsBtn;
/** 支付方式 */
@property (nonatomic, strong) UIButton *payBtn;
/** 合计 */
@property (nonatomic, strong) UILabel *totalLabel;
/** 确认支付 */
@property (nonatomic, strong) UIButton *surePay;
/** 支付选择 */
@property (nonatomic, strong) CXPayMethodView *payMethod;
@end

@implementation SJPSettlementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setnavView];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.totalLabel];
    [self.view addSubview:self.surePay];
    
    
}

-(void)setnavView{
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = kBackgroundColor;
    self.rootTopView.hidden = YES;
    self.title = @"确认订单";
    [self setRightNavView];
}

-(CXPayMethodView *)payMethod{
    if (!_payMethod) {
        _payMethod = [[CXPayMethodView alloc] init];
        _payMethod.delegate = self;
        _payMethod.frame = self.view.frame;
    }
    return _payMethod;
}

-(void)payMethodViewRow:(NSInteger)row{
    if (row == 0) {
        [self.payBtn setTitle:@"Apple Pay" forState:UIControlStateNormal];
    }else if (row == 1){
        [self.payBtn setTitle:@"支付宝" forState:UIControlStateNormal];
    }else if (row == 2){
        [self.payBtn setTitle:@"微信" forState:UIControlStateNormal];
    }else if (row == 3){
        [self.payBtn setTitle:@"银行卡支付" forState:UIControlStateNormal];
    }
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(12, navHigh+12, Screen_Width-24, Screen_Height-navHigh-24-50);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.backgroundColor = kBackgroundColor;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.frame = CGRectMake(0, 0, Screen_Width, 110);
        _headerView.backgroundColor = [UIColor whiteColor];
        _headerView.layer.cornerRadius = 2;
        _headerView.layer.masksToBounds = YES;
        [_headerView addSubview:self.contactsBtn];
        [self.view addSubview:_headerView];
        
        UIView *line = [[UIView alloc] init];
        line.frame = CGRectMake(15, 55, self.tableView.frame.size.width-30, 1);
        line.backgroundColor = kBackgroundColor;
        [_headerView addSubview:line];
        
        UILabel *zffsLabel = [[UILabel alloc] init];
        zffsLabel.frame = CGRectMake(15, 75, 70, 16);
        zffsLabel.font = kFontOfSize(16);
        zffsLabel.text = @"支付方式";
        zffsLabel.textColor = KLightBlue;
        [_headerView addSubview:zffsLabel];
        
        [_headerView addSubview:self.payBtn];
    }
    
    return _headerView;
}

-(UIButton *)payBtn{
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payBtn.frame = CGRectMake(self.tableView.frame.size.width/2, 55, self.tableView.frame.size.width/2-15, self.headerView.frame.size.height/2);
        _payBtn.titleLabel.font = kFontOfSize(16);
        [_payBtn setTitle:@"Applepay" forState:UIControlStateNormal];
        [_payBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _payBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_payBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -24, 0, 24)];
        [_payBtn addTarget:self action:@selector(selectPayMethod) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *rightImage = [[UIImageView alloc] init];
        rightImage.image = [UIImage imageNamed:@"rightjiantou"];
        rightImage.frame = CGRectMake(_payBtn.frame.size.width-24, 16, 24, 24);
        [_payBtn addSubview:rightImage];
    }
    return _payBtn;
}

-(UIButton *)contactsBtn{
    if (!_contactsBtn) {
        _contactsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _contactsBtn.frame = CGRectMake(15, 0, self.tableView.frame.size.width-30, self.headerView.frame.size.height/2);
        [_contactsBtn setTitle:@"张雄学(先生) 13535356745" forState:UIControlStateNormal];
//        [_contactsBtn setImage:[UIImage imageNamed:@"rightjiantou"] forState:UIControlStateNormal];
        _contactsBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_contactsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_contactsBtn addTarget:self action:@selector(contactsAction) forControlEvents:UIControlEventTouchUpInside];
//        [_contactsBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -24, 0, 24)];

        
        
        UIImageView *rightImage = [[UIImageView alloc] init];
        rightImage.image = [UIImage imageNamed:@"rightjiantou"];
        rightImage.frame = CGRectMake(_contactsBtn.frame.size.width-24, 16, 24, 24);
        [_contactsBtn addSubview:rightImage];
        
    }
    return _contactsBtn;
}

-(UILabel *)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc] init];
        _totalLabel.frame = CGRectMake(0, Screen_Height-50, Screen_Width-100, 50);
        _totalLabel.text = @"合计 S$78";
        _totalLabel.font = kFontOfSize(13);
        _totalLabel.textColor = [UIColor whiteColor];
        _totalLabel.textAlignment = NSTextAlignmentRight;
        _totalLabel.backgroundColor = kColorWithRGB(82, 82, 82);
    }
    return _totalLabel;
}

-(UIButton *)surePay{
    if (!_surePay) {
        _surePay = [UIButton buttonWithType:UIButtonTypeCustom];
        _surePay.frame = CGRectMake(Screen_Width-100, Screen_Height-50, 100, 50);
        [_surePay setTitle:@"确认支付" forState:UIControlStateNormal];
        _surePay.backgroundColor = kColorWithRGB(246, 56, 56);
        _surePay.titleLabel.font = kFontOfSize(16);
    }
    return _surePay;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"settlementCell";
    SJPSettlementCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[SJPSettlementCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = kBackgroundColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    return [[UIView alloc] init];
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 342;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 10;
//}

-(void)contactsAction{
    SJPContactsViewController *vc = [[SJPContactsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)selectPayMethod{
    [self.payMethod show];
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
