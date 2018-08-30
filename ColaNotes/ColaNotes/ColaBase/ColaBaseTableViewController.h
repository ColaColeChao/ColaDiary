//
//  ColaBaseTableViewController.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/30.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBaseViewController.h"

@interface ColaBaseTableViewController : ColaBaseViewController

/** 公用UITableView */
@property (nonatomic, strong) UITableView *listTable;
/** 公用UITableView的数据源（可变数组） */
@property (nonatomic, strong) NSMutableArray *listTableData;
/** 当前列表请求的分页数，默认为1 */
@property (nonatomic, assign) int currentPage;


/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                       UITableViewDelegate                     //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;  //  设置列表有多少个分区
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;  //  设置每个分区的sectionView的高度
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;    //  自定义每个分区sectionView的自定义UIView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath; //  设置每个cell的行高
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;   //  设置分区section中的cell个数

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                     UITableViewDataSource                   //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;  //  加载自定义Cell中的内容
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;    //  UITableViewCell的点击事件

@end
