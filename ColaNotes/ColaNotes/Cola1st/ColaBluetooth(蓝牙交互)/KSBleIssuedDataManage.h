//
//  KSBleIssuedDataManage.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN  

@interface KSBleIssuedDataManage : NSObject

/**
 获取蓝牙下发的全部数据NSData
 @param order 下发的指令Int类型
 @param content 数据内容（字符串 或者 NSDictionary）
 @return 下发的完整数据NSData
 */
+ (NSData*)manageIssuedDataWithOrder:(int)order content:(id)content;

/**
 获取下发的包头数据NSData
 包头固定为：COLD
 @return 包头NSData
 */
+ (NSData*)packageHeaderData;

/**
 获取下发指令的NSData
 @param order 指令Int类型
 @return 指令的NSData
 */
+ (NSData*)packageOrder:(int)order;

/**
 获取下发参数的NSData
 格式为 NSString 或者 NSDictionary
 @param content 下发的数据内容
 @return 数据内容的NSData
 */
+ (NSData*)packageContent:(id)content;

/**
 获取数据长度的NSData
 数据长度 = 指令NSData长度 + 数据内容NSData长度 + 4位校验码
 @param orderLength 指令NSData长度
 @param contentLength 数据内容NSData长度
 @return 数据长度的NSData
 */
+ (NSData*)packageLengthOrderLength:(NSUInteger)orderLength contentLength:(NSUInteger)contentLength;

/**
 获取待发送数据的哈希校验码，取前4位
 校验码 = SHA256(包头 + 数据长度 + 指令码 + 数据内容) 的前四个字节
 @param data 待发送的数据
 @return 4位哈希校验吗
 */
+ (NSData*)packageSHA256Range:(NSData*)data;

@end

NS_ASSUME_NONNULL_END
