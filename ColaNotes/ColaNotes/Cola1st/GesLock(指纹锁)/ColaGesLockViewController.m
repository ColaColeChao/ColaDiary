//
//  ColaGesLockViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/12/8.
//  Copyright © 2018 可乐超. All rights reserved.
//

#import "ColaGesLockViewController.h"
#import "ColaGesLockView.h"

@interface ColaGesLockViewController ()

@end

@implementation ColaGesLockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self hiddenNavTitle];
    
    ColaGesLockView *lockView= [[ColaGesLockView alloc] initWithFrame:CGRectMake(0, self.originalY, Cola_Width, Cola_Height - self.originalY) unlock:NO];
    [self.view addSubview:lockView];

}

#pragma mark -
#pragma mark - 绘制手势UI
- (void)initGesLockUI
{
    
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
