//
//  ColaDeviceInfoModel.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColaDeviceInfoModel : NSObject
/** 设备信息 */
@property (nonatomic, copy) NSString *deviceInfo;

/** 获取设备的全部信息 */
+ (NSArray*)currentDeviceInfos;

@end
