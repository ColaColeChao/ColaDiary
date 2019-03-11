//
//  KSBleCoinManage.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/17.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSBleCoinBaseModel : NSObject
/** 币种中文名 */
@property (nonatomic, copy) NSString *coin_name_ch;
/** 币种英文名 */
@property (nonatomic, copy) NSString *coin_name_en;
/** 币种简称 */
@property (nonatomic, copy) NSString *coin_symbol;
/** 币种id */
@property (nonatomic, copy) NSString *coin_id;
/** 币种slip44编码 */
@property (nonatomic, copy) NSString *coin_slip44;
/** 币种的标识 */
@property (nonatomic, strong) NSArray *flag;
@end



@interface KSBleCoinManage : NSObject

/**
 根据币种简称获取币种的slip44编码
 @param coinFlag 币种标识（简称、全称等）
 @return 币种的slip44编码
 */
+ (NSString*)slip44CoinFlag:(NSString*)coinFlag;

/**
 根据币种获取该币种的路径
 @param coinFlag 币种标识（简称、全称等）
 @return 币种路径
 */
+ (NSString*)coinPathWithCoinFlag:(NSString*)coinFlag;

@end

NS_ASSUME_NONNULL_END
