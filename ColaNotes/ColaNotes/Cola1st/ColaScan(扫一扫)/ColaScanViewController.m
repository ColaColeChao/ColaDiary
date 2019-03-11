//
//  ColaScanViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/10.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaScanViewController.h"
#import "ColaShareInstance.h"

@interface ColaScanViewController ()

@end

@implementation ColaScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  隐藏导航栏和导航栏标题
    [self hiddenNavTitle];
    
    [[ColaShareInstance shareInstance] setaaaaaaaaaaaaaaa];
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
