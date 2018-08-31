//
//  ColaBaseTableViewController.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/30.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBaseViewController.h"

typedef enum {
    ColaBaseTablePullStatusRefresh = 0, //  当前列表为下拉刷新状态
    ColaBaseTablePullStatusMoreData     //  当前列表为上拉加载状态
} ColaBaseTablePullStatus;

@interface ColaBaseTableViewController : ColaBaseViewController

/** 公用UITableView */
@property (nonatomic, strong) UITableView *listTable;
/** 公用UITableView的数据源（可变数组） */
@property (nonatomic, strong) NSMutableArray *listTableData;

/** 是否有下拉刷新：YES=添加下拉刷新，NO=移除下拉刷新 */
@property (nonatomic, assign) BOOL hasPullDownRefresh;
/** 是否有上拉加载：YES=添加上拉加载，NO=移除上拉加载 */
@property (nonatomic, assign) BOOL hasPullUpLoadMore;

/** 当前列表的上拉刷新/下拉加载的状态 */
@property (nonatomic, assign) ColaBaseTablePullStatus pullStatus;

/** 当前列表请求的分页数，默认为1 */
@property (nonatomic, assign) int currentPage;

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////               下拉刷新/上拉加载/数据请求方法               //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)requestListData;

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            列表停止加载：停止列表上拉/下载动画            /////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)tableEndLoading;


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
