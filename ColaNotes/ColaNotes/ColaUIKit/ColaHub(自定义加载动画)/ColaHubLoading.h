//
//  ColaHubLoading.h
//  ColaNotes
//
//  Created by cola on 2019/3/8.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

#define loading_dismiss_timestamp 2

@interface ColaHubLoading : UIView

#pragma mark  ---------- 加载loading ----------
/**
 加载动画，显示在window上，不遮盖任何视图，需要调用消失方法
 */
+ (void)showLoading;

/**
 加载动画，显示在window上，遮盖self.view，不遮盖导航栏，需要调用消失方法
 */
+ (void)showCoverLoading;

/**
 加载动画，显示在window上，遮盖window，loading期间不能点击，需要调用消失方法
 */
+ (void)showCoverWindowLoading;


#pragma mark  ---------- 延迟加载loading ----------
/**
 延迟几秒后执行加载动画，显示在window上，不遮盖任何视图，需要调用消失方法
 @param timestamp 延迟时间，秒级
 */
+ (void)showLoadingDelay:(float)timestamp;

/**
 延迟几秒后执行加载动画，显示在window上，遮盖self.view，不遮盖导航栏，需要调用消失方法
 @param timestamp 延迟时间，秒级
 */
+ (void)showCoverLoadingDelay:(float)timestamp;

/**
 延迟几秒后执行加载动画，显示在window上，遮盖window，loading期间不能点击，需要调用消失方法
 @param timestamp 延迟时间，秒级
 */
+ (void)showCoverWindowLoadingDelay:(float)timestamp;


#pragma mark  ---------- 加载吐司提示后，再加载loading ----------
/**
 弹出吐司提示后，几秒后执行加载动画，显示在window上，不遮盖任何视图，需要调用消失方法
 @param timestamp 延迟时间，秒级
 */
+ (void)showMessage:(NSString*)message loadingAfterDelay:(float)timestamp;

/**
 弹出吐司提示后，几秒后执行加载动画，显示在window上，遮盖self.view，不遮盖导航栏，需要调用消失方法
 @param timestamp 延迟时间，秒级
 */
+ (void)showCoverMessage:(NSString*)message loadingAfterDelay:(float)timestamp;

/**
 弹出吐司提示后，几秒后执行加载动画，显示在window上，遮盖window，loading期间不能点击，需要调用消失方法
 @param timestamp 延迟时间，秒级
 */
+ (void)showCoverWindowMessage:(NSString*)message loadingAfterDelay:(float)timestamp;


#pragma mark  ---------- 延迟加载吐司提示 ----------
/**
 弹出吐司提示，2秒后自动消失，时间可自定义，，显示在window上，不遮盖任何视图
 @param message 提示内容
 */
+ (void)showMessage:(NSString*)message;

/**
 弹出吐司提示，2秒后自动消失，时间可自定义，显示在window上，遮盖self.view，不遮盖导航栏
 @param message 提示内容
 */
+ (void)showCoverMessage:(NSString*)message;

/**
 弹出吐司提示，2秒后自动消失，时间可自定义，显示在window上，遮盖window，loading期间不能点击
 @param message 提示内容
 */
+ (void)showCoverWindowMessage:(NSString*)message;


#pragma mark  ---------- 取消加载loading ----------
/**
 取消加载动画
 */
+ (void)endLoading;


@end
