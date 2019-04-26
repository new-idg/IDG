//
//  LanguageSwitchViewController.m
//  injoy_XJPDC
//
//  Created by 念念不忘必有回响 on 2018/10/24.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "LanguageSwitchViewController.h"

#import "LanguageSwitchTableViewCell.h"
#import "LanguageSwitchModel.h"

@interface LanguageSwitchViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *dataArray;
@property (nonatomic ,strong) LanguageSwitchModel *model;

@property (nonatomic ,strong) UIButton *rightButton;
@property (nonatomic ,strong) NSString *userDef;


@end

@implementation LanguageSwitchViewController

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}

-(UIButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [[UIButton alloc]initWithFrame:(CGRectMake(0, 0, 34, 34))];
        [_rightButton setTitle:@"完成" forState:(UIControlStateNormal)];
        [_rightButton setTitleColor:[MyPublicClass colorWithHexString:@"#111111"] forState:(UIControlStateNormal)];
        _rightButton.titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14];
        [_rightButton addTarget:self action:@selector(languageSwitch:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _rightButton;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadSubView];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (self.userDef.length == 0) {
        NSString *code = [MyPublicClass getCurrentLanguage];
        [self languageSwitchEqualString:code isSelect:YES];
    }else{
        [self languageSwitchEqualString:self.userDef isSelect:YES];
    }
}

-(void)languageSwitchEqualString:(NSString *)string isSelect:(BOOL)isSelect{
    for (LanguageSwitchModel *model in self.dataArray) {
        if ([model.languageCode isEqualToString:string]) {
            model.select = !isSelect;
            self.model = model;
        }else{
            model.select = isSelect;
        }
    }
}

-(void)loadSubView{
    self.title = [MyPublicClass localizedLanguage:@"语言切换" userDefaultsForKey:APPLANGUAGE];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[MyPublicClass colorWithHexString:@"#2B2B2B"],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:18]}];
    
    self.userDef = [[NSUserDefaults standardUserDefaults] objectForKey:APPLANGUAGE];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightButton];
    
    UIView *lineView = [[UIView alloc]initWithFrame:(CGRectMake(0, navHigh, self.view.frame.size.width, 1))];
    lineView.backgroundColor = [MyPublicClass colorWithHexString:LineColor];
    [self.view addSubview:lineView];
    
    self.tableView = [[UITableView alloc]initWithFrame:(CGRectMake(0, CGRectGetMaxY(lineView.frame), self.view.frame.size.width, self.view.frame.size.height-CGRectGetMaxY(lineView.frame))) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = RGBA(247, 247, 247, 1);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    NSArray *lang = @[@{@"languageString":@"中文",@"languageCode":@"zh-Hans"},@{@"languageString":@"English",@"languageCode":@"en"}];
    for (NSDictionary *dic in lang) {
        LanguageSwitchModel *model = [LanguageSwitchModel modelWithDict:dic];
        model.select = YES;
        [self.dataArray addObject:model];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 48;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *languageCell = @"languageCell";
    
    LanguageSwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:languageCell];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LanguageSwitchTableViewCell" owner:nil options:nil] firstObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = [self.dataArray objectAtIndex:indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (int i = 0; i < self.dataArray.count; i++) {
        
        LanguageSwitchModel *model = [self.dataArray objectAtIndex:i];
        
        if (i == indexPath.row) {
            model.select = NO;
        }else{
            model.select = YES;
        }
        
    }
    self.model =  [self.dataArray objectAtIndex:indexPath.row];
    [tableView reloadData];
}

-(void)languageSwitch:(UIButton *)sender{
    
    UIAlertController *aler = [UIAlertController alertControllerWithTitle:@"语言切换" message:@"是否切换语言?" preferredStyle:(UIAlertControllerStyleAlert)];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
        [[NSUserDefaults standardUserDefaults] setObject:self.model.languageCode forKey:APPLANGUAGE];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
         [[NSNotificationCenter defaultCenter] postNotificationName:AppLanguageDidChangeNotification object:nil];
        
        [self.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [aler addAction:action];
    [aler addAction:action1];
    [self presentViewController:aler animated:YES completion:nil];
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
