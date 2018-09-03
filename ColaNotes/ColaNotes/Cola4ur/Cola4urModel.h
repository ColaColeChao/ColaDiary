//
//  Cola4urModel.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/3.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cola4urModel : NSObject

/** 列表标题 */
@property (nonatomic, copy) NSString *title;
/** 列表副标题 */
@property (nonatomic, copy) NSString *subTitle;
/** 列表标题对应的icon */
@property (nonatomic, copy) NSString *icon;

/** 获取4ur的ViewController列表数据源 */
+ (NSArray*)fourTableListData;

@end
