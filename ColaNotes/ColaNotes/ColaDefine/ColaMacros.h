//
//  ColaMacros.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/28.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#ifndef ColaMacros_h
#define ColaMacros_h

/** 导航栏高度 */
#define Cola_NavItemHeight 44.f
/** 状态栏高度 */
#define Cola_StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
/** 导航栏+状态栏高度 */
#define Cola_NavStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height + 44.f

/** 当前设备屏幕宽 */
#define Cola_Width [UIScreen mainScreen].bounds.size.width
/** 当前设备屏幕高 */
#define Cola_Height [UIScreen mainScreen].bounds.size.height

/** 16进制颜色值转换成UIColor */
#define ColaHex(value) [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0x00FF00) >> 8))/255.0 blue:((float)(value & 0x0000FF))/255.0 alpha:1.f]
/** 16进制颜色值+透明度转换成UIColor */
#define ColaHexa(value,object) [UIColor colorWithRed:((float)((value & 0xFF0000) >> 16))/255.0 green:((float)((value & 0x00FF00) >> 8))/255.0 blue:((float)(value & 0x0000FF))/255.0 alpha:object]
/** RGB颜色值转换成UIColor */
#define ColaRgb(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
/** RGBA颜色值转换成UIColor */
#define ColaRgba(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#endif /* ColaMacros_h */
