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

/**
 时间戳转换成格式化日期
 C转换： 568610642.888382 - 568610642.889125 = 0.000743 快
 OC转换：568610785.535561 - 568610785.541707 = 0.006146 慢
 @return 时间戳(秒/毫秒)
 */
- (NSString*)toFormatTimes;

/**
 小数位数限制，按照位数自动截取
 @param digits 限制的位数
 @return 截取后的字符串
 */
- (NSString*)cutDigitsLimitInt:(int)digits;

/**
 判断小数位数，是否是允许输入的小数位数
 @param digits 小数位数
 @return 是否是允许输入的小数位数
 */
- (BOOL)judgeInputDigitsInt:(int)digits;



@end
