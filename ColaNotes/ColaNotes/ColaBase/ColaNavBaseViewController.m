//
//  ColaNavBaseViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/21.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaNavBaseViewController.h"

@interface ColaNavBaseViewController ()

@end

@implementation ColaNavBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.interactivePopGestureRecognizer.delegate = (id)self;
    //  设置系统导航栏底部默认的黑线，设置一个空的UIImage来取消黑线的显示
    [self.navigationBar setShadowImage:[UIImage new]];
    //  隐藏系统的导航栏，直接不带动画的隐藏
    [self setNavigationBarHidden:YES animated:NO];
    //  ios7以后是全屏布局，防止UITableView延伸到UINavigationBar下面，默认值为UIRectEdgeAll
    self.edgesForExtendedLayout = UIRectEdgeNone;
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
