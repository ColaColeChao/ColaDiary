//
//  ColaAlbumViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/3.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaAlbumViewController.h"
#import <Photos/Photos.h>

@interface ColaAlbumViewController ()

@end

@implementation ColaAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"获取全部照片"];
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundStartColor:ColaHex(0xB9E9CE) endColor:ColaHex(0xBDE7DA)];
    
    [self setRightNavTitle:@"获取"];
    
    [self getPhoneAllPhotos];
}

#pragma mark -
#pragma mark - 获取手机全部照片+视频
- (void)getPhoneAllPhotos
{
    __Cola_weakSelf(weak);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
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
