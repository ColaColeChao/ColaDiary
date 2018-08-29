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

@end
