//
//  Cola5veViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "Cola5veViewController.h"
#import "Cola5veCell.h"
#import "Cola5veModel.h"
#import "ColaDeviceInfoViewController.h"
#import "ColaBombViewController.h"

@interface Cola5veViewController ()

@end

@implementation Cola5veViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"5ve"];
    
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundColor:ColaHex(0xCB89DE)];
    //  设置UITableView的frame值，不设置则为默认的CGRectZero
    self.listTable.frame = CGRectMake(0, self.originalY, Cola_Width, self.mainViewHeight);
    
    [self setTableViewDataSource];
    [self.listTable reloadData];
}

#pragma mark -
#pragma mark - 设置列表数据源
- (void)setTableViewDataSource
{
    [self.listTableData removeAllObjects];
    [self.listTableData addObjectsFromArray:[Cola5veModel fiveTableListData]];
}

#pragma mark -
#pragma mark - UITableView的代理方法及数据源代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listTableData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cola5veCell *cell = [tableView dequeueReusableCellWithIdentifier:ColaIdentifiers(Cola5veCell)];
    if (!cell) {
        cell = [[Cola5veCell alloc] initWithReuseIdentifier:ColaIdentifiers(Cola5veCell)];
    }
    [cell loadCellData:self.listTableData[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            ColaDeviceInfoViewController *deviceInfoVc = [[ColaDeviceInfoViewController alloc] init];
            [self.navigationController pushViewController:deviceInfoVc animated:YES];
        }
            break;
        case 1:
        {
            ColaBombViewController *bombVc = [[ColaBombViewController alloc] init];
            [self.navigationController pushViewController:bombVc animated:YES];
        }
            break;
        default:
            break;
    }
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
