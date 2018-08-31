//
//  ColaDeviceInfo.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColaDeviceConst.h"

@interface ColaDeviceInfo : NSObject

/** 获取手机型号（字符串） */
+ (NSString*)deviceModelString;
/** 获取手机型号（枚举） */
+ (UIDeviceModel)deviceModelEnum;
/** 获取设备名称 */
+ (NSString*)deviceName;
/** 获取设备UUID */
+ (NSString*)deviceUUID;
/** 获取系统名称 */
+ (NSString*)deviceSystemName;
/** 获取系统版本 */
+ (NSString*)deviceSystemVersion;
/** 获取设备类别 */
+ (NSString*)deviceModel;
/** 获取设备本地化信息 */
+ (NSString*)deviceLocalInfo;
/** 获取App相关信息 */
+ (NSDictionary*)appAboutInfo;
/** 获取App应用名称 */
+ (NSString*)appName;
/** 获取App应用版本号 */
+ (NSString*)appVersion;
/** 获取App应用的build版本号 */
+ (NSString*)appBuildVersion;
/** 获取设备选中的国家 */
+ (NSString*)deviceSelectCountry;
/** 获取运行商的名称 */
+ (NSString*)deviceNetName;
/** iOS7以后获取当前网络类型 */
+ (NSString*)deviceConnectType;
/** 判断设备是否越狱 */
+ (BOOL)deviceJailBreakStatus;
/** iOS6以上获取设备电池电量等级 */
+ (int)deviceBatteryLevel;
/** 获取CPU型号 */
+ (NSString*)deviceCPUType;
/** 获取CPU频率 */
+ (NSString*)deviceCPUFrequency;
/** 获取设备CPU内核数 */
+ (NSUInteger)deviceCPUCoreCount;
/** 获取CPU使用率 */
+ (float)deviceCPUUsage;
/** 获取设备内存总量，返回字节数 */
+ (NSUInteger)deviceMemoryBytes;
/** 获取设备可用内存量，返回字节数 */
+ (NSUInteger)deviceFreeMemoeryBytes;
/** 获取手机硬盘空闲空间，返回的是字节数 */
+ (long long)deviceFreeDiskSpaceBytes;
/** 获取手机硬盘总空间，返回的是字节数 */
+ (long long)deviceDiskSpaceBytes;
/** 判断设备是否支持蓝牙 */
+ (BOOL)deviceBluetoothStatus;
/** 获取当前任务所占内存，返回MB */
+ (double)deviceCurrentUseMemoery;
/** 获取设备广告位标识符 */
+ (NSString*)deviceIDFA;
/** 获取设备MAC地址 */
+ (NSString*)deviceMacAddr;
/** 获取设备IP地址 */
+ (NSString*)deviceIPAddr;

+ (void)logDeviceAllInfo;

@end
