//
//  ColaGesLockView.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/12/8.
//  Copyright © 2018 可乐超. All rights reserved.
//

#import "ColaGesLockView.h"
#import "ColaGesButton.h"

@interface ColaGesLockView ()
/** 手势密码类型 */
@property (nonatomic, assign) ColaGesLockType gesLockType;
/** 标题 */
@property (nonatomic, strong) UILabel *titleLab;
/** 底部按钮 */
@property (nonatomic, strong) UIButton *bottomBtn;
/** 账户名 */
@property (nonatomic, strong) UILabel *nameLab;
/** 保存原始按钮 */
@property (nonatomic, strong) NSMutableArray *gesBtnArray;
/** 保存选中的按钮 */
@property (nonatomic, strong) NSMutableArray *gesSelectBtnArray;
/** 手势开始 */
@property (nonatomic, assign) BOOL startGesPwd;
 @end

@implementation ColaGesLockView

#pragma mark -
#pragma mark - 初始化手势UI
- (instancetype)initWithFrame:(CGRect)frame unlock:(BOOL)unlockStatus;
{
    self = [super initWithFrame:frame];
    if (self) {
        _gesLockType = unlockStatus;
        [self initGesLockUI];
    }
    return self;
}

#pragma mark -
#pragma mark - 重置手势类型
- (void)reloadGesLockType:(ColaGesLockType)type
{
    _gesLockType = type;
}

#pragma mark -
#pragma mark - 重置 / 密码解锁
- (void)bottomBtnAction
{
    
}

#pragma mark -
#pragma mark - 加载手势锁UI
- (void)initGesLockUI
{
    CGFloat space = (self.width - 32*3)/4;
    CGFloat original_y = self.height*.5-space-32 - 16;
    [self.gesBtnArray removeAllObjects];
    for (int i=0; i<9; i++) {
        CGRect frame = CGRectMake(space+(space+32)*(i%3), original_y +( i/3)*(space+32), 32, 32);
        ColaGesButton *button = [[ColaGesButton alloc] initWithFrame:frame];
        button.selectStatus = NO;
        button.tag = 5577+1+i;
        [self addSubview:button];
        [self.gesBtnArray addObject:button];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self clearSelectStatus];
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    for (ColaGesButton *button in self.gesBtnArray) {
        if (CGRectContainsPoint(button.frame, point)) {
            button.selectStatus = YES;
            _startGesPwd = YES;
            [self.gesSelectBtnArray addObject:button];
        }
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    for (ColaGesButton *button in self.gesBtnArray) {
        if (CGRectContainsPoint(button.frame, point)) {
            button.selectStatus = YES;
            _startGesPwd = YES;
            [self.gesSelectBtnArray addObject:button];
        }
    }
    if (_startGesPwd) {
        ColaGesButton *button = self.gesSelectBtnArray.lastObject;
        CGPoint startPoint = button.center;
        CGContextRef context = UIGraphicsGetCurrentContext();
        UIGraphicsPushContext(context);
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = 1.;
        [path moveToPoint:startPoint];
        [path addLineToPoint:point];
        [path stroke];
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _startGesPwd = NO;
    [self setGesPassword];
}
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _startGesPwd = NO;
    [self setGesPassword];
}

#pragma mark -
#pragma mark - 设置密码
- (void)setGesPassword
{
    NSMutableArray *passwordArray = [NSMutableArray arrayWithCapacity:0];
    for (ColaGesButton *button in self.gesBtnArray) {
        if (button.selectStatus) {
            NSInteger tag = button.tag - 5577;
            [passwordArray addObject:@(tag)];
        }
    }
    if (passwordArray.count > 4) {
        NSLog(@"设置密码");
    } else {
        [self clearSelectStatus];
        [self.gesSelectBtnArray removeAllObjects];
    }
}

#pragma mark -
#pragma mark - 清除全部选中状态
- (void)clearSelectStatus
{
    for (ColaGesButton *button in self.gesBtnArray) {
        button.selectStatus = NO;
    }
    _startGesPwd = NO;
}

#pragma mark -
#pragma mark - 懒加载部分
- (UILabel*)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel labelWithTxtColor:ColaHex(0x222222) txtFontSize:16.f alignment:NSTextAlignmentCenter];
        [self addSubview:_titleLab];
    }
    return _titleLab;
}
- (UILabel*)nameLab
{
    if (!_nameLab) {
        _nameLab = [UILabel labelWithTxtColor:ColaHex(0x222222) txtFontSize:20.f alignment:NSTextAlignmentCenter];
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
- (UIButton*)bottomBtn
{
    if (!_bottomBtn) {
        _bottomBtn = [UIButton buttonWithTitle:@"" txtColor:ColaHex(0x6f6f6f) txtFont:[UIFont systemFontOfSize:14.f] image:nil target:self action:@selector(bottomBtnAction)];
        [self addSubview:_bottomBtn];
    }
    return _bottomBtn;
}
- (NSMutableArray*)gesBtnArray
{
    if (!_gesBtnArray) {
        _gesBtnArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _gesBtnArray;
}
- (NSMutableArray*)gesSelectBtnArray
{
    if (!_gesSelectBtnArray) {
        _gesSelectBtnArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _gesSelectBtnArray;
}

@end
