//
//  KSBleCoinManage.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/17.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "KSBleCoinManage.h"

@implementation KSBleCoinBaseModel
@end


@interface KSBleCoinManage ()
/** 本地plist文件中存储的币种信息数据 */
@property (nonatomic, strong) NSDictionary *ksBleCoinPlistDict;
@end

static NSString *const supportCoinsKey = @"ColdlarSupportCoins";
static NSString *const coinBaseInfoKey = @"ColdlarCoinBaseInfo";

@implementation KSBleCoinManage

#pragma mark -
#pragma mark - 根据币种简称获取币种的slip44编码
+ (NSString*)slip44CoinFlag:(NSString*)coinFlag
{
    return [[self alloc] slip44CoinFlag:coinFlag];
}
- (NSString*)slip44CoinFlag:(NSString*)coinFlag
{
    NSString *flagString = [NSString stringWithFormat:@"%@",coinFlag];
    NSDictionary *coinBaseDict = self.ksBleCoinPlistDict[coinBaseInfoKey];
    for (NSDictionary *valueDict in coinBaseDict.allValues) {
        KSBleCoinBaseModel *model = [KSBleCoinBaseModel mj_objectWithKeyValues:valueDict];
        if ([model.flag containsObject:flagString]) {
            return [NSString stringWithFormat:@"%@",model.coin_slip44];
        }
    }
    return nil;
}

#pragma mark -
#pragma mark - 根据币种获取b该币种的路径
+ (NSString*)coinPathWithCoinFlag:(NSString*)coinFlag
{
    NSString *slip44 = [KSBleCoinManage slip44CoinFlag:coinFlag];
    NSString *coinPath = [NSString stringWithFormat:@"m/44'/%@'/0'/0/0",slip44];
    return coinPath;
}

#pragma mark -
#pragma mark - 获取本地配置的币种Plist文件中的数据
- (NSDictionary*)ksBleCoinPlistDict
{
    if (!_ksBleCoinPlistDict) {
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ColdlerCoinBaseInfo" ofType:@"plist"];
        _ksBleCoinPlistDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    }
    return _ksBleCoinPlistDict;
}

@end
