//
//  ColaBaseModel.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBaseModel.h"
#include <objc/runtime.h>

@implementation ColaBaseModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (int i=0; i<count; i++) {
        const char *name = ivar_getName(ivarList[i]);
        NSString *nameString = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:nameString] forKey:nameString];
    }
    free(ivarList);
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivarList = class_copyIvarList([self class], &count);
        for (int i=0; i<count; i++) {
            const char *name = ivar_getName(ivarList[i]);
            NSString *nameString = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
            id value = [aDecoder decodeObjectForKey:nameString];
            [self setValue:value forKey:nameString];
        }
        free(ivarList);
    }
    return self;
}


@end
