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
/** 自定义导航栏左侧按钮 */
@property (nonatomic, strong) UIButton *leftNavBarButton;
/** 自定义导航栏右侧按钮 */
@property (nonatomic, strong) UIButton *rightNavBarButton;
@end

@implementation ColaBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavItemBackgroundColor:Cola_NavItemDefaultBackgroundColor];
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.navigationController.viewControllers.count > 1) {
        [self setLeftNavImageName:@"cola_bar_back"];
        [self.leftNavBarButton removeTarget:self action:@selector(leftNavBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.leftNavBarButton addTarget:self action:@selector(popToLastViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    [self setNeedsStatusBarAppearanceUpdate];
}

/** self.view的起始y坐标 */
- (CGFloat)originalY
{
    return Cola_NavStatusBarHeight;
}
/** 带有导航栏和Tabbar的视图总高度 */
- (CGFloat)mainViewHeight
{
    float deviceHeight = Cola_Height;
    float navStatusBarHeight = Cola_NavStatusBarHeight;
    float tabbarHeight = Cola_TabbarHeight;
    float tabbarSafeAreaHeight = Cola_TabbarSafeHeight;
    return deviceHeight - navStatusBarHeight - tabbarHeight - tabbarSafeAreaHeight;
}
/** D哎呦导航栏的视图总高度 */
- (CGFloat)subViewheight
{
    float deviceHeight = Cola_Height;
    float navStatusBarHeight = Cola_NavStatusBarHeight;
    return deviceHeight - navStatusBarHeight;
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
    [self setLeftNavTitle:leftTitle color:Cola_NavBarDefaultColor font:Cola_NavBarDefaultFont];
}
- (void)setLeftNavTitle:(NSString*)leftTitle color:(UIColor*)color
{
    [self setLeftNavTitle:leftTitle color:color font:Cola_NavBarDefaultFont];
}
- (void)setLeftNavTitle:(NSString*)leftTitle font:(UIFont*)font
{
    [self setLeftNavTitle:leftTitle color:Cola_NavBarDefaultColor font:font];
}
- (void)setLeftNavTitle:(NSString*)leftTitle color:(UIColor*)color font:(UIFont*)font
{
    NSString *string = [NSString stringWithFormat:@"%@",leftTitle];
    [self.leftNavBarButton setImage:nil forState:UIControlStateNormal];
    [self.leftNavBarButton setTitle:string forState:UIControlStateNormal];
    [self.leftNavBarButton setTitleColor:color forState:UIControlStateNormal];
    self.leftNavBarButton.titleLabel.font = font;
    CGSize size = [string sizeInLabelWithMaxSize:CGSizeMake(100, 44) txtFont:font lines:1];
    CGFloat width = size.width < 30 ? 50:size.width;
    width = width > 80 ? 80:width;
    self.leftNavBarButton.frame = CGRectMake(15, Cola_StatusBarHeight, width, Cola_NavItemHeight);
    [self.leftNavBarButton addTarget:self action:@selector(leftNavBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:self.leftNavBarButton];
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            自定义导航栏左侧单按钮部分（图片）            //////////////////
//////////////////                   自行设置图片、图片名称                       //////////////////
//////////////////            左侧按钮除根视图外，默认为返回按钮            //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeftNavImageName:(NSString*)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    [self setLeftNavImage:image];
}
- (void)setLeftNavImage:(UIImage*)image
{
    [self.leftNavBarButton setImage:image forState:UIControlStateNormal];
    [self.leftNavBarButton setTitle:@"" forState:UIControlStateNormal];
    CGSize size = image.size;
    CGFloat width = size.width < 30 ? 50:size.width;
    width = width > 80 ? 80:width;
    self.leftNavBarButton.frame = CGRectMake(15, Cola_StatusBarHeight, width, Cola_NavItemHeight);
    [self.leftNavBarButton addTarget:self action:@selector(leftNavBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:self.leftNavBarButton];
}
- (void)setLeftNavImageView:(UIImageView*)imageView
{
    [self setLeftNavImage:imageView.image];
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            自定义导航栏右侧单按钮部分（文字）            //////////////////
//////////////////  字符串过长会根据屏幕宽度换行(最多两行)或截取显示  //////////////////
//////////////////      字体颜色、字体等可根据不同需求调用不同方法      //////////////////
//////////////////            左侧按钮除根视图外，默认为返回按钮            //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setRightNavTitle:(NSString*)rightTitle
{
    [self setRightNavTitle:rightTitle color:Cola_NavBarDefaultColor font:Cola_NavBarDefaultFont];
}
- (void)setRightNavTitle:(NSString*)rightTitle color:(UIColor*)color
{
    [self setRightNavTitle:rightTitle color:color font:Cola_NavBarDefaultFont];
}
- (void)setRightNavTitle:(NSString*)rightTitle font:(UIFont*)font
{
    [self setRightNavTitle:rightTitle color:Cola_NavBarDefaultColor font:font];
}
- (void)setRightNavTitle:(NSString*)rightTitle color:(UIColor*)color font:(UIFont*)font
{
    NSString *string = [NSString stringWithFormat:@"%@",rightTitle];
    [self.rightNavBarButton setImage:nil forState:UIControlStateNormal];
    [self.rightNavBarButton setTitle:string forState:UIControlStateNormal];
    [self.rightNavBarButton setTitleColor:color forState:UIControlStateNormal];
    self.rightNavBarButton.titleLabel.font = font;
    CGSize size = [string sizeInLabelWithMaxSize:CGSizeMake(100, 44) txtFont:font lines:1];
    CGFloat width = size.width < 30 ? 50:size.width;
    width = width > 80 ? 80:width;
    self.rightNavBarButton.frame = CGRectMake(Cola_Width-15-width, Cola_StatusBarHeight, width, Cola_NavItemHeight);
    [self.rightNavBarButton addTarget:self action:@selector(rightNavBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:self.rightNavBarButton];
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            自定义导航栏右侧单按钮部分（图片）            //////////////////
//////////////////                   自行设置图片、图片名称                       //////////////////
//////////////////            左侧按钮除根视图外，默认为返回按钮            //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setRightNavImageName:(NSString*)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    [self setRightNavImage:image];
}
- (void)setRightNavImage:(UIImage*)image
{
    [self.rightNavBarButton setImage:image forState:UIControlStateNormal];
    [self.rightNavBarButton setTitle:@"" forState:UIControlStateNormal];
    CGSize size = image.size;
    CGFloat width = size.width < 30 ? 50:size.width;
    width = width > 80 ? 80:width;
    self.rightNavBarButton.frame = CGRectMake(Cola_Width-15-width, Cola_StatusBarHeight, width, Cola_NavItemHeight);
    [self.rightNavBarButton addTarget:self action:@selector(rightNavBarButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view bringSubviewToFront:self.rightNavBarButton];
}
- (void)setRightNavImageView:(UIImageView*)imageView
{
    [self setRightNavImage:imageView.image];
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                     返回上一级ViewController                 //////////////////
//////////////////                     返回根视图ViewController                 //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)popToLastViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)popToRootViewController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                   自定义导航栏单按钮点击事件                 //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)leftNavBarButtonAction:(UIButton*)sender
{
    NSLog(@"子类未实现导航栏左侧单按钮的点击事件");
}
- (void)rightNavBarButtonAction:(UIButton *)sender
{
    NSLog(@"子类未实现导航栏右侧单按钮的点击事件");
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
- (UIButton*)leftNavBarButton
{
    if (!_leftNavBarButton) {
        _leftNavBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftNavBarButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.view addSubview:_leftNavBarButton];
    }
    return _leftNavBarButton;
}
- (UIButton*)rightNavBarButton
{
    if (!_rightNavBarButton) {
        _rightNavBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightNavBarButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [self.view addSubview:_rightNavBarButton];
    }
    return _rightNavBarButton;
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
