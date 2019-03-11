
//
//  KSBleReciveDataManage.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "KSBleReciveDataManage.h"
#import "KSBleConvertTool.h"
#import "KSBleConstDefine.h"


@implementation KSBleReciveDataManage

/**
 校验蓝牙设备返回的数据包包头是否是COLD
 @param data 蓝牙设备返回的数据NSData
 @return 数据包包头是否是COLD
 */
+ (BOOL)checkPackageHeaderData:(NSData*)data
{
    if (data && [data length] >= 4) {
        NSMutableData *muData = [NSMutableData dataWithData:data];
        NSData *headerData = [muData subdataWithRange:NSMakeRange(0, 4)];
        NSString *hexHeaderString = [KSBleConvertTool convertDataToHexString:headerData];
        NSString *headerString = [KSBleConvertTool convertHexStringToString:hexHeaderString];
        return [headerString isEqualToString:BLE_PACKAGE_HEADER];
    }
    return NO;
}

/**
 校验蓝牙设备返回的数据SHA256的值是否正确
 校验码 = SHA256(包头 + 数据长度 + 指令码 + 数据内容) 的前四个字节
 @param data 蓝牙设备返回的数据NSData
 @return SHA256的值是否正确
 */
+ (BOOL)checkPackageHash:(NSData*)data
{
    NSMutableData *muData = [NSMutableData dataWithData:data];
    NSData *hashData = [muData subdataWithRange:NSMakeRange(0, data.length-4)];
    NSMutableData *mulocalHashData = [NSMutableData dataWithData:[KSBleConvertTool dataHash256:hashData]];
    NSData *reciveHashData = [muData subdataWithRange:NSMakeRange(data.length-4, 4)];
    if (mulocalHashData.length >= 4) {
        return [[mulocalHashData subdataWithRange:NSMakeRange(0, 4)] isEqualToData:reciveHashData];
    }
    return NO;
}

/**
 解析蓝牙设备返回的数据长度
 数据长度 = 指令NSData长度 + 数据内容NSData长度 + 4位校验码
 @param data 蓝牙设备返回的数据NSData
 @return 数据长度
 */
+ (int)parsePackageDataLength:(NSData*)data
{
    if (data && [data length] >= 8) {
        NSMutableData *muData = [NSMutableData dataWithData:data];
        NSData *lengthData = [muData subdataWithRange:NSMakeRange(4, 4)];
        NSString *hexLengthString = [KSBleConvertTool convertDataToHexString:lengthData];
        return [KSBleConvertTool convertHexStringToInt:hexLengthString];
    }
    return 0;
}

/**
 解析蓝牙设备返回的数据指令码
 @param data 蓝牙设备返回的数据NSData
 @return 数据指令码
 */
+ (int)parsePackageOrder:(NSData*)data
{
    if (data && [data length] >= 9) {
        NSMutableData *muData = [NSMutableData dataWithData:data];
        NSData *orderData = [muData subdataWithRange:NSMakeRange(8, 1)];
        NSString *hexOrderString = [KSBleConvertTool convertDataToHexString:orderData];
        return [KSBleConvertTool convertHexStringToInt:hexOrderString];
    }
    return 0;
}

/**
 解析蓝牙设备返回的数据内容
 @param data 蓝牙设备返回的数据NSData
 @return 解析后的数据内容
 */
+ (id)parsePackageContent:(NSData*)data
{
    int contentLength = [KSBleReciveDataManage parsePackageDataLength:data];
    NSMutableData *muData = [NSMutableData dataWithData:data];
    NSData *contentData = [muData subdataWithRange:NSMakeRange(9, contentLength-4-1)];
    NSString *hexContentString = [KSBleConvertTool convertDataToHexString:contentData];
    NSString *jsonString = [KSBleConvertTool convertHexStringToString:hexContentString];
    id contentDict = [jsonString mj_JSONObject];
    if (contentDict) {
        return contentDict;
    }
    return jsonString;
}

@end
