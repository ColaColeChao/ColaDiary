//
//  KSBleMonitorModel.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "KSBleMonitorModel.h"

@implementation KSBleMonitorModel

+ (instancetype)initBleMonitorData:(id)data
{
    KSBleMonitorModel *model = [KSBleMonitorModel new];
    [model initBleBaseModel:data];
    if (model.resultBool) {
        //   返回的是正确的数据且格式正确
        //NSArray *dataArray = [NSArray arrayWithArray:data[@"payload"]];
    }
    return model;
}

@end
