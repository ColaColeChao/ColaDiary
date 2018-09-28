//
//  ColaScanView.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/11.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColaScanView : UIView

/** 初始化扫一扫view */
- (instancetype)initWithFrame:(CGRect)frame outsideViewLayer:(CALayer*)outsideViewLayout;

/** 移除定时器，停止扫描动画 */
- (void)stopColaScan;

/** 开启定时器，开始扫描动画 */
- (void)startColaScan;

@end
