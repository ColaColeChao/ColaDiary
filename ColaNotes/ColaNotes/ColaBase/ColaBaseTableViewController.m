//
//  ColaBaseTableViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/30.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBaseTableViewController.h"
#import "MJRefresh.h"
#import "ColaTableHeadRefresh.h"
#import "ColaTableFootMore.h"

@interface ColaBaseTableViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@end

@implementation ColaBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (@available(iOS 11.0, *)) {
        self.listTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    //  当前列表请求的分页数，默认为1
    _currentPage = 1;
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////         UITableView添加下拉刷新和上拉加载动画         //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)setHasPullDownRefresh:(BOOL)hasPullDownRefresh
{
    _hasPullDownRefresh = hasPullDownRefresh;
    if (hasPullDownRefresh) {
        ColaTableHeadRefresh *refreshHeader = [ColaTableHeadRefresh headerWithRefreshingTarget:self refreshingAction:@selector(pullDownRefreshData)];
        _listTable.mj_header = refreshHeader;
    } else {
        _listTable.mj_header = nil;
    }
}
- (void)setHasPullUpLoadMore:(BOOL)hasPullUpLoadMore
{
    _hasPullUpLoadMore = hasPullUpLoadMore;
    if (hasPullUpLoadMore) {
        ColaTableFootMore *moreFooter = [ColaTableFootMore footerWithRefreshingTarget:self refreshingAction:@selector(pullUpMoreData)];
        _listTable.mj_footer = moreFooter;
    } else {
        _listTable.mj_footer = nil;
    }
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////               下拉刷新/上拉加载/数据请求方法               //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)pullDownRefreshData
{
    _currentPage = 1;
    _pullStatus = ColaBaseTablePullStatusRefresh;
    [_listTable.mj_footer resetNoMoreData];
    [self requestListData];
}
- (void)pullUpMoreData
{
    _currentPage++;
    _pullStatus = ColaBaseTablePullStatusMoreData;
    [self requestListData];
}
- (void)requestListData
{
    NSLog(@"子类未实现列表数据获取方法");
}

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            列表停止加载：停止列表上拉/下载动画           //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
- (void)tableEndLoading
{
    [_listTable.mj_footer endRefreshing];
    [_listTable.mj_header endRefreshing];
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
- (UITableView*)listTable
{
    if (!_listTable) {
        _listTable = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _listTable.delegate = self;
        _listTable.dataSource = self;
        _listTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTable.backgroundColor = [UIColor whiteColor];
        _listTable.userInteractionEnabled = YES;
        _listTable.showsVerticalScrollIndicator = NO;
        _listTable.showsHorizontalScrollIndicator = NO;
        [self.view addSubview:_listTable];
    }
    return _listTable;
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
