//
//  ColaBaseTableViewCell.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/30.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBaseTableViewCell.h"
#import "ColaBaseConfig.h"

@implementation ColaBaseTableViewCell

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                 注册并初始化UITableViewCell                 //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (instancetype)initWithReuseIdentifier:(NSString*)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryNone;
        [self initTableViewSubviews];
    }
    return self;
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////      显示/隐藏UITableViewCell底部的自定义分割线     //////////////////
//////////////////                      可自定义颜色、frame值                    //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)showBottomSeparator
{
    [self removeBottomLine];
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = Cola_CellSeparatorDefaultColor;
    bottomLine.tag = 6699;
    [self.contentView addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.height.mas_offset(Cola_CellSeparatorDefaultHeight);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
}
- (void)showBottomSeparatorWithColor:(UIColor *)color
{
    [self removeBottomLine];
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = color;
    bottomLine.tag = 6699;
    [self.contentView addSubview:bottomLine];
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.height.mas_offset(Cola_CellSeparatorDefaultHeight);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(0);
    }];
}
- (void)showBottomSeparatorWithRect:(CGRect)rect
{
    [self removeBottomLine];
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = Cola_CellSeparatorDefaultColor;
    bottomLine.frame = rect;
    bottomLine.tag = 6699;
    [self.contentView addSubview:bottomLine];
}
- (void)showBottomSeparatorWithRect:(CGRect)rect color:(UIColor *)color
{
    [self removeBottomLine];
    UIView *bottomLine = [UIView new];
    bottomLine.backgroundColor = color;
    bottomLine.frame = rect;
    bottomLine.tag = 6699;
    [self.contentView addSubview:bottomLine];
}
- (void)hiddenBottomSeparator
{
    [self removeBottomLine];
}
- (void)removeBottomLine
{
    UIView *bottomLine = (UIView*)[self.contentView viewWithTag:6699];
    if (bottomLine) {
        [bottomLine removeFromSuperview];
    }
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////              初始化UITableViewCell上的子视图              //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)initTableViewSubviews
{
    NSLog(@"子类未实现初始化子视图的方法");
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                               加载cell数据                           //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)loadCellData:(id)data
{
    NSLog(@"子类未实现加载cell数据的方法");
}

@end
