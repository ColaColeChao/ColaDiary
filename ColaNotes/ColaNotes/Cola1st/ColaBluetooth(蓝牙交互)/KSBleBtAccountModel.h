//
//  KSBleBtAccountModel.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "KSBleBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSBleBtAccountModel : KSBleBaseModel
/** 序列化路径 */
@property (nonatomic, copy) NSString *serialized_path;
/** 旧版本格式的扩展公钥，包含链码 */
@property (nonatomic, copy) NSString *xpub;
/** 隔离认证账户，扩展公钥采用隔离验证格式 */
@property (nonatomic, copy) NSString *xpub_segwit;
/** 账户索引 */
@property (nonatomic, copy) NSString *child_n;
/** 公钥 */
@property (nonatomic, copy) NSString *publicKey;
/** 指纹，运算中需要的中间变量 */
@property (nonatomic, copy) NSString *fingerprint;
/** 深度，路径层级深度 */
@property (nonatomic, copy) NSString *depth;
/** 获取失败的错误信息 */
@property (nonatomic, copy) NSString *error;

@end

NS_ASSUME_NONNULL_END
