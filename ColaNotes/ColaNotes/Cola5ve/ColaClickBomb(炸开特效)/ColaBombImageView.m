//
//  ColaBombImageView.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBombImageView.h"

@implementation ColaBombImageView

#pragma mark -
#pragma mark - 初始化按钮UIButton
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.animationImages = @[
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_01"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_02"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_03"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_04"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_05"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_06"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_07"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_08"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_09"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_10"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_11"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_12"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_13"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_14"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_15"],
                                           [UIImage imageNamed:@"ColaBombImages.bundle/btn_star_16"],];
        self.animationRepeatCount = 0;
        self.animationDuration = .9f;
        [self startAnimating];
        CGAffineTransform transform= CGAffineTransformMakeRotation(arc4random() % 180);
        self.transform = transform;
        [self startShake];
    }
    return self;
}

#pragma mark -
#pragma mark - 开始上下抖动
- (void)startShake
{
    CAKeyframeAnimation *shakeAnim = [CAKeyframeAnimation animation];
    shakeAnim.keyPath = @"transform.translation.y";
    shakeAnim.duration = 3;
    shakeAnim.values = @[@0 , @(-15), @(15), @0];
    shakeAnim.repeatCount = MAXFLOAT;
    [self.layer addAnimation:shakeAnim forKey:@"staranimation"];
}

@end
