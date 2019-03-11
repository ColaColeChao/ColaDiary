//
//  KSBleModelManage.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/18.
//  Copyright © 2018 可乐超. All rights reserved.
//

#import "KSBleModelManage.h"

@implementation KSBleModelManage

/**
 根据指令类型把数据转换成对应的Model
 仅用于接收B1设备返回的数据
 @param data 数据内容
 @param orderInt 指令
 @return 对应数据的Model
 */
+ (id)convertDataToModelWithData:(id)data orderInt:(int)orderInt
{
    switch (orderInt) {
        case 2:
            NSLog(@"Ping指令成功返回的数据，对应指令1");
            break;
        case 3:
            NSLog(@"Ping指令失败返回的数据，对应指令1");
            break;
        case 5:
            NSLog(@"获取监控地址指令返回的数据，对应指令4");
            break;
        case 7:
            NSLog(@"自定义钱包指令返回的数据，对应指令6");
            break;
        case 9:
            NSLog(@"校验钱包指令返回的数据，对应指令8");
            break;
        case 17:
            NSLog(@"获取设备完整信息指令返回的数据，对应指令55");
            break;
        case 12:
            NSLog(@"比特系列，获取比特系列一个或多个账户信息指令返回的数据，对应指令11");
            break;
        case 21:
            NSLog(@"比特系列，B1向热端索要签名数据的指令");
            break;
        case 30:
            NSLog(@"比特系列，获取一个或多个地址的路径指令返回的数据，对应指令29");
            break;
        case 40:
            NSLog(@"比特系列，签名消息/验证签名消息指令返回的数据，对应指令38、39");
            break;
        case 18:
            NSLog(@"比特系列，添加主链/修改主链指令返回的数据，对应指令16、17");
            break;
        case 57:
            NSLog(@"以太系列，获取一个或多个地址指令返回的数据，对应指令56");
            break;
        case 59:
            NSLog(@"以太系列，B1向热端索要签名数据的指令");
            break;
        case 66:
            NSLog(@"以太系列，签名消息/验证签名消息指令返回的数据，对应指令64、65");
            break;
        default:
            NSLog(@"其他未识别指令");
            break;
    }
    return nil;
}

@end
