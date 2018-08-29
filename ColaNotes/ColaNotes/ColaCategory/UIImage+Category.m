//
//  UIImage+Category.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)

/**
 生成渐变色的UIImage
 @param startColor 渐变色的起始颜色
 @param endColor 渐变色的结束颜色
 @param size 渐变色区域
 @return 渐变色的UIImage
 */
+ (UIImage*)gradientStartColor:(UIColor*)startColor endColor:(UIColor*)endColor frame:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, size.width, 0);
    CGPathAddLineToPoint(path, NULL, size.width, size.height);
    CGPathAddLineToPoint(path, NULL, 0, size.height);
    CGPathCloseSubpath(path);
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    NSArray *colors = @[(__bridge id) startColor.CGColor, (__bridge id) endColor.CGColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGRect pathRect = CGPathGetBoundingBox(path);
    CGPoint startPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMinY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMaxY(pathRect));
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    CGPathRelease(path);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
