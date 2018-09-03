//
//  ColaSnowViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/3.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaSnowViewController.h"
#import "ColaSnowView.h"

@interface ColaSnowViewController ()

@end

@implementation ColaSnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"下雪效果"];
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundColor:ColaHex(0xCB89DE)];
    
    CGRect snowRect = CGRectMake(0, self.originalY, Cola_Width, self.subViewheight);
    ColaSnowView *snowView = [ColaSnowView snowViewWithSnowImageName:@"cola_snow" frame:snowRect];
    [self.view addSubview:snowView];
    
    [snowView beginSnow];
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
