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

@end

@implementation ColaTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  初始化UITabbarControllers
    [self initTabbarControllers];
    
    //  初始化UITabbarButtons
    [self initTabbarButtons];
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
    self.tabBarController.viewControllers = @[nav1st, nav2st, nav3st, nav4st, nav5st];
}

#pragma mark -
#pragma mark - 初始化UITabbarButtons
- (void)initTabbarButtons
{
    NSArray *btnNormalIcons = @[@"",@"",@"",@"",@""];
    NSArray *btnSelectIcons = @[@"",@"",@"",@"",@""];
    NSArray *btnTitles = @[@"",@"",@"",@"",@""];
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
