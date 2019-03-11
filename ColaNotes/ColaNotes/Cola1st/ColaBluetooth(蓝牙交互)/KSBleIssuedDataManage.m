//
//  KSBleIssuedDataManage.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "KSBleIssuedDataManage.h"
#import "KSBleConvertTool.h"
#import "KSBleConstDefine.h"

@implementation KSBleIssuedDataManage

/**
 获取蓝牙下发的全部数据NSData
 @param order 下发的指令Int类型
 @param content 数据内容（字符串 或者 NSDictionary）
 @return 下发的完整数据NSData
 */
+ (NSData*)manageIssuedDataWithOrder:(int)order content:(id)content
{
    //  1. 下发包头NSData
    NSData *headerData = [KSBleIssuedDataManage packageHeaderData];
    //  2. 下发指令NSData
    NSData *orderData = [KSBleIssuedDataManage packageOrder:order];
    //  3.  下发的数据内容NSData
    NSData *contentData = [KSBleIssuedDataManage packageContent:content];
    //  4.   下发的数据长度NSData
    NSData *lengthData = [KSBleIssuedDataManage packageLengthOrderLength:orderData.length contentLength:contentData.length];
    //  5.   拼接包头NSData + 长度NSData + 指令NSData + 内容NSData，用来获取SHA256d值
    NSMutableData *muData = [NSMutableData data];
    [muData appendData:headerData];
    [muData appendData:lengthData];
    [muData appendData:orderData];
    [muData appendData:contentData];
    //  6.   获取SHA256后的前四位哈希值
    NSData *hashData = [KSBleIssuedDataManage packageSHA256Range:muData];
    //  7.   拼接校验数据，并返回
    [muData appendData:hashData];
    return muData;
}

/**
 获取下发的包头数据NSData
 包头固定为：COLD
 @return 包头NSData
 */
+ (NSData*)packageHeaderData
{
    NSString *headerString = BLE_PACKAGE_HEADER;
    NSString *headerHexString = [KSBleConvertTool convertStringToHexString:headerString];
    return [KSBleConvertTool convertHexStringToData:headerHexString];
}

/**
 获取下发指令的NSData
 @param order 指令Int类型
 @return 指令的NSData
 */
+ (NSData*)packageOrder:(int)order
{
    NSString *orderHexString = [KSBleConvertTool convertIntToHexString:order];
    return [KSBleConvertTool convertHexStringToData:orderHexString];
}

/**
 获取下发参数的NSData
 格式为 NSString 或者 NSDictionary
 @param content 下发的数据内容
 @return 数据内容的NSData
 */
+ (NSData*)packageContent:(id)content
{
    NSString *contentString = [NSString stringWithFormat:@"%@",content];
    if ([content isKindOfClass:[NSDictionary class]]) {
        contentString = [content mj_JSONString];
    }
    NSString *contentHexString = [KSBleConvertTool convertStringToHexString:contentString];
    return [KSBleConvertTool convertHexStringToData:contentHexString];
}

/**
 获取数据长度的NSData
 数据长度 = 指令NSData长度 + 数据内容NSData长度 + 4位校验码
 @param orderLength 指令NSData长度
 @param contentLength 数据内容NSData长度
 @return 数据长度的NSData
 */
+ (NSData*)packageLengthOrderLength:(NSUInteger)orderLength contentLength:(NSUInteger)contentLength
{
    int hexNumber = (int)(orderLength + contentLength + 4);
    NSMutableData *lengthData = [NSMutableData data];
    Byte byte1[] = {0xFF & (hexNumber)};
    Byte byte2[] = {0xFF & (hexNumber >> 8)};
    Byte byte3[] = {0xFF & (hexNumber >> 16)};
    Byte byte4[] = {0xFF & (hexNumber >> 24)};
    [lengthData appendBytes:byte4 length:1];
    [lengthData appendBytes:byte3 length:1];
    [lengthData appendBytes:byte2 length:1];
    [lengthData appendBytes:byte1 length:1];
    return lengthData;
}

/**
 获取待发送数据的哈希校验码，取前4位
 校验码 = SHA256(包头 + 数据长度 + 指令码 + 数据内容) 的前四个字节
 @param data 待发送的数据
 @return 4位哈希校验吗
 */
+ (NSData*)packageSHA256Range:(NSData*)data
{
    NSMutableData *muData = [NSMutableData dataWithData:[KSBleConvertTool dataHash256:data]];
    if (muData.length >= 4) {
        return [muData subdataWithRange:NSMakeRange(0, 4)];
    }
    return muData;
}

@end
