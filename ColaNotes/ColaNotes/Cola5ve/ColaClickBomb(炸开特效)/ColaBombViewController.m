//
//  ColaBombViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBombViewController.h"
#import "ColaBombImageView.h"
#import "UIImageView+Bomb.h"

@interface ColaBombViewController ()

@end

@implementation ColaBombViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //  设置导航栏标题
    [self setNavTitle:@"炸开特效"];
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundColor:ColaHex(0xCB89DE)];
    
    for (int i=0; i<3; i++) {
        ColaBombImageView *bombImageView = [[ColaBombImageView alloc] initWithFrame:[self randomRect]];
        bombImageView.userInteractionEnabled = YES;
        [self.view addSubview:bombImageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageViewBomb:)];
        [bombImageView addGestureRecognizer:tap];
    }
    
//    [ColaHubLoading showLoading];
//    [ColaHubLoading showCoverLoading];
//    [ColaHubLoading showCoverWindowLoading];
//
//    [ColaHubLoading showMessage:@"1111111"];
//    [ColaHubLoading showCoverMessage:@"2222222"];
//    [ColaHubLoading showCoverWindowMessage:@"33333333"];

    [ColaHubLoading showLoadingDelay:5];
//    [ColaHubLoading showCoverLoadingDelay:5];
//    [ColaHubLoading showCoverWindowLoadingDelay:5];
}

#pragma mark -
#pragma mark - UIImageView点击炸开
- (void)tapImageViewBomb:(UITapGestureRecognizer*)tap
{
    UIImageView *imageView = (UIImageView*)tap.view;
    [imageView bombomb];
    [imageView removeFromSuperview];
    
    ColaBombImageView *bombImageView = [[ColaBombImageView alloc] initWithFrame:[self randomRect]];
    bombImageView.userInteractionEnabled = YES;
    [self.view addSubview:bombImageView];
    UITapGestureRecognizer *randomTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageViewBomb:)];
    [bombImageView addGestureRecognizer:randomTap];
}

#pragma mark -
#pragma mark - 生成随机坐标
- (CGRect)randomRect
{
    int height = self.view.frame.size.height - self.originalY - 100;
    int y = self.originalY +  (arc4random() % height);
    int x = arc4random() % (int) (self.view.frame.size.width-100);
    return CGRectMake(x, y, 100, 100);
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
