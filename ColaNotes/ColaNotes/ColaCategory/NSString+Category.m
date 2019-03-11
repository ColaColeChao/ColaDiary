//
//  NSString+Category.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)

#pragma mark -
#pragma mark - 验证字符串是否为空
- (BOOL)isNotEmpty
{
    NSString *string = [NSString stringWithFormat:@"%@",self];
    if ([self isEqual:[NSNull null]]) return NO;
    if ([self isKindOfClass:[NSNull class]]) return NO;
    if (self == nil) return NO;
    if ([string isEqualToString:@"<null>"]) return NO;
    if ([string isEqualToString:@"(null)"]) return NO;
    if ([string isEqualToString:@"null"]) return NO;
    if ([string isEqualToString:@" "]) return NO;
    if ([string length] == 0) return NO;
    return YES;
}

#pragma mark -
#pragma mark - 时间戳转换成格式化日期
- (NSString*)toFormatTimes
{
//    NSLog(@"start = [%f]",CFAbsoluteTimeGetCurrent());
    NSString *timeString = ColaString(@"%@",self);
    NSInteger times = self.integerValue;
    if (13 == timeString.length) {
        times = times / 1000;
    } else if (10 == timeString.length) {
        times = times;
    } else {
        return self;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:times];
    time_t timeInterval = [date timeIntervalSince1970];
    char buffer[80];
    strftime(buffer, sizeof(buffer),"%Y年%m月%d日%H时%M分%S秒", localtime(&timeInterval));
    NSString *string = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];
//    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:times];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy年mm月DD日HH时MM分ss秒"];
//    NSString *string = [dateFormatter stringFromDate:detaildate];
//    NSLog(@"end = [%f]",CFAbsoluteTimeGetCurrent());
    return string;
}

#pragma mark -
#pragma mark - 计算字符串在UILabel上的size值（精准计算）
- (CGSize)sizeInLabelWithMaxSize:(CGSize)maxSize txtFont:(UIFont*)font lines:(int)lines
{
    NSString *string = [NSString stringWithFormat:@"%@",self];
    UILabel *label = [UILabel new];
    label.text = string;
    label.font = font;
    label.numberOfLines = lines;
    CGSize size = [label sizeThatFits:maxSize];
    return size;
}

#pragma mark -
#pragma mark - 小数位数限制，按照位数自动截取
- (NSString*)cutDigitsLimitInt:(int)digits
{
    NSString *numberString = [NSString stringWithFormat:@"%@",self];
    if ([numberString containsString:@"."]) {
        NSArray *numberArray = [numberString componentsSeparatedByString:@"."];
        NSString *digitsString = numberArray.lastObject;
        if (digitsString.length > digits) {
            digitsString = [digitsString substringToIndex:digits];
        }
        NSString *intString = numberArray.firstObject;
        intString = [intString stringByAppendingString:@"."];
        return [intString stringByAppendingString:digitsString];
    }
    return numberString;
}

#pragma mark -
#pragma mark - 判断小数位数，是否是允许输入的小数位数
- (BOOL)judgeInputDigitsInt:(int)digits
{
    NSString *numberString = [NSString stringWithFormat:@"%@",self];
    if ([numberString containsString:@"."]) {
        NSArray *numberArray = [numberString componentsSeparatedByString:@"."];
        NSString *digitsString = numberArray.lastObject;
        if (digitsString.length > digits) {
            return NO;
        }
    }
    return YES;
}

@end
