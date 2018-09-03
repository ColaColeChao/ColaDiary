//
//  Cola4urCell.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/3.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "Cola4urCell.h"
#import "Cola4urModel.h"

@interface Cola4urCell ()
/** 标题icon */
@property (nonatomic, strong) UIImageView *iconImageView;
/** 标题内容 */
@property (nonatomic, strong) UILabel *titleLab;
/** 副标题内容 */
@property (nonatomic, strong) UILabel *subTitleLab;
/** 右侧引导箭头 */
@property (nonatomic, strong) UIImageView *arrowImageView;
@end

@implementation Cola4urCell
- (void)initTableViewSubviews
{
    [self showBottomSeparator];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.subTitleLab];
    [self.contentView addSubview:self.arrowImageView];
    self.iconImageView.frame = CGRectMake(15, 30, 20, 20);
    self.arrowImageView.frame = CGRectMake(Cola_Width-15-20, 30, 20, 20);
    self.titleLab.frame = CGRectMake(self.iconImageView.right+15, 20, self.arrowImageView.x-self.iconImageView.right-10, 20);
    self.subTitleLab.frame = CGRectMake(self.iconImageView.right+15, self.titleLab.bottom, self.arrowImageView.x-self.iconImageView.right-10, 20);
}
- (void)loadCellData:(id)data
{
    if ([data isKindOfClass:[Cola4urModel class]]) {
        Cola4urModel *model = (Cola4urModel*)data;
        self.iconImageView.image = ColaImageName(model.icon);
        self.titleLab.text = model.title;
        self.subTitleLab.text = model.subTitle;
    }
}
- (UIImageView*)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}
- (UILabel*)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel labelWithTxtColor:ColaHex(0x515151) txtFontSize:16.f];
        _titleLab.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLab;
}
- (UILabel*)subTitleLab
{
    if (!_subTitleLab) {
        _subTitleLab = [UILabel labelWithTxtColor:ColaHex(0x999999) txtFontSize:12.f];
        _subTitleLab.adjustsFontSizeToFitWidth = YES;
    }
    return _subTitleLab;
}
- (UIImageView*)arrowImageView
{
    if (!_arrowImageView) {
        _arrowImageView = [UIImageView new];
        UIImage *image = ColaImageName(@"cola_common_arrow_right");
        _arrowImageView.image = image;
    }
    return _arrowImageView;
}
@end
