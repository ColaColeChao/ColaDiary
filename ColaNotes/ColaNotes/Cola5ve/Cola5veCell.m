//
//  Cola5veCell.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "Cola5veCell.h"
#import "Cola5veModel.h"

@interface Cola5veCell ()
/** 标题icon */
@property (nonatomic, strong) UIImageView *iconImageView;
/** 标题内容 */
@property (nonatomic, strong) UILabel *titleLab;
/** 右侧引导箭头 */
@property (nonatomic, strong) UIImageView *arrowImageView;
@end

@implementation Cola5veCell
- (void)initTableViewSubviews
{
    [self showBottomSeparator];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLab];
    [self.contentView addSubview:self.arrowImageView];
    self.iconImageView.frame = CGRectMake(15, 15, 20, 20);
    self.arrowImageView.frame = CGRectMake(Cola_Width-15-20, 15, 20, 20);
    self.titleLab.frame = CGRectMake(self.iconImageView.right+10, 0, self.arrowImageView.x-self.iconImageView.right-10, 50);
}
- (void)loadCellData:(id)data
{
    if ([data isKindOfClass:[Cola5veModel class]]) {
        Cola5veModel *model = (Cola5veModel*)data;
        self.iconImageView.image = ColaImageName(model.icon);
        self.titleLab.text = model.title;
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
