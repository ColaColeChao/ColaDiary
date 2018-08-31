//
//  Cola5veModel.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cola5veModel : NSObject
/** 列表标题 */
@property (nonatomic, copy) NSString *title;
/** 列表标题对应的icon */
@property (nonatomic, copy) NSString *icon;

/** 获取5ve的ViewController列表数据源 */
+ (NSArray*)fiveTableListData;

@end
