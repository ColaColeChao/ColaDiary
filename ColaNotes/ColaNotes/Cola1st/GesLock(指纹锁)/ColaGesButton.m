//
//  ColdGesButton.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/12/8.
//  Copyright © 2018 可乐超. All rights reserved.
//

#import "ColaGesButton.h"

@interface ColaGesButton ()
/** 未选中的状态 */
@property (nonatomic, strong) UIView *unSelectView;
/** 选中的状态 */
@property (nonatomic, strong) UIView *selectView;
@end

@implementation ColaGesButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.unSelectView];
        [self addSubview:self.selectView];
    }
    return self;
}

- (void)setSelectStatus:(BOOL)selectStatus
{
    _selectStatus = selectStatus;
    if (selectStatus) {
        self.selectView.hidden = NO;
        self.unSelectView.hidden = YES;
    } else {
        self.selectView.hidden = YES;
        self.unSelectView.hidden = NO;
    }
}

#pragma mark -
#pragma mark - 懒加载部分
- (UIView*)unSelectView
{
    if (!_unSelectView) {
        _unSelectView = [UIView new];
        _unSelectView.frame = CGRectMake(5, 5, self.width-10, self.height-10);
        _unSelectView.backgroundColor = ColaHex(0xf2f2f2);
        _unSelectView.layer.cornerRadius = (self.height-10)*.5;
    }
    return _unSelectView;
}
- (UIView*)selectView
{
    if (!_selectView) {
        _selectView = [UIView new];
        _selectView.frame = CGRectMake(0, 0, self.width, self.height);
        _selectView.layer.cornerRadius = self.height*.5;
        _selectView.layer.borderWidth = 1;
        _selectView.layer.borderColor = ColaHex(0x222222).CGColor;
        _selectView.backgroundColor = [UIColor clearColor];
        UIView *dotView = [UIView new];
        dotView.backgroundColor = ColaHex(0x222222);
        dotView.frame = CGRectMake(10, 10, (self.width-10)*.5, (self.height - 10)*.5);
        dotView.layer.cornerRadius = (self.height - 10)*.5*.5;
        [_selectView addSubview:dotView];
    }
    return _selectView;
}


@end
