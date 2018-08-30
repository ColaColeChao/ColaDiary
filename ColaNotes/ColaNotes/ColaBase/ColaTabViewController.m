//
//  ColaTabViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaTabViewController.h"
#import "Cola1stViewController.h"
#import "Cola2ndViewController.h"
#import "Cola3rdViewController.h"
#import "Cola4urViewController.h"
#import "Cola5veViewController.h"

@interface ColaTabViewController ()

/** 自定义UITabbar的背景 */
@property (nonatomic, strong) UIImageView *tabbarImageView;
/** 记录上一次点击的UITabbarButton */
@property (nonatomic, strong) UIButton *lastClickButton;

@end

@implementation ColaTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  初始化UITabbarControllers
    [self initTabbarControllers];
    
    //   自定义UITabbar的背景
    [self customTabbarBackgroundImageView];
    
    //  初始化UITabbarButtons
    [self initTabbarButtons];
}

#pragma mark -
#pragma mark - 自定义UITabbar的背景
- (void)customTabbarBackgroundImageView
{
    //  加载前，把self.tabbarImageView可能存在的所有子视图移除掉
    for (UIView *tmpView in self.tabbarImageView.subviews) {
        [tmpView removeFromSuperview];
    }
    self.tabbarImageView.frame = CGRectMake(0, 0, Cola_Width, 49);
}


#pragma mark -
#pragma mark - 初始化UITabbarControllers
- (void)initTabbarControllers
{
    //  1st ViewController
    Cola1stViewController *vc1st = [[Cola1stViewController alloc] init];
    ColaNavBaseViewController *nav1st = [[ColaNavBaseViewController alloc] initWithRootViewController:vc1st];
    //  2nd ViewController
    Cola2ndViewController *vc2st = [[Cola2ndViewController alloc] init];
    ColaNavBaseViewController *nav2st = [[ColaNavBaseViewController alloc] initWithRootViewController:vc2st];
    //  3rd ViewController
    Cola3rdViewController *vc3st = [[Cola3rdViewController alloc] init];
    ColaNavBaseViewController *nav3st = [[ColaNavBaseViewController alloc] initWithRootViewController:vc3st];
    //  4ur ViewController
    Cola4urViewController *vc4st = [[Cola4urViewController alloc] init];
    ColaNavBaseViewController *nav4st = [[ColaNavBaseViewController alloc] initWithRootViewController:vc4st];
    //  5ve ViewController
    Cola5veViewController *vc5st = [[Cola5veViewController alloc] init];
    ColaNavBaseViewController *nav5st = [[ColaNavBaseViewController alloc] initWithRootViewController:vc5st];
    self.viewControllers = @[nav1st, nav2st, nav3st, nav4st, nav5st];
}

#pragma mark -
#pragma mark - 初始化UITabbarButtons
- (void)initTabbarButtons
{
    NSArray *btnNormalIcons = @[@"cola_tabbar_n_nor",@"cola_tabbar_o_nor",@"cola_tabbar_t_nor",@"cola_tabbar_e_nor",@"cola_tabbar_s_nor"];
    NSArray *btnSelectIcons = @[@"cola_tabbar_n_sel",@"cola_tabbar_o_sel",@"cola_tabbar_t_sel",@"cola_tabbar_e_sel",@"cola_tabbar_s_sel"];
    NSArray *btnTitles = @[@"n",@"o",@"t",@"e",@"s"];
    int i=0;
    for (NSString *title in btnTitles) {
        UIImage *selImage = [UIImage imageNamed:btnSelectIcons[i]];
        UIImage *norImage = [UIImage imageNamed:btnNormalIcons[i]];
        UIColor *norColor = ColaHex(0xdddddd);
        UIColor *selColor = ColaHex(0x89B9DE);
        UIButton *button = [UIButton buttonWithTitle:title norTxtColor:norColor selTxtColor:selColor txtFont:[UIFont boldSystemFontOfSize:10.f] norImage:norImage selImage:selImage target:self action:@selector(tabbarButtonClickAction:)];
        button.frame = CGRectMake(Cola_Width*.2*i, 0, Cola_Width*.2, 49);
        [button setImagePosition:ButtonImagePositionTop spacing:2.f];
        button.tag = i;
        [self.tabbarImageView addSubview:button];
        if (0 == i) {
            button.selected = YES;
            self.selectedIndex = i;
            _lastClickButton = button;
        } else {
            button.selected = NO;
        }
        i++;
    }
}

#pragma mark -
#pragma mark - UITabbarButton点击事件
- (void)tabbarButtonClickAction:(UIButton*)sender
{
    if (sender.tag == _lastClickButton.tag) {
        return;
    }
    sender.selected = YES;
    self.selectedIndex = sender.tag;
    _lastClickButton.selected = NO;
    _lastClickButton = sender;
}

#pragma mark -
#pragma mark - 懒加载部分
- (UIImageView*)tabbarImageView
{
    if (!_tabbarImageView) {
        _tabbarImageView = [UIImageView new];
        _tabbarImageView.backgroundColor = [UIColor whiteColor];
        _tabbarImageView.userInteractionEnabled = YES;
        [self.tabBar addSubview:_tabbarImageView];
    }
    return _tabbarImageView;
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
