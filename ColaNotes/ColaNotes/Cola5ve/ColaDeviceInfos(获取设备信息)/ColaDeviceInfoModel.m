//
//  ColaDeviceInfoModel.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaDeviceInfoModel.h"
#import "ColaDeviceInfo.h"
#import "ColaDeviceConst.h"

@implementation ColaDeviceInfoModel

#pragma mark -
#pragma mark - 获取设备的全部信息
+ (NSArray*)currentDeviceInfos
{
    NSMutableArray *deviceArray = [NSMutableArray arrayWithCapacity:0];
    NSArray *array = @[
                       ColaString(@"手机型号: %@",[ColaDeviceInfo deviceModelString]),
                       ColaString(@"设备名称: %@",[ColaDeviceInfo deviceName]),
                       ColaString(@"设备UUID: %@",[ColaDeviceInfo deviceUUID]),
                       ColaString(@"系统名称: %@",[ColaDeviceInfo deviceSystemName]),
                       ColaString(@"系统版本: %@",[ColaDeviceInfo deviceSystemVersion]),
                       ColaString(@"设备类别: %@",[ColaDeviceInfo deviceModel]),
                       ColaString(@"设备本地化信息: %@",[ColaDeviceInfo deviceLocalInfo]),
                       ColaString(@"App应用名称: %@",[ColaDeviceInfo appName]),
                       ColaString(@"App应用版本号: %@",[ColaDeviceInfo appVersion]),
                       ColaString(@"App应用的build版本号: %@",[ColaDeviceInfo appBuildVersion]),
                       ColaString(@"设备选中的国家: %@",[ColaDeviceInfo deviceSelectCountry]),
                       ColaString(@"运行商的名称: %@",[ColaDeviceInfo deviceNetName]),
                       ColaString(@"iOS7以后获取当前网络类型: %@",[ColaDeviceInfo deviceConnectType]),
                       ColaString(@"iOS6以上获取设备电池电量等级: %d",[ColaDeviceInfo deviceBatteryLevel]),
                       ColaString(@"设备是否越狱: %d",[ColaDeviceInfo deviceJailBreakStatus]),
                       ColaString(@"CPU型号: %@",[ColaDeviceInfo deviceCPUType]),
                       ColaString(@"CPU频率: %@",[ColaDeviceInfo deviceCPUFrequency]),
                       ColaString(@"设备CPU内核数: %lu",[ColaDeviceInfo deviceCPUCoreCount]),
                       ColaString(@"CPU使用率: %f",[ColaDeviceInfo deviceCPUUsage]),
                       ColaString(@"设备内存总量，返回字节数: %lu",[ColaDeviceInfo deviceMemoryBytes]),
                       ColaString(@"设备可用内存量，返回字节数: %lu",[ColaDeviceInfo deviceFreeMemoeryBytes]),
                       ColaString(@"手机硬盘空闲空间，返回的是字节数: %lld",[ColaDeviceInfo deviceFreeDiskSpaceBytes]),
                       ColaString(@"手机硬盘总空间，返回的是字节数: %lld",[ColaDeviceInfo deviceDiskSpaceBytes]),
                       ColaString(@"设备是否支持蓝牙: %d",[ColaDeviceInfo deviceBluetoothStatus]),
                       ColaString(@"当前任务所占内存，返回MB: %f",[ColaDeviceInfo deviceCurrentUseMemoery]),
                       ColaString(@"设备广告位标识符: %@",[ColaDeviceInfo deviceIDFA]),
                       ColaString(@"设备IP地址: %@",[ColaDeviceInfo deviceIPAddr])
                       ];
    for (NSString *string in array) {
        ColaDeviceInfoModel *model = [ColaDeviceInfoModel new];
        model.deviceInfo = [NSString stringWithFormat:@"%@",string];
        [deviceArray addObject:model];
    }
    return deviceArray;
}

@end
