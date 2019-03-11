//
//  KSBleConvertTool.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "KSBleConvertTool.h"
#import <CommonCrypto/CommonDigest.h>

@implementation KSBleConvertTool

/**
 NSString转十六进制NSString
 @param string NSString
 @return 十六进制NSString
 */
+ (NSString*)convertStringToHexString:(NSString*)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte*)[data bytes];
    NSString *hexString = nil;
    for (int i=0; i<[data length]; i++) {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];
        if (newHexStr.length == 1) {
            hexString = [NSString stringWithFormat:@"%@0%@",hexString?hexString:@"",newHexStr];
        } else {
            hexString = [NSString stringWithFormat:@"%@%@",hexString?hexString:@"",newHexStr];
        }
    }
    return hexString;
}

/**
 十六进制NSString转NSData
 @param hexString 十六进制NSString
 @return  NSData
 */
+ (NSData*)convertHexStringToData:(NSString*)hexString
{
    if (!hexString || [hexString length] == 0) {
        return nil;
    }
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:0];
    NSRange range;
    if ([hexString length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [hexString length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [hexString substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}

/**
 整型Int转十六进制NSString
 @param pingInt 整型Int数
 @return 十六进制NSString
 */
+ (NSString*)convertIntToHexString:(int)pingInt
{
    char hexPingxChar[6];
    sprintf(hexPingxChar, "%x",pingInt);
    return [NSString stringWithCString:hexPingxChar encoding:NSUTF8StringEncoding];
}

/**
 NSData转十六进制NSString
 @param data NSData类
 @return NSString类
 */
+ (NSString*)convertDataToHexString:(NSData*)data
{
    NSRecursiveLock *convertLock = [[NSRecursiveLock alloc] init];
    [convertLock lock];
    __block NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    [data enumerateByteRangesUsingBlock:^(const void * _Nonnull bytes, NSRange byteRange, BOOL * _Nonnull stop) {
        unsigned char *dataBytes = (unsigned char *)bytes;
        for (NSInteger i =0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x",(dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@",hexStr];
            }
        }
        [convertLock unlock];
    }];
    return string;
}

/**
 十六进制NSString转NSString
 @param hexString 十六进制NSString
 @return NSString
 */
+ (NSString*)convertHexStringToString:(NSString*)hexString
{
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    return [NSString stringWithCString:myBuffer encoding:4];
}

/**
 十六进制NSString转Int
 @param hexString 十六进制NSString类
 @return Int整型数
 */
+ (int)convertHexStringToInt:(NSString*)hexString
{
    int hexNumber;
    const char *hexChar = [hexString cStringUsingEncoding:NSUTF8StringEncoding];
    sscanf(hexChar, "%x", &hexNumber);
    return hexNumber;
}

/**
 对NSData进行SHA256
 @param data 原NSData
 @return SHA256后的NSData
 */
+ (NSData*)dataHash256:(NSData*)data
{
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(data.bytes, (CC_LONG)data.length, result);
    NSData *checkCodeData = [NSData dataWithBytes:result length:CC_SHA256_DIGEST_LENGTH];
    return checkCodeData;
}


@end
