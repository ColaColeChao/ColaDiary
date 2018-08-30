//
//  ColaBaseTableViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/30.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBaseTableViewController.h"

@interface ColaBaseTableViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@end

@implementation ColaBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  当前列表请求的分页数，默认为1
    _currentPage = 1;
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                       UITableViewDelegate                     //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return .0f;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return .0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                     UITableViewDataSource                   //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [ColaBaseTableViewCell new];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
