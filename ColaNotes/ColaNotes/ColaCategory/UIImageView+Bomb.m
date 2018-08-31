//
//  UIImageView+Bomb.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "UIImageView+Bomb.h"

#define LAYER_ANIMATION_LAYER_NAME @"layerName"

@implementation UIImageView (Bomb)

#pragma mark -
#pragma mark - 图片炸开特效
 - (void)bombomb
{
    NSArray *images = @[
                        @"ColaBombImages.bundle/icon_star01",
                        @"ColaBombImages.bundle/icon_star02",
                        @"ColaBombImages.bundle/icon_star03",
                        @"ColaBombImages.bundle/icon_star01",
                        @"ColaBombImages.bundle/icon_star02",
                        @"ColaBombImages.bundle/icon_star03",
                        @"ColaBombImages.bundle/icon_star01",
                        @"ColaBombImages.bundle/icon_star02",
                        @"ColaBombImages.bundle/icon_star03",
                        @"ColaBombImages.bundle/icon_star01",
                        @"ColaBombImages.bundle/icon_star02",
                        @"ColaBombImages.bundle/icon_star03"
                        ];
    for (NSString * name in images) {
        UIImage *image = ColaImageName(name);
        [self exportImage:image withColor:nil];
    }
}

- (void)exportImage:(UIImage *)image withColor:(UIColor *)color
{
    if (!image) return;
    CGFloat width = 28.0f;
    CGFloat height = width * image.size.height / image.size.width;
    CGRect frame =
    CGRectMake(self.center.x - width/2, self.center.y-height/2-15, width, height);
    CALayer *heartLayer = [CALayer layer];
    heartLayer.opacity = 0.0f;
    heartLayer.frame = frame;
    
    if (color) {
        CALayer *maskLayer = [CALayer layer];
        maskLayer.frame = CGRectMake(0, 0, width, height);
        maskLayer.contents = (__bridge id)image.CGImage;
        maskLayer.contentsGravity = kCAGravityResizeAspect;
        heartLayer.opacity = 0.0f;
        heartLayer.mask = maskLayer;
        heartLayer.backgroundColor = color.CGColor;
    } else {
        heartLayer.contents = (__bridge id)image.CGImage;
    }
    
    [self.superview.layer insertSublayer:heartLayer above:self.layer];
    
    //动画
    [self startAnimationHeartLayer:heartLayer];
}

- (void)startAnimationHeartLayer:(CALayer *)heartLayer
{
    CGFloat duration = .1f + arc4random_uniform(10) * 0.1;
    //位置动画
    CABasicAnimation *posAnimation =
    [CABasicAnimation animationWithKeyPath:@"position"];
    CGFloat destination_x = arc4random_uniform(Cola_Width);
    CGFloat destinaion_y = heartLayer.position.y/2;
    CGPoint destination = CGPointMake(destination_x, destinaion_y);
    [posAnimation setToValue:[NSValue valueWithCGPoint:destination]];
    //透明度动画
    CAKeyframeAnimation *alphaAnimation =
    [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.values = @[@1.0,@1.0,@0.0];
    alphaAnimation.keyTimes = @[@0.0,@0.90,@1.0];
    //旋转动画
    CABasicAnimation *angleAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform"];
    [angleAnimation setFromValue:
     [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)]];
    CATransform3D destTrans =
    CATransform3DMakeRotation(M_PI/4, 0, 0, (arc4random() % 2000) /1000.0f -1);
    destTrans = CATransform3DScale(destTrans, 1.5f, 1.5f, 1.5f);
    [angleAnimation setToValue:[NSValue valueWithCATransform3D:destTrans]];
    angleAnimation.beginTime = 0.2;
    //缩放
    CABasicAnimation *scaleAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [scaleAnimation setFromValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1f, 0.1f, 1.0f)]];
    CATransform3D scaleTrans = CATransform3DMakeScale(1.0f, 1.0f, 1.0f);
    [scaleAnimation setToValue:[NSValue valueWithCATransform3D:scaleTrans]];
    scaleAnimation.duration = 0.2;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    [groupAnimation setAnimations:@[posAnimation,alphaAnimation,angleAnimation]];
    [groupAnimation setDuration:duration];
    [groupAnimation setRemovedOnCompletion:YES];
    
    groupAnimation.delegate = self;
    [groupAnimation setValue:heartLayer
                      forKey:LAYER_ANIMATION_LAYER_NAME];
    
    [heartLayer addAnimation:groupAnimation forKey:nil];
}


@end
