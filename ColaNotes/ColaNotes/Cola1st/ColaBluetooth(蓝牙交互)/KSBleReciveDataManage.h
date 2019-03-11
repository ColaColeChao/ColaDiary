//
//  KSBleReciveDataManage.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSBleReciveDataManage : NSObject

/**
 校验蓝牙设备返回的数据包包头是否是COLD
 @param data 蓝牙设备返回的数据NSData
 @return 数据包包头是否是COLD
 */
+ (BOOL)checkPackageHeaderData:(NSData*)data;

/**
 校验蓝牙设备返回的数据SHA256的值是否正确
 校验码 = SHA256(包头 + 数据长度 + 指令码 + 数据内容) 的前四个字节
 @param data 蓝牙设备返回的数据NSData
 @return SHA256的值是否正确
 */
+ (BOOL)checkPackageHash:(NSData*)data;

/**
 解析蓝牙设备返回的数据长度
 数据长度 = 指令NSData长度 + 数据内容NSData长度 + 4位校验码
 @param data 蓝牙设备返回的数据NSData
 @return 数据长度
 */
+ (int)parsePackageDataLength:(NSData*)data;

/**
 解析蓝牙设备返回的数据指令码
 @param data 蓝牙设备返回的数据NSData
 @return 数据指令码
 */
+ (int)parsePackageOrder:(NSData*)data;

/**
 解析蓝牙设备返回的数据内容
 @param data 蓝牙设备返回的数据NSData
 @return 解析后的数据内容
 */
+ (id)parsePackageContent:(NSData*)data;

@end

NS_ASSUME_NONNULL_END
