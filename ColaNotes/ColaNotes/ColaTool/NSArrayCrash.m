//
//  NSArrayCrash.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/28.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "NSArrayCrash.h"
#import <objc/runtime.h>

static IMP array_old_func_imap_object = NULL;
static IMP muarray_old_func_imap_object = NULL;
static IMP muarray_old_func_imap_addobject = NULL;
static IMP muarray_old_func_imap_insetobject = NULL;
static IMP muarray_old_func_imap_removeobject = NULL;
static IMP muarray_old_func_imap_replaceobject = NULL;

@implementation NSArrayCrash

static dispatch_once_t onceToken;
static NSArrayCrash *sharedInstance;

+ (instancetype)sharedInstance
{
    dispatch_once(&onceToken, ^{
        sharedInstance = [[NSArrayCrash alloc] init];
    });
    return sharedInstance;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        {
            Method old_func_imap_object = class_getInstanceMethod(NSClassFromString(@"__NSArrayI"), @selector(objectAtIndex:));
            array_old_func_imap_object = method_getImplementation(old_func_imap_object);
            method_setImplementation(old_func_imap_object, [self methodForSelector:@selector(cola_objectAtIndex:)]);
        }
        {
            Method mold_func_imap_object = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(objectAtIndex:));
            muarray_old_func_imap_object = method_getImplementation(mold_func_imap_object);
            method_setImplementation(mold_func_imap_object, [self methodForSelector:@selector(cola_muobjectAtIndex:)]);
        }
        {
            Method old_func_imap_addobject = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(addObject:));
            muarray_old_func_imap_addobject = method_getImplementation(old_func_imap_addobject);
            method_setImplementation(old_func_imap_addobject, [self methodForSelector:@selector(cola_addObject:)]);
        }
        {
            Method old_func_imap_insetobject = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(insertObject:atIndex:));
            muarray_old_func_imap_insetobject = method_getImplementation(old_func_imap_insetobject);
            method_setImplementation(old_func_imap_insetobject, [self methodForSelector:@selector(cola_insertObject:atIndex:)]);
        }
        {
            Method old_func_imap_removeobject = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(removeObjectAtIndex:));
            muarray_old_func_imap_removeobject = method_getImplementation(old_func_imap_removeobject);
            method_setImplementation(old_func_imap_removeobject, [self methodForSelector:@selector(cola_removeObjectAtIndex:)]);
        }
        {
            Method old_func_imap_replaceobject = class_getInstanceMethod(NSClassFromString(@"__NSArrayM"), @selector(replaceObjectAtIndex:withObject:));
            muarray_old_func_imap_replaceobject = method_getImplementation(old_func_imap_replaceobject);
            method_setImplementation(old_func_imap_replaceobject, [self methodForSelector:@selector(cola_replaceObjectAtIndex:withObject:)]);
        }
    }
    return self;
}

+ (void)load
{
    [super load];
    [NSArrayCrash sharedInstance];
}

#pragma mark -
#pragma mark - NSArray
- (id)cola_objectAtIndex:(NSUInteger)index
{
    if (index < [(NSArray*)self count]) {
        return ((id(*)(id, SEL, NSUInteger))array_old_func_imap_object)(self, @selector(objectAtIndex:), index);
    }
    NSLog(@"NArray objectAtIndex 失败");
    return nil;
}

#pragma mark -
#pragma mark - NSMutableArray
- (id)cola_muobjectAtIndex:(NSUInteger)index
{
    if (index < [(NSMutableArray*)self count]) {
        return ((id(*)(id, SEL, NSUInteger))muarray_old_func_imap_object)(self, @selector(objectAtIndex:), index);
    }
    NSLog(@"NSMutableArray objectAtIndex 失败");
    return nil;
}

- (void)cola_addObject:(id)anObject
{
    if (anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        ((void(*)(id, SEL, id))muarray_old_func_imap_addobject)(self, @selector(addObject:), anObject);
    } else {
        NSLog(@"NSMutableArray addObject 失败");
    }
}

- (void)cola_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (index <= [(NSMutableArray*)self count] && anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        ((void(*)(id, SEL,id, NSUInteger))muarray_old_func_imap_insetobject)(self, @selector(insertObject:atIndex:), anObject,index);
    } else {
        NSLog(@"NSMutableArray insertObject:atIndex: 失败");
    }
}

- (void)cola_removeObjectAtIndex:(NSUInteger)index
{
    if (index < [(NSMutableArray*)self count]) {
        ((id(*)(id, SEL, NSUInteger))muarray_old_func_imap_removeobject)(self, @selector(removeObject:), index);
    } else {
        NSLog(@"NSMutableArray removeObject: 失败");
    }
}
- (void)cola_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject
{
    if (index < [(NSMutableArray*)self count] && anObject != nil && [anObject isKindOfClass:[NSNull class]] == NO) {
        ((void(*)(id, SEL, NSUInteger,id))muarray_old_func_imap_replaceobject)(self, @selector(replaceObjectAtIndex:withObject:), index,anObject);
    } else {
        NSLog(@"NSMutableArray replaceObjectAtIndex:withObject: 失败");
    }
}

@end
