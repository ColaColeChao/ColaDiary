//
//  UIButton+Category.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/30.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

/**
 初始化UIButton，文字和背景图片为空
 @param image 按钮图片
 @param target 对象
 @param action 执行方法
 @return UIButton
 */
+ (instancetype)buttonWithImage:(UIImage*)image target:(id)target action:(SEL)action;

/**
 初始化UIButton，文字和图片为空
 @param image 按钮背景图片
 @param target 对象
 @param action 执行方法
 @return UIButton
 */
+ (instancetype)buttonWithBackgroundImage:(UIImage*)image target:(id)target action:(SEL)action;

/**
 初始化UIButton，背景图片为空
 @param title 按钮上文字
 @param color 按钮上文字字体颜色
 @param size 字体大小
 @param image 按钮图片
 @param target 对象
 @param action 执行方法
 @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString*)title txtColor:(UIColor*)color txtFontSize:(CGFloat)size image:(UIImage*)image target:(id)target action:(SEL)action;

/**
 初始化UIButton，背景图片为空
 @param title 按钮上文字
 @param color 按钮上文字字体颜色
 @param font 字体
 @param image 按钮图片
 @param target 对象
 @param action 执行方法
 @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString*)title txtColor:(UIColor*)color txtFont:(UIFont*)font image:(UIImage*)image target:(id)target action:(SEL)action;

/**
 初始化UIButton，按钮图片为空
 @param title 按钮上文字
 @param color 按钮上文字字体颜色
 @param size 字体大小
 @param image 按钮背景图片
 @param target 对象
 @param action 执行方法
 @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString*)title txtColor:(UIColor*)color txtFontSize:(CGFloat)size backgroundImage:(UIImage*)image target:(id)target action:(SEL)action;

/**
 初始化UIButton，按钮图片为空
 @param title 按钮上文字
 @param color 按钮上文字字体颜色
 @param font 字体
 @param image 按钮背景图片
 @param target 对象
 @param action 执行方法
 @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString*)title txtColor:(UIColor*)color txtFont:(UIFont*)font backgroundImage:(UIImage*)image target:(id)target action:(SEL)action;

/**
 初始化UIButton，包括文字、字体颜色、选中字体颜色、按钮图片、选中按钮图片、对象和执行方法
 @param title 按钮上文字
 @param norColor 正常状态下字体颜色
 @param selColor 选中状态下字体颜色
 @param font 字体
 @param norImage 正常状态下按钮图片
 @param selImage 选中状态下的按钮图片
 @param target 对象
 @param action 执行方法
 @return UIButton
 */
+ (instancetype)buttonWithTitle:(NSString*)title norTxtColor:(UIColor*)norColor selTxtColor:(UIColor*)selColor txtFont:(UIFont*)font norImage:(UIImage*)norImage selImage:(UIImage*)selImage target:(id)target action:(SEL)action;

@end
