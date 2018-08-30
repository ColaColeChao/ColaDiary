//
//  UIButton+Position.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/30.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonImagePosition) {
    ButtonImagePositionLeft = 0,              //图片在左，文字在右，默认
    ButtonImagePositionRight = 1,             //图片在右，文字在左
    ButtonImagePositionTop = 2,               //图片在上，文字在下
    ButtonImagePositionBottom = 3,          //图片在下，文字在上
};

@interface UIButton (Position)

/**
 利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 @param postion 图片相对文字的位置
 @param spacing 图片文字的间距
 */
- (void)setImagePosition:(ButtonImagePosition)postion spacing:(CGFloat)spacing;

@end
