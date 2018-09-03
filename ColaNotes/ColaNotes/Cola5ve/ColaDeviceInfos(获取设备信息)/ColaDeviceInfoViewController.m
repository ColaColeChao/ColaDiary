//
//  ColaDeviceInfoViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaDeviceInfoViewController.h"
#import "ColaDeviceInfoCell.h"
#import "ColaDeviceInfoModel.h"

@interface ColaDeviceInfoViewController ()

@end

@implementation ColaDeviceInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"设备基本信息"];
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundColor:ColaHex(0xCB89DE)];
    self.hasPullDownRefresh = YES;
    
    self.listTable.frame = CGRectMake(0, self.originalY, Cola_Width, self.subViewheight);
    [self.listTableData removeAllObjects];
    [self.listTableData addObjectsFromArray:[ColaDeviceInfoModel currentDeviceInfos]];
    [self.listTable reloadData];
}

- (void)requestListData
{
    [self.listTableData removeAllObjects];
    [self.listTableData addObjectsFromArray:[ColaDeviceInfoModel currentDeviceInfos]];
    [self tableEndLoading];
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
    ColaDeviceInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ColaIdentifiers(ColaDeviceInfoCell)];
    if (!cell) {
        cell = [[ColaDeviceInfoCell alloc] initWithReuseIdentifier:ColaIdentifiers(ColaDeviceInfoCell)];
    }
    [cell loadCellData:self.listTableData[indexPath.row]];
    return cell;
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
