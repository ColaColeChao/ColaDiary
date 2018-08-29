//
//  UILabel+Category.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

/**
 初始化UILabel，默认左对齐
 @param title label上文字
 @param color label上字体颜色
 @param font label上字体
 @return UILabel
 */
+ (instancetype)labelWithTitle:(NSString*)title txtColor:(UIColor*)color txtFont:(UIFont*)font
{
    NSString *titleString = [NSString stringWithFormat:@"%@",title];
    UILabel *label = [UILabel new];
    label.text = [titleString isNotEmpty]?titleString:@"";
    label.textColor = color;
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

/**
 初始化UILabel，默认左对齐
 @param title label上文字
 @param color label上字体颜色
 @param size label上字体大小，系统默认不加粗字体
 @return UILabel
 */
+ (instancetype)labelWithTitle:(NSString*)title txtColor:(UIColor*)color txtFontSize:(CGFloat)size
{
    NSString *titleString = [NSString stringWithFormat:@"%@",title];
    UILabel *label = [UILabel new];
    label.text = [titleString isNotEmpty]?titleString:@"";
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:size];
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

/**
 初始化UILabel
 @param title label上文字
 @param color label上字体颜色
 @param font label上字体
 @param alignment 对齐方式（左、中、右）
 @return UILabel
 */
+ (instancetype)labelWithTitle:(NSString*)title txtColor:(UIColor*)color txtFont:(UIFont*)font alignment:(NSTextAlignment)alignment
{
    NSString *titleString = [NSString stringWithFormat:@"%@",title];
    UILabel *label = [UILabel new];
    label.text = [titleString isNotEmpty]?titleString:@"";
    label.textColor = color;
    label.font = font;
    label.textAlignment = alignment;
    return label;
}

/**
 初始化UILabel
 @param title label上文字
 @param color label上字体颜色
 @param size label上字体大小，系统默认不加粗字体
 @param alignment 对齐方式（左、中、右）
 @return UILabel
 */
+ (instancetype)labelWithTitle:(NSString*)title txtColor:(UIColor*)color txtFontSize:(CGFloat)size alignment:(NSTextAlignment)alignment
{
    NSString *titleString = [NSString stringWithFormat:@"%@",title];
    UILabel *label = [UILabel new];
    label.text = [titleString isNotEmpty]?titleString:@"";
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:size];
    label.textAlignment = alignment;
    return label;
}

/**
 初始化UILabel，默认左对齐，文字为空""
 @param color label上字体颜色
 @param font label上字体
 @return UILabel
 */
+ (instancetype)labelWithTxtColor:(UIColor*)color txtFont:(UIFont*)font
{
    UILabel *label = [UILabel new];
    label.text = @"";
    label.textColor = color;
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

/**
 初始化UILabel，默认左对齐，文字为空""
 @param color label上字体颜色
 @param size label上字体大小，系统默认不加粗字体
 @return UILabel
 */
+ (instancetype)labelWithTxtColor:(UIColor*)color txtFontSize:(CGFloat)size
{
    UILabel *label = [UILabel new];
    label.text = @"";
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:size];
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}

/**
 初始化UILabel，文字为空""
 @param color label上字体颜色
 @param font label上字体
 @param alignment 对齐方式（左、中、右）
 @return UILabel
 */
+ (instancetype)labelWithTxtColor:(UIColor*)color txtFont:(UIFont*)font alignment:(NSTextAlignment)alignment
{
    UILabel *label = [UILabel new];
    label.text = @"";
    label.textColor = color;
    label.font = font;
    label.textAlignment = alignment;
    return label;
}

/**
 初始化UILabel，文字为空""
 @param color label上字体颜色
 @param size label上字体大小，系统默认不加粗字体
 @param alignment 对齐方式（左、中、右）
 @return UILabel
 */
+ (instancetype)labelWithTxtColor:(UIColor*)color txtFontSize:(CGFloat)size alignment:(NSTextAlignment)alignment
{
    UILabel *label = [UILabel new];
    label.text = @"";
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:size];
    label.textAlignment = alignment;
    return label;
}

@end
