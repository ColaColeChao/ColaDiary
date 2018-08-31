
//
//  ColaDeviceConst.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#ifndef ColaDeviceConst_h
#define ColaDeviceConst_h

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                             当前设备中文名称                      //////////////////
/////////////////////////////////////////////////////////////////////////////////////////
#define DEVICE_UNKNOWN  @"Unknown Device"
#define SIMULATOR_DEVICE @"Simulator"
#define IPHONE_SIMULATOR_DEVICE @"iPhone Simulator"
#define IPAD_SIMULATOR_DEVICE @"iPad Simulator"
#define APPLETV_SIMULATOR_DEVICE @"AppleTV Simulator"
#define IPHONE_1G_DEVICE    @"iPhone 1G"
#define IPHONE_3G_DEVICE    @"iPhone 3G"
#define IPHONE_3GS_DEVICE   @"iPhone 3GS"
#define IPHONE_4_DEVICE @"iPhone 4"
#define IPHONE_4S_DEVICE    @"iPhone 4S"
#define IPHONE_5_DEVICE @"iPhone 5"
#define IPHONE_5C_DEVICE    @"iPhone 5C"
#define IPHONE_5S_DEVICE    @"iPhone 5S"
#define IPHONE_6_DEVICE @"iPhone 6"
#define IPHONE_6Plus_DEVICE @"iPhone 6Plus"
#define IPHONE_6S_DEVICE    @"iPhone 6S"
#define IPHONE_6SPlus_DEVICE    @"iPhone 6SPlus"
#define IPHONE_7_DEVICE @"iPhone 7"
#define IPHONE_7Plus_DEVICE @"iPhone 7Plus"
#define IPHONE_8_DEVICE @"iPhone 8"
#define IPHONE_8Plus_DEVICE @"iPhone 8Plus"
#define IPHONE_X_DEVICE @"iPhone X"
#define IPHONE_SIMULATOR32_DEVICE  @"iPhone Simulator32"
#define IPHONE_SIMULATOR64_DEVICE  @"iPhone Simulator64"
#define IPOD_1G_DEVICE  @"iPod touch 1G"
#define IPOD_2G_DEVICE  @"iPod touch 2G"
#define IPOD_3G_DEVICE  @"iPod touch 3G"
#define IPOD_4G_DEVICE  @"iPod touch 4G"
#define IPOD_5G_DEVICE  @"iPod Touch 5G"
#define IPOD_6G_DEVICE  @"iPod Touch 6G"
#define IPAD_1G_DEVICE  @"iPad 1G"
#define IPAD_2G_DEVICE  @"iPad 2G"
#define IPAD_3G_DEVICE  @"iPad 3G"
#define IPAD_4G_DEVICE  @"iPad 4G"
#define IPADAIR_1G_DEVICE   @"iPadAir 1G"
#define IPADAIR_2G_DEVICE   @"iPadAir 2G"
#define IPADMINI_1G_DEVICE  @"iPadMini 1G"
#define IPADMINI_2G_DEVICE  @"iPadMini 2G"
#define IPADMINI_3G_DEVICE  @"iPadMini 3G"
#define IPADMINI_4G_DEVICE  @"iPadMini 4G"
#define APPLETV_2G_DEVICE   @"Apple TV 2G"
#define APPLETV_3G_DEVICE   @"Apple TV 3G"
#define APPLETV_4G_DEVICE   @"Apple TV 4G"
#define IPHONE_UNKNOWN_DEVICE @"Unknown iPhone"
#define IPOD_UNKNOWN_DEVICE @"Unknown iPod"
#define IPAD_UNKNOWN_DEVICE @"Unknown iPad"
#define APPLETV_UNKNOWN_DEVICE  @"Unknown Apple TV"
#define IFPGA_DEVICE    @"iFPGA"

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////            iPhone 3G以后各代的CPU型号和频             //////////////////
////////////////////////////////////////////////////////// //////////////////////////////
#define IPHONE_3G_CPUTYPE   @"ARM11"
#define IPHONE_3G_CPUFREQUENCY  @"412MHz"
#define IPHONE_3GS_CPUTYPE  @"ARM Cortex A8"
#define IPHONE_3GS_CPUFREQUENCY @"600MHz"
#define IPHONE_4_CPUTYPE    @"Apple A4"
#define IPHONE_4_CPUFREQUENCY   @"1GMHz"
#define IPHONE_4S_CPUTYPE   @"Apple A5 Double Core"
#define IPHONE_4S_CPUFREQUENCY  @"800MHz"
#define IPHONE_5_CPUTYPE    @"Apple A6"
#define IPHONE_5_CPUFREQEENCY   @"1066MHz"
#define IPHONE_5C_CPUTYPE   @"Apple A6"
#define IPHONE_5C_CPUFREQEENCY  @"1GHz"
#define IPHONE_5S_CPUTYPE   @"Apple A7"
#define IPHONE_5S_CPUFREQEENCY  @"1228MHz"
#define IPHONE_6_CPUTYPE    @"Apple A8"
#define IPHONE_6_CPUFREQEENCY   @"1.4GHz"
#define IPHONE_6Plus_CPUTYPE    @"Apple A8"
#define IPHONE_6Plus_CPUFREQEENCY   @"1.4GHz"
#define IPHONE_6S_CPUTYPE   @"Apple A9"
#define IPHONE_6S_CPUFREQEENCY  @"1.8GHz"
#define IPHONE_6SPlus_CPUTYPE   @"Apple A9"
#define IPHONE_6SPlus_CPUFREQEENCY  @"1.8GHz"
#define IPHONE_7_CPUTYPE    @"Apple A10"
#define IPHONE_7_CPUFREQEENCY   @"2.4GHz"
#define IPHONE_7Plus_CPUTYPE    @"Apple A10"
#define IPHONE_7Plus_CPUFREQEENCY   @"2.4GHz"
#define IPHONE_8_CPUTYPE    @"Apple A11"
#define IPHONE_8_CPUFREQEENCY   @"2.4GHz"
#define IPHONE_8Plus_CPUTYPE    @"Apple A11"
#define IPHONE_8Plus_CPUFREQEENCY   @"2.4GHz"
#define IPHONE_X_CPUTYPE    @"Apple A11"
#define IPHONE_X_CPUFREQEENCY   @"2.4GHz"

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                  iPod 4G的CPU型号和频率                     //////////////////
////////////////////////////////////////////////////////// //////////////////////////////
#define IPOD_4G_CPUTYPE @"Apple A4"
#define IPOD_4G_CPUFREQUENCY    @"800MHz"

/////////////////////////////////////////////////////////////////////////////////////////
//////////////////                      未知的CPU型号和频率                      //////////////////
////////////////////////////////////////////////////////// //////////////////////////////
#define IOS_CPUTYPE_UNKNOWN @"Unknown CPU type"
#define IOS_CPUFREQUENCY_UNKNOWN    @"Unknown CPU frequency"


typedef NS_ENUM(NSInteger,UIDeviceModel) {
    UIDeviceUnknown,   //  未知设备型号
    UIDeviceSimulator,  //  模拟器
    UIDeviceSimulatoriPhone,    // iPhone模拟器
    UIDeviceSimulatoriPad,  //  iPad模拟器
    UIDeviceSimulatorAppleTV,   //  AppleTV模拟器
    UIDeviceiPhone1G,   //  1代iPhone
    UIDeviceiPhone3G,   //  3代iPhone
    UIDeviceiPhone3GS,  //  iPhone 3GS
    UIDeviceiPhone4,    //  iPhone 4
    UIDeviceiPhone4S,   //  iPhone 4s
    UIDeviceiPhone5,    //  iPhone 5
    UIDeviceiPhone5C,   //  iPhone 5c
    UIDeviceiPhone5S,   //  iPhone 5s
    UIDeviceiPhone6,    //  iPhone 6
    UIDeviceiPhone6Plus,    //  iPhone 6Plus
    UIDeviceiPhone6S,   //  iPhone 6s
    UIDeviceiPhone6SPlus,   //  iPhone 6sPlus
    UIDeviceiPhone7,    //  iPhone 7
    UIDeviceiPhone7Plus,    //  iPhone 7Plus
    UIDeviceiPhone8,    //  iPhone 8
    UIDeviceiPhone8Plus,    //  iPhone 8Plus
    UIDeviceiPhoneX,    //  iPhone X
    UIDeviceiPhoneSimulator32,  //  32位iPhone模拟器
    UIDeviceiPhoneSimulator64,  //  64位iPhone模拟器
    UIDeviceiPod1G, //  1代iPod
    UIDeviceiPod2G, //  2代iPod
    UIDeviceiPod3G, //  3代iPod
    UIDeviceiPod4G, //  4代iPod
    UIDeviceiPod5G, //  5代iPod
    UIDeviceiPod6G, //  6代iPod
    UIDeviceiPad1G,  //  1代iPad
    UIDeviceiPad2G,  //  2代iPad
    UIDeviceiPad3G,  //  3代iPad
    UIDeviceiPad4G,  //  4代iPad
    UIDeviceiPadAir1,  //  1代iPadAir
    UIDeviceiPadAir2,  //  2代iPadAir
    UIDeviceiPadmini1,  //  1代iPadMini
    UIDeviceiPadmini2,  //  2代iPadMini
    UIDeviceiPadmini3,  //  3代iPadMini
    UIDeviceiPadmini4,  //  4代iPadMini
    UIDeviceAppleTV2,  //  2代AppleTV
    UIDeviceAppleTV3,  //  3代AppleTV
    UIDeviceAppleTV4,  //  4代AppleTV
    UIDeviceUnknowniPhone,    //  未知类型的iPhone
    UIDeviceUnknowniPod,      //  未知类型的iPod
    UIDeviceUnknowniPad,    //  未知类型的iPad
    UIDeviceUnknownAppleTV,   //  未知类型的AppleTV
    UIDeviceIFPGA
};

#endif /* ColaDeviceConst_h */
