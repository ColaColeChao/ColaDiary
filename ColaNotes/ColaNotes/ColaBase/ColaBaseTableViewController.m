//
//  ColaBaseTableViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/30.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBaseTableViewController.h"

@interface ColaBaseTableViewController ()

@end

@implementation ColaBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                           对象懒加载部分                           //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (NSMutableArray*)listTableData
{
    if (!_listTableData) {
        _listTableData = [NSMutableArray arrayWithCapacity:0];
    }
    return _listTableData;
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
