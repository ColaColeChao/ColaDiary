//
//  Cola4urViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "Cola4urViewController.h"
#import "Cola4urModel.h"
#import "Cola4urCell.h"
#import "ColaAlbumViewController.h"

@interface Cola4urViewController ()

@end

@implementation Cola4urViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"4ur"];
    
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundStartColor:ColaHex(0xB9E9CE) endColor:ColaHex(0xBDE7DA)];
    
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
    [self.listTableData addObjectsFromArray:[Cola4urModel fourTableListData]];
}

#pragma mark -
#pragma mark - UITableView的代理方法及数据源代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listTableData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.f;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cola4urCell *cell = [tableView dequeueReusableCellWithIdentifier:ColaIdentifiers(Cola4urCell)];
    if (!cell) {
        cell = [[Cola4urCell alloc] initWithReuseIdentifier:ColaIdentifiers(Cola4urCell)];
    }
    [cell loadCellData:self.listTableData[indexPath.row]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            {
                ColaAlbumViewController *albumVc = [[ColaAlbumViewController alloc] init];
                [self.navigationController pushViewController:albumVc animated:YES];
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
