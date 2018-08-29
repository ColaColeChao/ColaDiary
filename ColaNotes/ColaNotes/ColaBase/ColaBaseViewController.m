//
//  ColaBaseViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/21.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBaseViewController.h"
#import "ColaBaseConfig.h"

@interface ColaBaseViewController ()
/** 自定义导航栏背景 */
@property (nonatomic, strong) UIImageView *navItemImageView;
/** 自定义导航栏标题 */
@property (nonatomic, strong) UILabel *navTitleLab;
@end

@implementation ColaBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavItemBackgroundColor:Cola_NavItemDefaultBackgroundColor];
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                        自定义导航栏部分                           //////////////////
//////////////////            可自定义导航栏颜色、图片、渐变色               //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setNavItemBackgroundColor:(UIColor*)color
{
    [self setNavItemBackgroundWithObject:color];
}
- (void)setNavItemBackgroundStartColor:(UIColor *)startColor endColor:(UIColor*)endColor
{
    CGSize gradientSize = CGSizeMake(Cola_Width, Cola_NavStatusBarHeight);
    UIImage *gradientImage = [UIImage gradientStartColor:startColor endColor:endColor frame:gradientSize];
    self.navItemImageView.backgroundColor = [UIColor colorWithPatternImage:gradientImage];
    self.navItemImageView.frame = CGRectMake(0, 0, Cola_Width, Cola_NavStatusBarHeight);
}
- (void)setNavItemBackgroundImageName:(NSString*)imageName
{
    [self setNavItemBackgroundWithObject:imageName];
}
- (void)setNavItemBackgroundImage:(UIImage*)image
{
    [self setNavItemBackgroundWithObject:image];
}
- (void)setNavItemBackgroundImageView:(UIImageView*)imageView
{
    [self setNavItemBackgroundWithObject:imageView];
}
- (void)setNavItemBackgroundWithObject:(id)object
{
    if ([object isKindOfClass:[UIColor class]]) {
        self.navItemImageView.backgroundColor = object;
    } else if ([object isKindOfClass:[NSString class]]) {
        self.navItemImageView.image = [UIImage imageNamed:object];
    } else if ([object isKindOfClass:[UIImage class]]) {
        self.navItemImageView.image = object;
    } else if ([object isKindOfClass:[UIImageView class]]) {
        self.navItemImageView = object;
    } else {
        self.navItemImageView.backgroundColor = Cola_NavItemDefaultBackgroundColor;
    }
    self.navItemImageView.frame = CGRectMake(0, 0, Cola_Width, Cola_NavStatusBarHeight);
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                      自定义导航栏标题部分                       //////////////////
//////////////////  字符串过长会根据屏幕宽度换行(最多两行)或适配显示  //////////////////
//////////////////      字体颜色、字体等可根据不同需求调用不同方法      //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setNavTitle:(NSString*)title
{
    [self setNavTitle:title color:Cola_NavTitleDetaultColor font:Cola_NavTitleDefaultFont];
}
- (void)setNavTitle:(NSString*)title color:(UIColor*)color
{
    [self setNavTitle:title color:color font:Cola_NavTitleDefaultFont];
}
- (void)setNavTitle:(NSString *)title font:(UIFont*)font
{
    [self setNavTitle:title color:Cola_NavTitleDetaultColor font:font];
}
- (void)setNavTitle:(NSString*)title color:(UIColor*)color font:(UIFont*)font
{
    NSString *string = [NSString stringWithFormat:@"%@",title];
    CGSize size = [string sizeInLabelWithMaxSize:CGSizeMake(Cola_Width*.5, Cola_NavItemHeight) txtFont:font lines:2];
    self.navTitleLab.text = string;
    self.navTitleLab.textColor = color?color:Cola_NavTitleDetaultColor;
    self.navTitleLab.font = font;
    CGFloat original_x = (Cola_Width - size.width)*.5;
    self.navTitleLab.frame = CGRectMake(original_x, Cola_StatusBarHeight, size.width, Cola_NavItemHeight);
    [self.view bringSubviewToFront:self.navTitleLab];
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            自定义导航栏左侧单按钮部分（文字）            //////////////////
//////////////////  字符串过长会根据屏幕宽度换行(最多两行)或截取显示  //////////////////
//////////////////      字体颜色、字体等可根据不同需求调用不同方法      //////////////////
//////////////////            左侧按钮除根视图外，默认为返回按钮            //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeftNavTitle:(NSString*)leftTitle
{
    
}
- (void)setLeftNavTitle:(NSString*)leftTitle color:(UIColor*)color
{
    
}
- (void)setLeftNavTitle:(NSString*)leftTitle font:(UIFont*)font
{
    
}
- (void)setLeftNavTitle:(NSString*)leftTitle color:(UIColor*)color font:(UIFont*)font
{
    
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            自定义导航栏左侧单按钮部分（图片）            //////////////////
//////////////////                   自行设置图片、图片名称                       //////////////////
//////////////////            左侧按钮除根视图外，默认为返回按钮            //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeftNavImageName:(NSString*)imageName
{
    
}
- (void)setLeftNavImage:(UIImage*)image
{
    
}
- (void)setLeftNavImageView:(UIImageView*)imageView
{
    
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            自定义导航栏右侧单按钮部分（文字）            //////////////////
//////////////////  字符串过长会根据屏幕宽度换行(最多两行)或截取显示  //////////////////
//////////////////      字体颜色、字体等可根据不同需求调用不同方法      //////////////////
//////////////////            左侧按钮除根视图外，默认为返回按钮            //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setRightNavTitle:(NSString*)rightTitle
{
    
}
- (void)setRightNavTitle:(NSString*)rightTitle color:(UIColor*)color
{
    
}
- (void)setRightNavTitle:(NSString*)rightTitle font:(UIFont*)font
{
    
}
- (void)setRightNavTitle:(NSString*)rightTitle color:(UIColor*)color font:(UIFont*)font
{
    
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            自定义导航栏右侧单按钮部分（图片）            //////////////////
//////////////////                   自行设置图片、图片名称                       //////////////////
//////////////////            左侧按钮除根视图外，默认为返回按钮            //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setRightNavImageName:(NSString*)imageName
{
    
}
- (void)setRightNavImage:(UIImage*)image
{
    
}
- (void)setRightNavImageView:(UIImageView*)imageView
{
    
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                           对象懒加载部分                           //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (UIImageView*)navItemImageView
{
    if (!_navItemImageView) {
        _navItemImageView = [UIImageView new];
        [self.view addSubview:self.navItemImageView];
    }
    return _navItemImageView;
}
- (UILabel*)navTitleLab
{
    if (!_navTitleLab) {
        _navTitleLab = [UILabel new];
        _navTitleLab.text = @"";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.numberOfLines = 2;
        _navTitleLab.adjustsFontSizeToFitWidth = YES;
        [self.view addSubview:_navTitleLab];
    }
    return _navTitleLab;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
