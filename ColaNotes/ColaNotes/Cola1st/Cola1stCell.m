//
//  Cola1stCell.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/10.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "Cola1stCell.h"

@interface Cola1stCell ()

/** 标题 */
@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation Cola1stCell

- (void)loadCellTitle:(NSString *)title
{
    self.titleLab.text = ColaString(@"%@",title);
}

- (UILabel*)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel labelWithTxtColor:[UIColor blackColor] txtFont:[UIFont systemFontOfSize:14.f] alignment:NSTextAlignmentCenter];
        _titleLab.frame = CGRectMake(0, 0, 80, 80);
        [self.contentView addSubview:_titleLab];
    }
    return _titleLab;
}

@end
