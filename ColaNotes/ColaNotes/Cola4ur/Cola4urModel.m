//
//  Cola4urModel.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/3.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "Cola4urModel.h"

@implementation Cola4urModel

#pragma mark -
#pragma mark - 获取4ur的ViewController列表数据源
+ (NSArray*)fourTableListData
{
    NSMutableArray *fourArray = [NSMutableArray arrayWithCapacity:0];
    Cola4urModel *model1 = [Cola4urModel new];
    model1.title = @"获取全部照片";
    model1.subTitle = @"共xx张照片";
    model1.icon = @"cola_4ur_photos";
    [fourArray addObject:model1];
    return fourArray;
}

@end
