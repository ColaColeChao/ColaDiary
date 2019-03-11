//
//  ColaShareInstance.m
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/10.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import "ColaShareInstance.h"

@interface ColaShareInstance ()
@property (nonatomic, copy) NSString *aaaaaaaa;
@end

@implementation ColaShareInstance

#pragma mark -
#pragma mark - 单例
+ (id)shareInstance
{
    static ColaShareInstance *share = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        share = [[ColaShareInstance alloc] init];
    });
    return share;
}

#pragma mark -
#pragma mark - 初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        _aaaaaaaa = @"aaaaaaaaaaaaaaaa";
    }
    return self;
}

- (void)setaaaaaValue:(NSString*)value
{
    _aaaaaaaa = value;
}

- (NSString*)getaaaaaValue
{
    return _aaaaaaaa;
}

- (void)setaaaaaaaaaaaaaaa
{
    _aaaaaaaa = @"923e79qwfhadilhjvhadfvbjasdfk.bvhdfjkgk.h";
}

@end
