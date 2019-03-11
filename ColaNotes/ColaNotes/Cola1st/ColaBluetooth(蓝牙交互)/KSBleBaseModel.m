//
//  KSBleBaseModel.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "KSBleBaseModel.h"

@implementation KSBleBaseModel

/** 初始化 */
- (void)initBleBaseModel:(id)data
{
    self.resultBool = NO;
    self.errorMessage = @"数据格式错误，解析失败";
    if (data && [data isKindOfClass:[NSDictionary class]]) {
        if ([[data allKeys] containsObject:@"success"]) {
            self.resultBool = [data[@"success"] boolValue];
        }
        if ([[data allKeys] containsObject:@"payload"]) {
            if ([data[@"payload"] isKindOfClass:[NSDictionary class]]) {
                NSDictionary *errDict = data[@"payload"];
                if ([errDict.allKeys containsObject:@"error"]) {
                    self.errorMessage = ColaString(@"%@",errDict[@"error"]);
                }
            } else if ([data[@"payload"] isKindOfClass:[NSArray class]]) {
                self.errorMessage = @"";
            }
        }
    }
}

@end
