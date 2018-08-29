//
//  UIImage+Category.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

/**
 生成渐变色的UIImage
 @param startColor 渐变色的起始颜色
 @param endColor 渐变色的结束颜色
 @param size 渐变色区域
 @return 渐变色的UIImage
 */
+ (UIImage*)gradientStartColor:(UIColor*)startColor endColor:(UIColor*)endColor frame:(CGSize)size;

@end
