//
//  KSVCBBorderLabel.h
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/29.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSVCBBorderLabel : UIView
/** 字体内容 */
@property (nonatomic, copy) NSString *text;
/** 字体颜色 */
@property (nonatomic, strong) UIColor *textColor;

/**
 初始化UI
 @param frame frame值
 @return UIView
 */
- (instancetype)initWithFrame:(CGRect)frame;

@end
