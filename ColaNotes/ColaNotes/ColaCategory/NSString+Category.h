//
//  NSString+Category.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

/**
 验证字符串是否为空
 @return YES=字符串不为空，NO=字符串为空
 */
- (BOOL)isNotEmpty;

/**
 计算字符串在UILabel上的size值（精准计算）
 @param maxSize 最大size值
 @param font 字体
 @param lines 行数
 @return 字符串在UILabel上的size值
 */
- (CGSize)sizeInLabelWithMaxSize:(CGSize)maxSize txtFont:(UIFont*)font lines:(int)lines;

@end
