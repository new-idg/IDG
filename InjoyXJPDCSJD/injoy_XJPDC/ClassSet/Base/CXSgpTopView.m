//
//  CXSgpTopView.m
//  injoy_XJPDC
//
//  Created by HelloIOS on 2018/9/3.
//  Copyright © 2018年 CX. All rights reserved.
//

#import "CXSgpTopView.h"
#import "GlobalDefine.h"
#import <Masonry.h>
@implementation CXSgpTopView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self layout];
    }
    return self;
}

-(void)layout{
    [self addSubview:self.searchBar];
    [self addSubview:self.scanBtn];
    [self.searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(12);
        make.right.equalTo(self).mas_offset(-50);
        make.bottom.equalTo(self).mas_offset(-7);
        make.height.mas_offset(30);
    }];
    
    [self.scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).mas_offset(-12);
        make.centerY.equalTo(self.searchBar);
        make.size.mas_offset(CGSizeMake(23, 23));
    }];
}

-(UIButton *)scanBtn{
    if (!_scanBtn) {
        _scanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _scanBtn.backgroundColor = [UIColor clearColor];
        [_scanBtn setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
    }
    return _scanBtn;
}

-(UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.placeholder = @"搜索食阁、摊位、菜名、地点";
        _searchBar.backgroundColor = [UIColor whiteColor];
        _searchBar.backgroundImage = [[UIImage alloc] init];
        _searchBar.barTintColor = [UIColor whiteColor];
        _searchBar.layer.cornerRadius = 3;
        _searchBar.layer.masksToBounds = YES;
        UITextField *searchField = [_searchBar valueForKey:@"searchField"];
        if (searchField) {
            searchField.backgroundColor = RGBACOLOR(245, 245, 245, 1);
            searchField.layer.cornerRadius = 14;
            
            searchField.layer.masksToBounds = YES;
            searchField.layer.borderColor = RGBACOLOR(245, 245, 245, 1).CGColor;
            searchField.layer.borderColor = [UIColor whiteColor].CGColor;
            searchField.font = [UIFont systemFontOfSize:14];
        }
    }
    return _searchBar;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
