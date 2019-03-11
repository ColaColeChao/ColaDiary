//
//  KSBleModelManage.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/18.
//  Copyright © 2018 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSBleModelManage : NSObject

/**
 根据指令类型把数据转换成对应的Model
 仅用于接收B1设备返回的数据
 @param data 数据内容
 @param orderInt 指令
 @return 对应数据的Model
 */
+ (id)convertDataToModelWithData:(id)data orderInt:(int)orderInt;

@end

NS_ASSUME_NONNULL_END
