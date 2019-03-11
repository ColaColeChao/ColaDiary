//
//  KSVCBCoinButton.h
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/29.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSVCBCoinButton : UIView

/** 标题内容 */
@property (nonatomic, copy) NSString *text;

/**
 初始化UI
 @param frame  frame值
 @param action 点击事件
 @return KSVCBCoinButton
 */
- (instancetype)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action;

@end

