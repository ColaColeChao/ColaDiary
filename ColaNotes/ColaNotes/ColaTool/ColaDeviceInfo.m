//
//  ColaDeviceInfo.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaDeviceInfo.h"
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import <mach/mach.h>
#import <mach/mach_host.h>
#import <sys/types.h>
#import <sys/param.h>
#import <sys/mount.h>
#include <objc/runtime.h>
#import <mach/processor_info.h>
#include <sys/stat.h>
#import <sys/sockio.h>
#import <sys/ioctl.h>
#import <arpa/inet.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <AdSupport/AdSupport.h>

@implementation ColaDeviceInfo

#pragma mark -
#pragma mark - 获取手机型号（字符串）
+ (NSString*)deviceModelString
{
    return [[self alloc] deviceModelString];
}
- (NSString*)deviceModelString
{
    switch ([self deviceModelEnum]) {
        case UIDeviceUnknown:  return DEVICE_UNKNOWN;
        case UIDeviceSimulator:  return SIMULATOR_DEVICE;
        case UIDeviceSimulatoriPhone:  return IPHONE_SIMULATOR_DEVICE;
        case UIDeviceSimulatoriPad:  return IPAD_SIMULATOR_DEVICE;
        case UIDeviceSimulatorAppleTV:  return APPLETV_SIMULATOR_DEVICE;
        case UIDeviceiPhone1G:  return IPHONE_1G_DEVICE;
        case UIDeviceiPhone3G:  return IPHONE_3G_DEVICE;
        case UIDeviceiPhone3GS:  return IPHONE_3GS_DEVICE;
        case UIDeviceiPhone4:  return IPHONE_4_DEVICE;
        case UIDeviceiPhone4S:  return IPHONE_4S_DEVICE;
        case UIDeviceiPhone5:  return IPHONE_5_DEVICE;
        case UIDeviceiPhone5C:  return IPHONE_5C_DEVICE;
        case UIDeviceiPhone5S:  return IPHONE_5S_DEVICE;
        case UIDeviceiPhone6:  return IPHONE_6_DEVICE;
        case UIDeviceiPhone6Plus:  return IPHONE_6Plus_DEVICE;
        case UIDeviceiPhone6S:  return IPHONE_6S_DEVICE;
        case UIDeviceiPhone6SPlus:  return IPHONE_6SPlus_DEVICE;
        case UIDeviceiPhone7:  return IPHONE_7_DEVICE;
        case UIDeviceiPhone7Plus:  return IPHONE_7Plus_DEVICE;
        case UIDeviceiPhone8:  return IPHONE_8_DEVICE;
        case UIDeviceiPhone8Plus:  return IPHONE_8Plus_DEVICE;
        case UIDeviceiPhoneX:  return IPHONE_X_DEVICE;
        case UIDeviceiPhoneSimulator32:  return IPHONE_SIMULATOR32_DEVICE;
        case UIDeviceiPhoneSimulator64:  return IPHONE_SIMULATOR64_DEVICE;
        case UIDeviceiPod1G:  return IPOD_1G_DEVICE;
        case UIDeviceiPod2G:  return IPOD_2G_DEVICE;
        case UIDeviceiPod3G:  return IPOD_3G_DEVICE;
        case UIDeviceiPod4G:  return IPOD_4G_DEVICE;
        case UIDeviceiPod5G:  return IPOD_5G_DEVICE;
        case UIDeviceiPod6G:  return IPOD_6G_DEVICE;
        case UIDeviceiPad1G:  return IPAD_1G_DEVICE;
        case UIDeviceiPad2G:  return IPAD_2G_DEVICE;
        case UIDeviceiPad3G:  return IPAD_3G_DEVICE;
        case UIDeviceiPad4G:  return IPAD_4G_DEVICE;
        case UIDeviceiPadAir1:  return IPADAIR_1G_DEVICE;
        case UIDeviceiPadAir2:  return IPADAIR_2G_DEVICE;
        case UIDeviceiPadmini1:  return IPADMINI_1G_DEVICE;
        case UIDeviceiPadmini2:  return IPADMINI_2G_DEVICE;
        case UIDeviceiPadmini3:  return IPADMINI_3G_DEVICE;
        case UIDeviceiPadmini4:  return IPADMINI_4G_DEVICE;
        case UIDeviceAppleTV2:  return APPLETV_2G_DEVICE;
        case UIDeviceAppleTV3:  return APPLETV_3G_DEVICE;
        case UIDeviceAppleTV4:  return APPLETV_4G_DEVICE;
        case UIDeviceUnknowniPhone:  return IPHONE_UNKNOWN_DEVICE;
        case UIDeviceUnknowniPod:  return IPOD_UNKNOWN_DEVICE;
        case UIDeviceUnknowniPad:  return IPAD_UNKNOWN_DEVICE;
        case UIDeviceUnknownAppleTV:  return APPLETV_UNKNOWN_DEVICE;
        case UIDeviceIFPGA:  return IFPGA_DEVICE;
        default: return DEVICE_UNKNOWN;
    }
}

#pragma mark -
#pragma mark - 获取手机型号（枚举）
+ (UIDeviceModel)deviceModelEnum
{
    return [[self alloc] deviceModelEnum];
}
- (UIDeviceModel)deviceModelEnum
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *answer = malloc(size);
    sysctlbyname("hw.machine", answer, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:answer encoding: NSUTF8StringEncoding];
    free(answer);
    if ([platform isEqualToString:@"iFPGA"])    return UIDeviceIFPGA;
    if ([platform isEqualToString:@"iPhone1,1"])    return UIDeviceiPhone1G;
    if ([platform isEqualToString:@"iPhone1,2"])    return UIDeviceiPhone3G;
    if ([platform hasPrefix:@"iPhone2"])    return UIDeviceiPhone3GS;
    if ([platform hasPrefix:@"iPhone3"])    return UIDeviceiPhone4;
    if ([platform hasPrefix:@"iPhone4"])    return UIDeviceiPhone4S;
    if ([platform isEqualToString:@"iPhone5,1"])    return UIDeviceiPhone5;
    if ([platform isEqualToString:@"iPhone5,2"])    return UIDeviceiPhone5;
    if ([platform isEqualToString:@"iPhone5,3"])    return UIDeviceiPhone5C;
    if ([platform isEqualToString:@"iPhone5,4"])    return UIDeviceiPhone5C;
    if ([platform isEqualToString:@"iPhone6,1"])    return UIDeviceiPhone5S;
    if ([platform isEqualToString:@"iPhone6,2"])    return UIDeviceiPhone5S;
    if ([platform isEqualToString:@"iPhone7,2"])    return UIDeviceiPhone6;
    if ([platform isEqualToString:@"iPhone7,1"])    return UIDeviceiPhone6Plus;
    if ([platform isEqualToString:@"iPhone8,1"])    return UIDeviceiPhone6S;
    if ([platform isEqualToString:@"iPhone8,2"])    return UIDeviceiPhone6SPlus;
    if ([platform isEqualToString:@"iPhone9,1"])    return UIDeviceiPhone7;
    if ([platform isEqualToString:@"iPhone9,2"])    return UIDeviceiPhone7Plus;
    if ([platform isEqualToString:@"iPhone9,3"])    return UIDeviceiPhone7;
    if ([platform isEqualToString:@"iPhone9,4"])    return UIDeviceiPhone7Plus;
    if ([platform isEqualToString:@"iPhone10,1"])   return UIDeviceiPhone8;
    if ([platform isEqualToString:@"iPhone10,4"])   return UIDeviceiPhone8;
    if ([platform isEqualToString:@"iPhone10,2"])   return UIDeviceiPhone8Plus;
    if ([platform isEqualToString:@"iPhone10,5"])   return UIDeviceiPhone8Plus;
    if ([platform isEqualToString:@"iPhone10,3"])   return UIDeviceiPhoneX;
    if ([platform isEqualToString:@"iPhone10,6"])   return UIDeviceiPhoneX;
    if ([platform isEqualToString:@"i386"]) return UIDeviceiPhoneSimulator32;
    if ([platform isEqualToString:@"x86_64"])   return UIDeviceiPhoneSimulator64;
    if ([platform hasPrefix:@"iPod1"])  return UIDeviceiPod1G;
    if ([platform hasPrefix:@"iPod2"])  return UIDeviceiPod2G;
    if ([platform hasPrefix:@"iPod3"])  return UIDeviceiPod3G;
    if ([platform hasPrefix:@"iPod4"])  return UIDeviceiPod4G;
    if ([platform hasPrefix:@"iPod5"])  return UIDeviceiPod5G;
    if ([platform hasPrefix:@"iPod7"])  return UIDeviceiPod6G;
    if ([platform isEqualToString:@"iPad1,1"])  return UIDeviceiPad1G;
    if ([platform isEqualToString:@"iPad2,1"])  return UIDeviceiPad2G;
    if ([platform isEqualToString:@"iPad2,2"])  return UIDeviceiPad2G;
    if ([platform isEqualToString:@"iPad2,3"])  return UIDeviceiPad2G;
    if ([platform isEqualToString:@"iPad2,4"])  return UIDeviceiPad2G;
    if ([platform isEqualToString:@"iPad3,1"])  return UIDeviceiPad3G;
    if ([platform isEqualToString:@"iPad3,2"])  return UIDeviceiPad3G;
    if ([platform isEqualToString:@"iPad3,3"])  return UIDeviceiPad3G;
    if ([platform isEqualToString:@"iPad3,4"])  return UIDeviceiPad4G;
    if ([platform isEqualToString:@"iPad3,5"])  return UIDeviceiPad4G;
    if ([platform isEqualToString:@"iPad3,6"])  return UIDeviceiPad4G;
    if ([platform isEqualToString:@"iPad4,1"])  return UIDeviceiPadAir1;
    if ([platform isEqualToString:@"iPad4,2"])  return UIDeviceiPadAir1;
    if ([platform isEqualToString:@"iPad4,3"])  return UIDeviceiPadAir1;
    if ([platform isEqualToString:@"iPad5,3"])  return UIDeviceiPadAir2;
    if ([platform isEqualToString:@"iPad5,4"])  return UIDeviceiPadAir2;
    if ([platform isEqualToString:@"iPad2,5"])  return UIDeviceiPadmini1;
    if ([platform isEqualToString:@"iPad2,6"])  return UIDeviceiPadmini1;
    if ([platform isEqualToString:@"iPad2,7"])  return UIDeviceiPadmini1;
    if ([platform isEqualToString:@"iPad4,4"])  return UIDeviceiPadmini2;
    if ([platform isEqualToString:@"iPad4,5"])  return UIDeviceiPadmini2;
    if ([platform isEqualToString:@"iPad4,6"])  return UIDeviceiPadmini2;
    if ([platform isEqualToString:@"iPad4,7"])  return UIDeviceiPadmini3;
    if ([platform isEqualToString:@"iPad4,8"])  return UIDeviceiPadmini3;
    if ([platform isEqualToString:@"iPad4,9"])  return UIDeviceiPadmini3;
    if ([platform isEqualToString:@"iPad5,1"])  return UIDeviceiPadmini4;
    if ([platform isEqualToString:@"iPad5,2"])  return UIDeviceiPadmini4;
    if ([platform hasPrefix:@"AppleTV2"])   return UIDeviceAppleTV2;
    if ([platform hasPrefix:@"AppleTV3"])   return UIDeviceAppleTV3;
    if ([platform hasPrefix:@"iPhone"]) return UIDeviceUnknowniPhone;
    if ([platform hasPrefix:@"iPod"])   return UIDeviceUnknowniPod;
    if ([platform hasPrefix:@"iPad"])   return UIDeviceUnknowniPad;
    if ([platform hasPrefix:@"AppleTV"])    return UIDeviceUnknownAppleTV;
    return UIDeviceUnknown;
}

#pragma mark -
#pragma mark - 获取设备名称
+ (NSString*)deviceName
{
    return [[UIDevice currentDevice] name];
}

#pragma mark -
#pragma mark - 获取设备UUID
+ (NSString*)deviceUUID
{
    //  设备UUID有可能带有 '-' 符号
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

#pragma mark -
#pragma mark - 获取系统名称
+ (NSString*)deviceSystemName
{
    return [[UIDevice currentDevice] systemName];
}

#pragma mark -
#pragma mark - 获取系统版本
+ (NSString*)deviceSystemVersion
{
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark -
#pragma mark - 获取设备类别
+ (NSString*)deviceModel
{
    return [[UIDevice currentDevice] model];
}

#pragma mark -
#pragma mark - 获取设备本地化信息
+ (NSString*)deviceLocalInfo
{
    return [[UIDevice currentDevice] localizedModel];
}

#pragma mark -
#pragma mark - 获取App相关信息
+ (NSDictionary*)appAboutInfo
{
    return [[NSBundle mainBundle] infoDictionary];;
}

#pragma mark -
#pragma mark - 获取App应用名称
+ (NSString*)appName
{
    return [[self appAboutInfo] objectForKey:@"CFBundleName"];
}

#pragma mark -
#pragma mark - 获取App应用版本号
+ (NSString*)appVersion
{
    return [[self appAboutInfo] objectForKey:@"CFBundleShortVersionString"];
}

#pragma mark -
#pragma mark - 获取App应用的build版本号
+ (NSString*)appBuildVersion
{
    return [[self appAboutInfo] objectForKey:@"CFBundleVersion"];
}

#pragma mark -
#pragma mark - 获取设备选中的国家
+ (NSString*)deviceSelectCountry
{
    NSLocale *locale = [NSLocale currentLocale];
    return [locale localeIdentifier];
}

#pragma mark -
#pragma mark - 获取运行商的名称
+ (NSString*)deviceNetName
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    return [NSString stringWithFormat:@"%@",[carrier carrierName]];
}

#pragma mark -
#pragma mark - iOS7以后获取当前网络类型
+ (NSString*)deviceConnectType
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    return [[NSString alloc] initWithFormat:@"%@",info.currentRadioAccessTechnology];
}

#pragma mark -
#pragma mark - 判断设备是否越狱
+ (BOOL)deviceJailBreakStatus
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        return YES;
    }
    return NO;
}

#pragma mark -
#pragma mark - iOS6以上获取设备电池电量等级
+ (int)deviceBatteryLevel
{
    UIApplication *app = [UIApplication sharedApplication];
    if (app.applicationState == UIApplicationStateActive || app.applicationState==UIApplicationStateInactive) {
        Ivar ivar=  class_getInstanceVariable([app class],"_statusBar");
        id status  = object_getIvar(app, ivar);
        for (id aview in [status subviews]) {
            int batteryLevel = 0;
            for (id bview in [aview subviews]) {
                if ([NSStringFromClass([bview class]) caseInsensitiveCompare:@"UIStatusBarBatteryItemView"] == NSOrderedSame &&
                    [[[UIDevice currentDevice] systemVersion] floatValue] >=6.0) {
                    Ivar ivar=  class_getInstanceVariable([bview class],"_capacity");
                    if(ivar) {
                        batteryLevel = ((int (*)(id, Ivar))object_getIvar)(bview, ivar);
                        if (batteryLevel > 0 && batteryLevel <= 100) {
                            return batteryLevel;
                        } else {
                            return 0;
                        }
                    }
                }
            }
        }
    }
    return 0;
}

#pragma mark -
#pragma mark - 获取设备CPU型号
+ (NSString*)deviceCPUType
{
    switch ([self deviceModelEnum]) {
        case UIDeviceiPhone3G: return IPHONE_3G_CPUTYPE;
        case UIDeviceiPhone3GS: return IPHONE_3GS_CPUTYPE;
        case UIDeviceiPhone4: return IPHONE_4_CPUTYPE;
        case UIDeviceiPhone4S: return IPHONE_4S_CPUTYPE;
        case UIDeviceiPod4G: return IPOD_4G_CPUTYPE;
        case UIDeviceiPhone5: return IPHONE_5_CPUTYPE;
        case UIDeviceiPhone5C: return IPHONE_5C_CPUTYPE;
        case UIDeviceiPhone5S: return IPHONE_5S_CPUTYPE;
        case UIDeviceiPhone6:return IPHONE_6_CPUTYPE;
        case UIDeviceiPhone6Plus: return IPHONE_6Plus_CPUTYPE;
        case UIDeviceiPhone6S: return IPHONE_6S_CPUTYPE;
        case UIDeviceiPhone6SPlus: return IPHONE_6SPlus_CPUTYPE;
        case UIDeviceiPhone7:return IPHONE_7_CPUTYPE;
        case UIDeviceiPhone7Plus: return IPHONE_7Plus_CPUTYPE;
        case UIDeviceiPhone8: return IPHONE_8_CPUTYPE;
        case UIDeviceiPhone8Plus: return IPHONE_8Plus_CPUTYPE;
        case UIDeviceiPhoneX: return IPHONE_X_CPUTYPE;
        default: return IOS_CPUTYPE_UNKNOWN;
    }
}

#pragma mark -
#pragma mark - 获取CPU频率
+ (NSString*)deviceCPUFrequency
{
    switch ([self deviceModelEnum]) {
        case UIDeviceiPhone3G: return IPHONE_3G_CPUFREQUENCY;
        case UIDeviceiPhone3GS: return IPHONE_3GS_CPUFREQUENCY;
        case UIDeviceiPhone4: return IPHONE_4_CPUFREQUENCY;
        case UIDeviceiPhone4S: return IPHONE_4S_CPUFREQUENCY;
        case UIDeviceiPhone5C: return IPHONE_5C_CPUFREQEENCY;
        case UIDeviceiPhone5: return IPHONE_5_CPUFREQEENCY;
        case UIDeviceiPhone5S: return IPHONE_5S_CPUFREQEENCY;
        case UIDeviceiPhone6:return IPHONE_6Plus_CPUFREQEENCY;
        case UIDeviceiPhone6Plus:return IPHONE_6Plus_CPUFREQEENCY;
        case UIDeviceiPhone6S:return IPHONE_6SPlus_CPUTYPE;
        case UIDeviceiPhone6SPlus:return IPHONE_6SPlus_CPUTYPE;
        case UIDeviceiPhone7:return IPHONE_7_CPUFREQEENCY;
        case UIDeviceiPhone7Plus:return IPHONE_7Plus_CPUFREQEENCY;
        case UIDeviceiPod4G: return IPOD_4G_CPUFREQUENCY;
        default: return IOS_CPUFREQUENCY_UNKNOWN;
    }
}

#pragma mark -
#pragma mark - 获取设备CPU内核数
+ (NSUInteger)deviceCPUCoreCount
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, HW_NCPU};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

#pragma mark -
#pragma mark - 获取设备CPU使用率
+ (float)deviceCPUUsage
{
    kern_return_t kr;
    task_info_data_t tinfo;
    mach_msg_type_number_t task_info_count;
    task_info_count = TASK_INFO_MAX;
    kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)tinfo, &task_info_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    task_basic_info_t      basic_info;
    thread_array_t         thread_list;
    mach_msg_type_number_t thread_count;
    thread_info_data_t     thinfo;
    mach_msg_type_number_t thread_info_count;
    thread_basic_info_t basic_info_th;
    uint32_t stat_thread = 0; // Mach threads
    basic_info = (task_basic_info_t)tinfo;
    kr = task_threads(mach_task_self(), &thread_list, &thread_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    if (thread_count > 0)
        stat_thread += thread_count;
    long tot_sec = 0;
    long tot_usec = 0;
    float tot_cpu = 0;
    int j;
    for (j = 0; j < thread_count; j++) {
        thread_info_count = THREAD_INFO_MAX;
        kr = thread_info(thread_list[j], THREAD_BASIC_INFO,(thread_info_t)thinfo, &thread_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        basic_info_th = (thread_basic_info_t)thinfo;
        if (!(basic_info_th->flags & TH_FLAGS_IDLE)) {
            tot_sec = tot_sec + basic_info_th->user_time.seconds + basic_info_th->system_time.seconds;
            tot_usec = tot_usec + basic_info_th->user_time.microseconds + basic_info_th->system_time.microseconds;
            tot_cpu = tot_cpu + basic_info_th->cpu_usage / (float)TH_USAGE_SCALE * 100.0;
        }
    }
    kr = vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
    assert(kr == KERN_SUCCESS);
    return tot_cpu;
}

#pragma mark -
#pragma mark - 获取设备内存总量，返回字节数
+ (NSUInteger)deviceMemoryBytes
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, HW_PHYSMEM};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

#pragma mark -
#pragma mark - 获取设备可用内存量，返回字节数
+ (NSUInteger)deviceFreeMemoeryBytes
{
    mach_port_t           host_port = mach_host_self();
    mach_msg_type_number_t   host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t               pagesize;
    vm_statistics_data_t     vm_stat;
    host_page_size(host_port, &pagesize);
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) NSLog(@"Failed to fetch vm statistics");
    natural_t   mem_free =vm_stat.free_count * pagesize;
    return mem_free;
}

#pragma mark -
#pragma mark - 获取手机硬盘空闲空间，返回的是字节数
+ (long long)deviceFreeDiskSpaceBytes
{
    struct statfs buf;
    long long freespace;
    freespace = 0;
    if(statfs("/private/var", &buf) >= 0){
        freespace = (long long)buf.f_bsize * buf.f_bfree;
    }
    return freespace;
}

#pragma mark -
#pragma mark - 获取手机硬盘总空间，返回的是字节数
+ (long long)deviceDiskSpaceBytes
{
    struct statfs buf;
    long long totalspace;
    totalspace = 0;
    if(statfs("/private/var", &buf) >= 0){
        totalspace = (long long)buf.f_bsize * buf.f_blocks;
    }
    return totalspace;
}

#pragma mark -
#pragma mark - 判断设备是否支持蓝牙
+ (BOOL)deviceBluetoothStatus
{
    switch ([self deviceModelEnum]) {
        case UIDeviceiPhone3G:  return YES;
        case UIDeviceiPhone3GS: return YES;
        case UIDeviceiPhone4:   return YES;
        case UIDeviceiPhone4S:  return YES;
        case UIDeviceiPhone5:   return YES;
        case UIDeviceiPhone5C:  return YES;
        case UIDeviceiPhone5S:  return YES;
        case UIDeviceiPhone6:   return YES;
        case UIDeviceiPhone6Plus:   return YES;
        case UIDeviceiPhone6S:  return YES;
        case UIDeviceiPhone6SPlus:  return YES;
        case UIDeviceiPhone7:   return YES;
        case UIDeviceiPhone7Plus:   return YES;
        case UIDeviceiPhone8:   return YES;
        case UIDeviceiPhone8Plus:   return YES;
        case UIDeviceiPhoneX:   return YES;
        case UIDeviceiPod3G:    return YES;
        case UIDeviceiPod4G:    return YES;
        case UIDeviceiPod5G:    return YES;
        case UIDeviceiPod6G:    return YES;
        case UIDeviceiPad1G:   return YES;
        case UIDeviceiPad2G:   return YES;
        case UIDeviceiPad3G:   return YES;
        case UIDeviceiPad4G:   return YES;
        case UIDeviceiPadAir1: return YES;
        case UIDeviceiPadAir2: return YES;
        case UIDeviceiPadmini1:    return YES;
        case UIDeviceiPadmini2:    return YES;
        case UIDeviceiPadmini3:    return YES;
        case UIDeviceiPadmini4:    return YES;
        default: return NO;
    }
}

#pragma mark -
#pragma mark - 获取当前任务所占内存，返回MB
+ (double)deviceCurrentUseMemoery
{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    if (kernReturn != KERN_SUCCESS
        ) {
        return NSNotFound;
    }
    
    return taskInfo.resident_size / 1024.0 / 1024.0;
}

#pragma mark -
#pragma mark - 获取设备广告位标识符
+ (NSString*)deviceIDFA
{
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

#pragma mark -
#pragma mark - 获取设备MAC地址
+ (NSString*)deviceMacAddr
{
    int mib[6];
    size_t len;
    char *buf;
    unsigned char *ptr;
    struct if_msghdr *ifm;
    struct sockaddr_dl *sdl;
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    return [outstring uppercaseString];
}

#pragma mark -
#pragma mark - 获取设备IP地址
+ (NSString*)deviceIPAddr
{
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    NSMutableArray *ips = [NSMutableArray array];
    int BUFFERSIZE = 4096;
    struct ifconf ifc;
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    struct ifreq *ifr, ifrcopy;
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    if (ioctl(sockfd, SIOCGIFCONF, &ifc) >= 0){
        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){
            ifr = (struct ifreq *)ptr;
            int len = sizeof(struct sockaddr);
            if (ifr->ifr_addr.sa_len > len) {
                len = ifr->ifr_addr.sa_len;
            }
            ptr += sizeof(ifr->ifr_name) + len;
            if (ifr->ifr_addr.sa_family != AF_INET) continue;
            if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL) *cptr = 0;
            if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0) continue;
            memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
            ifrcopy = *ifr;
            ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
            if ((ifrcopy.ifr_flags & IFF_UP) == 0) continue;
            NSString *ip = [NSString  stringWithFormat:@"%s", inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            [ips addObject:ip];
        }
    }
    close(sockfd);
    NSString *deviceIP = @"";
    for (int i=0; i < ips.count; i++) {
        if (ips.count > 0) {
            deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];
        }
    }
    return deviceIP;
}

#pragma mark -
#pragma mark - 打印获取的全部设备信息
+ (void)logDeviceAllInfo
{
    NSLog(@"手机型号字符串[%@]",[self deviceModelString]);
    NSLog(@"手机型号枚举[%ld]",(long)[self deviceModelEnum]);
    NSLog(@"设备名称[%@]",[self deviceName]);
    NSLog(@"设备UUID[%@]",[self deviceUUID]);
    NSLog(@"系统名称[%@]",[self deviceSystemName]);
    NSLog(@"系统版本[%@]",[self deviceSystemVersion]);
    NSLog(@"设备类别[%@]",[self deviceModel]);
    NSLog(@"设备本地化信息[%@]",[self deviceLocalInfo]);
    NSLog(@"App相关信息[%@]",[self appAboutInfo]);
    NSLog(@"App应用名称[%@]",[self appName]);
    NSLog(@"App应用版本号[%@]",[self appVersion]);
    NSLog(@"App应用的build版本号[%@]",[self appBuildVersion]);
    NSLog(@"设备选中的国家[%@]",[self deviceSelectCountry]);
    NSLog(@"运行商的名称[%@]",[self deviceNetName]);
    NSLog(@"iOS7以后获取当前网络类型[%@]",[self deviceConnectType]);
    NSLog(@"iOS6以上获取设备电池电量等级[%d]",[self deviceBatteryLevel]);
    NSLog(@"设备是否越狱[%d]",[self deviceJailBreakStatus]);
    NSLog(@"CPU型号[%@]",[self deviceCPUType]);
    NSLog(@"CPU频率[%@]",[self deviceCPUFrequency]);
    NSLog(@"设备CPU内核数[%lu]",(unsigned long)[self deviceCPUCoreCount]);
    NSLog(@"CPU使用率[%f]",[self deviceCPUUsage]);
    NSLog(@"设备内存总量，返回字节数[%lu]",(unsigned long)[self deviceMemoryBytes]);
    NSLog(@"设备可用内存量，返回字节数[%lu]",(unsigned long)[self deviceFreeMemoeryBytes]);
    NSLog(@"手机硬盘空闲空间，返回的是字节数[%lld]",[self deviceFreeDiskSpaceBytes]);
    NSLog(@"手机硬盘总空间，返回的是字节数[%lld]",[self deviceDiskSpaceBytes]);
    NSLog(@"设备是否支持蓝牙[%d]",[self deviceBluetoothStatus]);
    NSLog(@"当前任务所占内存，返回MB[%f]",[self deviceCurrentUseMemoery]);
    NSLog(@"设备广告位标识符[%@]",[self deviceIDFA]);
    NSLog(@"设备MAC地址[%@]",[self deviceMacAddr]);
    NSLog(@"设备IP地址[%@]",[self deviceIPAddr]);
}

@end
