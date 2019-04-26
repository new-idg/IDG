//
//  SGPCollectionViewController.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "SGPCollectionViewController.h"
#import "CollectionCell.h"
#import <UITableView+YYAdd.h>
#import "SGPCanteenViewController.h"
#import "SGPStallViewController.h"

@interface SGPCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    BOOL isOpen1;
    BOOL isOpen2;
    BOOL isOpen3;
}
/**  */
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation SGPCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isOpen1 = YES;
    isOpen2 = YES;
    isOpen3 = YES;
    self.view.backgroundColor = kBackgroundColor;
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height-navHigh-kTabbarHeight-50-10) style:(UITableViewStyleGrouped)];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        if (isOpen1) {
            return 5;
        }else{
            return 0;
        }
    }
    else if (section == 1){
        if (isOpen2) {
            return 5;
        }else{
            return 0;
        }
    }else{
        if (isOpen3) {
            return 5;
        }else{
            return 0;
        }
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"CollectionCell";
    CollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CollectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 0;
    }
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, Screen_Width, 40);
    UILabel *label = [[UILabel alloc] init];
    if (section == 0) {
        label.text = @"食阁";
    }else if (section == 1){
        label.text = @"摊位";
    }else{
        label.text = @"菜名";
    }
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 0, Screen_Width, 40);
    [view addSubview:label];
    
    UIButton *right = [UIButton buttonWithType:UIButtonTypeCustom];
    right.frame = CGRectMake(Screen_Width-60, 10, 60, 20);
    right.tag = section+100;
    [right setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [right setTitle:@"下拉" forState:UIControlStateNormal];
    [right addTarget:self action:@selector(closeSection:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:right];
    
    UIView *line1 = [[UIView alloc] init];
    line1.frame = CGRectMake(0, 38, Screen_Width, 1);
    line1.backgroundColor = [UIColor lightGrayColor];
    [label addSubview:line1];
    
    return view;
}

-(void)closeSection:(UIButton *)sender{
    
    if (sender.tag == 100) {
        
        isOpen1 = !isOpen1;
        [self.tableView reloadSection:0 withRowAnimation:UITableViewRowAnimationFade];
        
    }else if (sender.tag == 101){
        isOpen2 = !isOpen2;
        [self.tableView reloadSection:1 withRowAnimation:UITableViewRowAnimationFade];
    }else if (sender.tag == 102){
        isOpen3 = !isOpen3;
        [self.tableView reloadSection:2 withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SGPCanteenViewController *vc = [[SGPCanteenViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 1){
        SGPStallViewController *vc = [[SGPStallViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
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
