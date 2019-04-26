//
//  InstallViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/24.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "InstallViewController.h"

#import "InstallTableViewCell.h"

#import "LanguageSwitchViewController.h"
#import "AccountAndSecurityViewController.h"
#import "SharingMethodViewController.h"

#import "AboutUsViewController.h"
#import "HelpInformationViewController.h"

#import "LoginViewController.h"

@interface InstallViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *dataArray;
@end

@implementation InstallViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadSubView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageChange:) name:AppLanguageDidChangeNotification object:nil];
}

- (void)languageChange:(id)sender {
    if (self.isViewLoaded && !self.view.window) {
        //这里置为nil，当视图再次显示的时候会重新走viewDidLoad方法
        self.view = nil;
    }
}


-(void)loadSubView{
    
    self.title = [MyPublicClass localizedLanguage:@"设置" userDefaultsForKey:APPLANGUAGE];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(lineView.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(lineView.frame))) style:(UITableViewStyleGrouped)];
    self.tableView.backgroundColor = RGBA(247, 247, 247, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.dataArray = @[
  @[@{@"name":@"语言切换"},@{@"name":@"账户与安全"},@{@"name":@"通用"}],
  @[@{@"name":@"关于"},@{@"name":@"帮助"}]];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[self.dataArray objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 48;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == 0) {
       return 18;
    }else{
       return 80;
    }
    
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return nil;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    
    if (section == 0) {
        return nil;
    }else{
        return [self loadFooterView];
    }
}

-(UIView *)loadFooterView{
    
    UIView *footView = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, 80))];
    
    UIButton *selectBank = [[UIButton alloc]initWithFrame:(CGRectMake(0, 32, footView.frame.size.width, footView.frame.size.height-32))];
    selectBank.backgroundColor = [UIColor whiteColor];
    [selectBank setTitle:[MyPublicClass localizedLanguage:@"退出登录"  userDefaultsForKey:APPLANGUAGE] forState:(UIControlStateNormal)];
    [selectBank setTitleColor:[MyPublicClass colorWithHexString:@"#F83030"] forState:(UIControlStateNormal)];
    selectBank.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16];
    [selectBank addTarget:self action:@selector(signOut:) forControlEvents:(UIControlEventTouchUpInside)];
    [footView addSubview:selectBank];
    [MyPublicClass layerMasksToBoundsForAnyControls:selectBank cornerRadius:4 borderColor:nil borderWidth:0];
    
    return footView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *installCell = @"installCell";
    
    InstallTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:installCell];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"InstallTableViewCell" owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dic = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
   cell.titleLabel.text = [MyPublicClass localizedLanguage: [dic objectForKey:@"name"]  userDefaultsForKey:APPLANGUAGE];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:{
                LanguageSwitchViewController *language = [[LanguageSwitchViewController alloc]init];
                [self.navigationController pushViewController:language animated:YES];
            }
                break;
            case 1:{
                AccountAndSecurityViewController *account = [[AccountAndSecurityViewController alloc]init];
                [self.navigationController pushViewController:account animated:YES];
            }
                break;
            case 2:{
                SharingMethodViewController *shar = [[SharingMethodViewController alloc]init];
                [self.navigationController pushViewController:shar animated:YES];
            }
                break;
            default:
                break;
        }
    }else{
        switch (indexPath.row) {
            case 0:{
                AboutUsViewController *about = [[AboutUsViewController alloc]init];
                [self.navigationController pushViewController:about animated:YES];
            }
                break;
            case 1:{
                HelpInformationViewController *help = [[HelpInformationViewController alloc]init];
                [self.navigationController pushViewController:help animated:YES];
            }
                break;
            default:
                break;
        }
    }
}

#pragma mark - 退出登录
-(void)signOut:(UIButton *)sender{
    LoginViewController *login = [[LoginViewController alloc]init];
    [self presentViewController:login animated:YES completion:^{
        
    }];
    
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
