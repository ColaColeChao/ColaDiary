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

@end
