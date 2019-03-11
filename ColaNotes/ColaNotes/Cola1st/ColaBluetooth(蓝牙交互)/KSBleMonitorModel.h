//
//  KSBleMonitorModel.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "KSBleBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSBleMonitorModel : KSBleBaseModel
/** 币种的slip44编号，一个多或者地址 */
@property (nonatomic, strong) NSArray *coin_type;
/** 币种对应的扩展公钥，比特系列独有，可以根据该公钥和链码生成对应的地址 */
@property (nonatomic, copy) NSString *xpub;
/** 币种地址，非比特币系列独有 */
@property (nonatomic, copy) NSString *addr;

/** 初始化蓝牙h获取监控功能数据 */
+ (instancetype)initBleMonitorData:(id)data;
@end

NS_ASSUME_NONNULL_END
