//
//  ColaHubLoading.m
//  ColaNotes
//
//  Created by cola on 2019/3/8.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import "ColaHubLoading.h"

typedef NS_ENUM(NSUInteger, ColaHubLoadingCoverType) {
    ColaHubLoadingCoverTypeNone = 0, // 无遮盖
    ColaHubLoadingCoverTypeView,     // 遮盖住self.view
    ColaHubLoadingCoverTypeWindow,   // 遮盖住keyWindow
};

@interface ColaHubLoading ()
/** 加载小菊花背景 */
@property (nonatomic, strong) UIView *loadingView;
/** 加载小菊花 */
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
/** 提示文字 */
@property (nonatomic, strong) UILabel *hintLab;
@end

@implementation ColaHubLoading

#pragma mark -
#pragma mark - 设置单例
+ (id)shareInstance
{
    static ColaHubLoading *share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[ColaHubLoading alloc] init];
    });
    return share;
}

#pragma mark -
#pragma mark - 加载动画，显示在window上，不遮盖任何视图，需要调用消失方法
+ (void)showLoading
{
    [[self shareInstance] showLoading];
}
- (void)showLoading
{
    [self endLoading];
    self.frame = CGRectZero;
    self.loadingView.layer.cornerRadius = 10.f;
    self.loadingView.frame = CGRectMake(0, 0, 80, 80);
    self.loadingView.center = [UIApplication sharedApplication].keyWindow.center;
    [[UIApplication sharedApplication].keyWindow addSubview:self.loadingView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.indicatorView];
    [self.indicatorView startAnimating];
}

#pragma mark -
#pragma mark - 加载动画，显示在window上，遮盖self.view，不遮盖导航栏，需要调用消失方法
+ (void)showCoverLoading
{
    [[self shareInstance] showCoverLoading];
}
- (void)showCoverLoading
{
    [self endLoading];
    self.frame = CGRectMake(0,
                            [self statusBarHeight],
                            [UIApplication sharedApplication].keyWindow.bounds.size.width,
                            [UIApplication sharedApplication].keyWindow.bounds.size.height - [self statusBarHeight]);
    self.loadingView.layer.cornerRadius = 10.f;
    self.loadingView.frame = CGRectMake(0, 0, 80, 80);
    self.loadingView.center = [UIApplication sharedApplication].keyWindow.center;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[UIApplication sharedApplication].keyWindow addSubview:self.loadingView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.indicatorView];
    [self.indicatorView startAnimating];
}

#pragma mark -
#pragma mark - 加载动画，显示在window上，遮盖window，loading期间不能点击，需要调用消失方法
+ (void)showCoverWindowLoading
{
    [[self shareInstance] showCoverWindowLoading];
}
- (void)showCoverWindowLoading
{
    [self endLoading];
    self.frame = [UIApplication sharedApplication].keyWindow.bounds;
    self.loadingView.layer.cornerRadius = 10.f;
    self.loadingView.frame = CGRectMake(0, 0, 80, 80);
    self.loadingView.center = [UIApplication sharedApplication].keyWindow.center;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[UIApplication sharedApplication].keyWindow addSubview:self.loadingView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.indicatorView];
    [self.indicatorView startAnimating];
}

#pragma mark -
#pragma mark - 弹出吐司提示后，几秒后执行加载动画，显示在window上，不遮盖任何视图，需要调用消失方法
+ (void)showLoadingAfterMessage:(NSString *)message
{
    [[self shareInstance] showMessage:message coverType:ColaHubLoadingCoverTypeNone];
    [self showLoadingDelay:loading_dismiss_timestamp];
}

#pragma mark -
#pragma mark - 弹出吐司提示后，几秒后执行加载动画，显示在window上，遮盖self.view，不遮盖导航栏，需要调用消失方法
+ (void)showCoverLoadingAfterMessage:(NSString *)message
{
    [[self shareInstance] showMessage:message coverType:ColaHubLoadingCoverTypeView];
    [self showLoadingDelay:loading_dismiss_timestamp];
}

#pragma mark -
#pragma mark - 弹出吐司提示后，几秒后执行加载动画，显示在window上，遮盖window，loading期间不能点击，需要调用消失方法
+ (void)showCoverWindowLoadingAfterMessage:(NSString *)message
{
    [[self shareInstance] showMessage:message coverType:ColaHubLoadingCoverTypeWindow];
    [self showLoadingDelay:loading_dismiss_timestamp];
}

#pragma mark -
#pragma mark - 延迟几秒后执行加载动画，显示在window上，不遮盖任何视图，需要调用消失方法
+ (void)showLoadingDelay:(float)timestamp
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, timestamp * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [ColaHubLoading showLoading];
    });
}

#pragma mark -
#pragma mark - 延迟几秒后执行加载动画，显示在window上，遮盖self.view，不遮盖导航栏，需要调用消失方法
+ (void)showCoverLoadingDelay:(float)timestamp
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, timestamp * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [ColaHubLoading showCoverLoading];
    });
}

#pragma mark -
#pragma mark - 延迟几秒后执行加载动画，显示在window上，遮盖window，loading期间不能点击，需要调用消失方法
+ (void)showCoverWindowLoadingDelay:(float)timestamp
{
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, timestamp * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [ColaHubLoading showCoverWindowLoading];
    });
}

#pragma mark -
#pragma mark - 弹出吐司提示，2秒后自动消失，时间可自定义，，显示在window上，不遮盖任何视图
+ (void)showMessage:(NSString*)message
{
    [[self shareInstance] showMessage:message coverType:ColaHubLoadingCoverTypeNone];
}


#pragma mark -
#pragma mark - 弹出吐司提示，2秒后自动消失，时间可自定义，显示在window上，遮盖self.view，不遮盖导航栏
+ (void)showCoverMessage:(NSString*)message
{
    [[self shareInstance] showMessage:message coverType:ColaHubLoadingCoverTypeView];
}


#pragma mark -
#pragma mark - 弹出吐司提示，2秒后自动消失，时间可自定义，显示在window上，遮盖window，loading期间不能点击
+ (void)showCoverWindowMessage:(NSString*)message
{
    [[self shareInstance] showMessage:message coverType:ColaHubLoadingCoverTypeWindow];
}
- (void)showMessage:(NSString*)message coverType:(ColaHubLoadingCoverType)type
{
    [self endLoading];
    self.hintLab.text = message;
    CGFloat windowWidth  = [UIApplication sharedApplication].keyWindow.bounds.size.width;
    CGFloat windowHeight = [UIApplication sharedApplication].keyWindow.bounds.size.height;
    CGSize size = [self.hintLab sizeThatFits:CGSizeMake(windowWidth, windowHeight)];
    self.hintLab.frame = CGRectMake(0, 0, size.width + 20, size.height + 10);
    self.hintLab.center = [UIApplication sharedApplication].keyWindow.center;
    self.loadingView.frame = self.hintLab.frame;
    self.loadingView.layer.cornerRadius = 5.f;
    CGRect rect = CGRectZero;
    if (ColaHubLoadingCoverTypeView == type) {
        rect = CGRectMake(0, [self statusBarHeight], windowWidth,windowHeight - [self statusBarHeight]);
        [[UIApplication sharedApplication].keyWindow addSubview:self];
    } else if (ColaHubLoadingCoverTypeWindow == type) {
        rect = [UIApplication sharedApplication].keyWindow.bounds;
    }
    self.frame = rect;
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[UIApplication sharedApplication].keyWindow addSubview:self.loadingView];
    [[UIApplication sharedApplication].keyWindow addSubview:self.hintLab];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, loading_dismiss_timestamp * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self endLoading];
    });
}

#pragma mark -
#pragma mark - 取消加载动画
+ (void)endLoading
{
    [[self shareInstance] endLoading];
}
- (void)endLoading
{
    [self.indicatorView stopAnimating];
    [self.hintLab removeFromSuperview];
    [self.loadingView removeFromSuperview];
    [self.indicatorView removeFromSuperview];
    [self removeFromSuperview];
}

#pragma mark -
#pragma mark - 状态栏 + 导航栏高度
- (CGFloat)statusBarHeight
{
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    return statusBarHeight + 44.f;
}

#pragma mark -
#pragma mark - 懒加载部分
- (UIView*)loadingView
{
    if (!_loadingView) {
        _loadingView = [UIView new];
        _loadingView.backgroundColor = [UIColor colorWithWhite:.1 alpha:.8];
        _loadingView.layer.cornerRadius = 10.f;
        _loadingView.frame = CGRectMake(0, 0, 80, 80);
        _loadingView.center = [UIApplication sharedApplication].keyWindow.center;
    }
    return _loadingView;
}
- (UILabel*)hintLab
{
    if (!_hintLab) {
        _hintLab = [UILabel new];
        _hintLab.font = [UIFont systemFontOfSize:16.f];
        _hintLab.textAlignment = NSTextAlignmentCenter;
        _hintLab.textColor = [UIColor whiteColor];
    }
    return _hintLab;
}
- (UIActivityIndicatorView*)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _indicatorView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        _indicatorView.frame = CGRectMake(0, 0, 80, 80);
        _indicatorView.center = [UIApplication sharedApplication].keyWindow.center;
        _indicatorView.transform = CGAffineTransformMakeScale(1., 1.);
    }
    return _indicatorView;
}
@end
