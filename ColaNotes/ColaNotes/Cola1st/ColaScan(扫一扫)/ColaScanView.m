//
//  ColaScanView.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/11.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaScanView.h"
#import <AVFoundation/AVFoundation.h>

#define ColaScanContentX self.frame.size.width * .15
#define ColaScanContentY self.frame.size.height * .24

static CGFloat const cola_animation_line_h = 12.f;
static CGFloat const cola_border_outsideview_alpha = .4f;
static CGFloat const cola_timer_animation_duration = .05f;

@interface ColaScanView ()
@property (nonatomic, strong) CALayer *scanLayer;
@property (nonatomic, strong) UIImageView *scanLine;
@property (nonatomic, strong) NSTimer *scanTimer;
@end

@implementation ColaScanView

#pragma mark -
#pragma mark - 初始化扫一扫UIView
- (instancetype)initWithFrame:(CGRect)frame outsideViewLayer:(CALayer *)outsideViewLayout
{
    if (self == [super initWithFrame:frame]) {
        self.scanLayer = outsideViewLayout;
        [self setScanCodeEdging];
    }
    return self;
}

#pragma mark -
#pragma mark - 添加扫描区域边框
- (void)setScanCodeEdging
{
    UIView *scanContentView = [UIView new];
    CGFloat scanContentViewX = ColaScanContentX;
    CGFloat scanContentViewY = ColaScanContentY;
    CGFloat scanContentW = self.frame.size.width - 2*ColaScanContentX;
    CGFloat scanContentViewH = scanContentW;
    scanContentView.frame = CGRectMake(scanContentViewX, scanContentViewY, scanContentW, scanContentViewH);
    scanContentView.layer.borderColor = [UIColor colorWithWhite:.6 alpha:1].CGColor;
    scanContentView.layer.borderWidth = .7f;
    scanContentView.backgroundColor = [UIColor clearColor];
    [self.scanLayer addSublayer:scanContentView.layer];
    
    self.scanLine.frame = CGRectMake(ColaScanContentX*.5, scanContentViewY, ColaScanContentX, cola_animation_line_h);
    
    UIView *topView = [UIView new];
    topView.frame = CGRectMake(0, 0, self.frame.size.width, scanContentViewY);
    topView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:cola_border_outsideview_alpha];
    [self addSubview:topView];
    
    UIView *leftView = [UIView new];
    leftView.frame = CGRectMake(0, scanContentViewY, ColaScanContentX, scanContentViewH);
    leftView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:cola_border_outsideview_alpha];
    [self addSubview:leftView];
    
    UIView *rightView = [UIView new];
    rightView.frame = CGRectMake(CGRectGetMaxX(scanContentView.frame), scanContentViewY, ColaScanContentX, scanContentViewH);
    rightView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:cola_border_outsideview_alpha];
    [self addSubview:rightView];
    
    UIView *bottomView = [UIView new];
    bottomView.frame = CGRectMake(0, CGRectGetMaxY(scanContentView.frame), self.frame.size.width, self.frame.size.height - CGRectGetMaxY(scanContentView.frame));
    bottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:cola_border_outsideview_alpha];
    [self addSubview:bottomView];
}

#pragma mark -
#pragma mark - 懒加载部分
- (UIImageView*)scanLine
{
    if (!_scanLine) {
        _scanLine = [UIImageView new];
        _scanLine.image = [UIImage imageNamed:@""];
        [self.scanLayer addSublayer:_scanLine.layer];
    }
    return _scanLine;
}

@end
