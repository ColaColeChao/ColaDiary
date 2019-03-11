//
//  KSVCBTextField.h
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/29.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSVCBTextField : UIView

@property (nonatomic, assign) UIKeyboardType keyboardType;

/**
 初始化UI
 @param frame frame值
 @param delegate UITextField的代理
 @return UIView
 */
- (instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate;

/**
 加载数据内容
 @param placeholder 输入框占位内容
 @param hintMessage 正确/错误提示内容
 @param rightMessage 右部视图文字
 */
- (void)loadPlaceholder:(NSString*)placeholder hintMessage:(NSString*)hintMessage rightMessage:(NSString*)rightMessage;

/**
 右侧按钮添加点击事件
 @param target 对象
 @param action 点击事件
 */
- (void)addRightViewTarget:(id)target action:(SEL)action;

@end

