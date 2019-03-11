//
//  KSBleBaseModel.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSBleBaseModel : NSObject
/** 获取数据结果：YES=成功，NO=失败 */
@property (nonatomic, assign) BOOL resultBool;
/** 获取数据失败的错误信息 */
@property (nonatomic, copy) NSString *errorMessage;

/** 初始化 */
- (void)initBleBaseModel:(id)data;

@end

NS_ASSUME_NONNULL_END
