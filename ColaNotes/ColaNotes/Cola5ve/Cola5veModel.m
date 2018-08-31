//
//  Cola5veModel.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "Cola5veModel.h"

@implementation Cola5veModel

#pragma mark -
#pragma mark - 获取5ve的ViewController列表数据源
+ (NSArray*)fiveTableListData
{
    NSMutableArray *fiveArray = [NSMutableArray arrayWithCapacity:0];
    Cola5veModel *model1 = [Cola5veModel new];
    model1.title = @"获取设备基本信息";
    model1.icon = @"cola_5ve_device_info";
    [fiveArray addObject:model1];
    Cola5veModel *model2 = [Cola5veModel new];
    model2.title = @"炸开特效";
    model2.icon = @"cola_5ve_click_bomb";
    [fiveArray addObject:model2];
    return fiveArray;
}
@end
