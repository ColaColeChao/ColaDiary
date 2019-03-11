//
//  KSBleConvertTool.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSBleConvertTool : NSObject

/**
 NSString转十六进制NSString
 @param string NSString
 @return 十六进制NSString
 */
+ (NSString*)convertStringToHexString:(NSString*)string;

/**
 整型Int转十六进制NSString
 @param pingInt 整型Int数
 @return 十六进制NSString
 */
+ (NSString*)convertIntToHexString:(int)pingInt;

/**
 NSData转十六进制NSString
 @param data NSData类
 @return NSString类
 */
+ (NSString*)convertDataToHexString:(NSData*)data;



/**
 十六进制NSString转NSString
 @param hexString 十六进制NSString
 @return NSString
 */
+ (NSString*)convertHexStringToString:(NSString*)hexString;

/**
 十六进制NSString转Int
 @param hexString 十六进制NSString类
 @return Int整型数
 */
+ (int)convertHexStringToInt:(NSString*)hexString;

/**
 十六进制NSString转NSData
 @param hexString 十六进制NSString
 @return  NSData
 */
+ (NSData*)convertHexStringToData:(NSString*)hexString;



/**
 对NSData进行SHA256
 @param data 原NSData
 @return SHA256后的NSData
 */
+ (NSData*)dataHash256:(NSData*)data;

@end

NS_ASSUME_NONNULL_END
