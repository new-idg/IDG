//
//  CXChooseFlavorView.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/6.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CXChooseFlavorView.h"
#import "CXChooseFlavorCell.h"
#import "ChooseFlavorModel.h"


@interface CXChooseFlavorView ()<UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate>
{
    UIView *bgView;
    UIView *bottomView;
    NSIndexPath *indexPath1;
    NSIndexPath *indexPath2;
    NSIndexPath *indexPath3;
}
/** 菜图片 */
@property (nonatomic, strong) UIImageView *headerImage;
/** 英文名 */
@property (nonatomic, strong) UILabel *englishName;
/** 菜名 */
@property (nonatomic, strong) UILabel *vegetable;
/** 已选 */
@property (nonatomic, strong) UILabel *choosed;
/** 价格 */
@property (nonatomic, strong) UILabel *price;
/** 关闭按钮 */
@property (nonatomic, strong) UIButton *closeBtn;
/** collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 备注 */
@property (nonatomic, strong) UITextField *remarks;
/** 下方确定按钮 */
@property (nonatomic, strong) UIButton *sureBtn;
/** 数据源 */
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CXChooseFlavorView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        indexPath1 = [NSIndexPath indexPathForRow:0 inSection:0];
        indexPath2 = [NSIndexPath indexPathForRow:0 inSection:1];
        indexPath3 = [NSIndexPath indexPathForRow:0 inSection:2];
        [self setup];
        //增加监听，当键盘出现或改变时收出消息
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        //增加监听，当键退出时收出消息
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        
        
    }
    return self;
}

-(void)setup{
    //背景图
    bgView = [[UIView alloc] init];
    bgView.frame = CGRectMake(0, 0, Screen_Width, Screen_Height);
    bgView.backgroundColor = RGBACOLOR(102, 102, 102, 0.5);
    [self addSubview:bgView];
    
    
    //菜介绍背景
    UIView *vegetableView = [[UIView alloc] init];
    vegetableView.frame = CGRectMake(0, vegetableViewY, Screen_Width, vegetableViewHeight);
    vegetableView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:vegetableView];
    //菜图片
    self.headerImage = [[UIImageView alloc] init];
    self.headerImage.frame = CGRectMake(lineSpace, lineSpace, imageSpace, imageSpace);
    self.headerImage.image = [UIImage imageNamed:@"suancaiyu"];
    [vegetableView addSubview:self.headerImage];
    
    //菜英文名
    self.englishName = [[UILabel alloc] init];
    self.englishName.frame = CGRectMake(CGRectGetMaxX(self.headerImage.frame)+10, CGRectGetMinY(self.headerImage.frame), Screen_Width-CGRectGetMaxX(self.headerImage.frame)-10-lineSpace-closeSpace, 12);
    self.englishName.text = @"02:Acid fish";
    self.englishName.font = [UIFont systemFontOfSize:12];
    [vegetableView addSubview:self.englishName];
    
    //菜名
    self.vegetable = [[UILabel alloc] init];
    self.vegetable.frame = CGRectMake(CGRectGetMinX(self.englishName.frame), CGRectGetMaxY(self.englishName.frame)+11, CGRectGetWidth(self.englishName.frame), 15);
    self.vegetable.font = [UIFont systemFontOfSize:15];
    self.vegetable.text = @"酸菜鱼";
    [vegetableView addSubview:self.vegetable];
    
    //已选
    self.choosed = [[UILabel alloc] init];
    self.choosed.frame = CGRectMake(CGRectGetMinX(self.vegetable.frame), CGRectGetMaxY(self.vegetable.frame)+11, CGRectGetWidth(self.englishName.frame), 12);
    self.choosed.text = @"已选：大份/中辣/食堂";
    self.choosed.font = [UIFont systemFontOfSize:12];
    [vegetableView addSubview:self.choosed];
    
    //价格
    self.price = [[UILabel alloc] init];
    self.price.frame = CGRectMake(CGRectGetMinX(self.choosed.frame), CGRectGetMaxY(self.choosed.frame)+19, CGRectGetWidth(self.englishName.frame), 13);
    self.price.text = @"S$25";
    self.price.font = [UIFont systemFontOfSize:13];
    self.price.textColor = [UIColor redColor];
    [vegetableView addSubview:self.price];
    
    //关闭按钮
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn.frame = CGRectMake(Screen_Width-lineSpace-closeSpace, CGRectGetMinY(self.headerImage.frame), closeSpace, closeSpace);
    [self.closeBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
    [self.closeBtn addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
    [vegetableView addSubview:self.closeBtn];
    
    //中间的collectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, vegetableViewY+vegetableViewHeight, Screen_Width, allViewHeight-vegetableViewHeight-60) collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    
    [collectionView registerClass:CXChooseFlavorCell.class forCellWithReuseIdentifier:@"CXChooseFlavorCell"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyCollectionViewHeaderView"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MyCollectionViewFooterView"];
    self.collectionView = collectionView;
    [bgView addSubview:collectionView];
    
    
    bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, Screen_Height-60, Screen_Width, 60);
    bottomView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:bottomView];
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, 0, Screen_Width, 1);
    line.backgroundColor = [UIColor lightGrayColor];
    [bottomView addSubview:line];
    
    //下方确定按钮
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureBtn.frame = CGRectMake(lineSpace, 10, Screen_Width-2*lineSpace, 40);
    self.sureBtn.layer.cornerRadius = 3;
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.backgroundColor = RGBACOLOR(245, 55, 55, 1);
    [self.sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:self.sureBtn];
    
}

#pragma mark - UICollectionView代理方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataArray.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.dataArray[section] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"CXChooseFlavorCell";
    CXChooseFlavorCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.textLabel.backgroundColor = RGBACOLOR(245, 245, 245, 1);
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    if (indexPath1 == indexPath || indexPath2 == indexPath || indexPath3 == indexPath) {
        cell.textLabel.layer.borderWidth = 1;
        cell.textLabel.layer.borderColor = [UIColor redColor].CGColor;
        cell.textLabel.textColor = [UIColor redColor];
    }else{
        cell.textLabel.layer.borderWidth = 0;
        cell.textLabel.layer.borderColor = [UIColor redColor].CGColor;
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

/**
 创建区头视图和区尾视图
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyCollectionViewHeaderView" forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, Screen_Width-10, headerView.bounds.size.height)];
        if (indexPath.section == 0) {
            titleLabel.text = @"规格";
        }else if (indexPath.section == 1){
            titleLabel.text = @"辣度";
        }else if (indexPath.section == 2){
            titleLabel.text = @"是否打包";
        }
        [headerView addSubview:titleLabel];
        return headerView;
    }else if(kind == UICollectionElementKindSectionFooter){
        
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MyCollectionViewFooterView" forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor whiteColor];
        
        UILabel *beizhu = [[UILabel alloc] init];
        beizhu.frame =CGRectMake(lineSpace, 23, cellHeaderViewHeight, 14);
        beizhu.text = @"备注";
        beizhu.font = [UIFont systemFontOfSize:14];
        beizhu.textColor = [UIColor grayColor];
        [footerView addSubview:beizhu];
        
        self.remarks = [[UITextField alloc] init];
        self.remarks.frame = CGRectMake(CGRectGetMaxX(beizhu.frame), 10, Screen_Width-lineSpace-CGRectGetMaxX(beizhu.frame), cellHeaderViewHeight);
        self.remarks.placeholder = @"请输入备注";
        self.remarks.font = [UIFont systemFontOfSize:14];
        self.remarks.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
        self.remarks.returnKeyType = UIReturnKeyDone;
        self.remarks.leftViewMode = UITextFieldViewModeAlways;
        self.remarks.backgroundColor = RGBACOLOR(232, 232, 232, 1);
        self.remarks.layer.cornerRadius = 3;
        self.remarks.layer.masksToBounds = YES;
        self.remarks.delegate = self;
        [footerView addSubview:self.remarks];
        
        return footerView;
    }
    return nil;
}

/**
 cell的大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(itemWidth, itemHeight);
}

/**
 每个分区的内边距（上左下右）
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, lineSpace, itemSpace, lineSpace);
}

/**
 分区内cell之间的最小行间距
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return itemSpace;
}

/**
 区头大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(Screen_Width, cellHeaderViewHeight);
}
/**
 区尾大小
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return CGSizeMake(Screen_Width, cellFooterViewHeight);
    }else{
        return CGSizeMake(0, 0);
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CXChooseFlavorCell *cell = nil;
    if (indexPath.section == 0) {
        cell = (CXChooseFlavorCell *)[collectionView cellForItemAtIndexPath:indexPath1];
        indexPath1 = indexPath;
        self.model.specifications = self.dataArray[indexPath.section][indexPath.row];
        
    }else if (indexPath.section == 1){
        cell = (CXChooseFlavorCell *)[collectionView cellForItemAtIndexPath:indexPath2];
        indexPath2 = indexPath;
        self.model.hot = self.dataArray[indexPath.section][indexPath.row];
    }else if (indexPath.section == 2){
        cell = (CXChooseFlavorCell *)[collectionView cellForItemAtIndexPath:indexPath3];
        indexPath3 = indexPath;
        if (indexPath.row == 0) {
            self.model.isPack = NO;
        }else{
            self.model.isPack = YES;
        }
    }
    cell.textLabel.layer.borderWidth = 0;
    cell.textLabel.layer.borderColor = [UIColor redColor].CGColor;
    cell.textLabel.textColor = [UIColor blackColor];
//    [collectionView reloadData];
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    
}
#pragma mark - 键盘方法
-(void)keyboardWillShow:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [value CGRectValue];
    int height = keyboardRect.size.height;
    [UIView animateWithDuration:1.0 animations:^{
        self->bgView.frame = CGRectMake(0, -height+kTabbarSafeBottomMargin+self->bottomView.frame.size.height, self->bgView.frame.size.width, self->bgView.frame.size.height);
    }];
}

-(void)keyboardWillHide:(NSNotification *)notification{
    [UIView animateWithDuration:1.0 animations:^{
        self->bgView.frame = CGRectMake(0, 0, self->bgView.frame.size.width, self->bgView.frame.size.height);
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    _model.remarks = textField.text;
    return [textField resignFirstResponder];
}

-(void)setChooseFlavorModel:(ChooseFlavorModel *)model{
    self.model = model;
    self.headerImage.image = [UIImage imageNamed:model.imageUrl];
    self.englishName.text = model.englishName;
    self.vegetable.text = model.vegetable;
    self.choosed.text = model.choosed;
    self.price.text = [NSString stringWithFormat:@"S$%@",model.price];
    self.dataArray = model.dataArray;
    self.model.specifications = self.dataArray[0][0];
    self.model.hot = self.dataArray[1][0];
    self.model.isPack = NO;
}

#pragma mark - model


#pragma mark - 确认方法
-(void)sureAction{
    
    self.chooseFlavorBlock(self.model);
    [self hidden];
}

#pragma mark - 显示隐藏方法
-(void)showInView:(UIView *)view{
    [view addSubview:self];
}
-(void)hidden{
    [self removeFromSuperview];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
