//
//  ColaGesLockView.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/12/8.
//  Copyright © 2018 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  手势密码类型：设置、验证、解锁
 */
typedef NS_ENUM(NSUInteger, ColaGesLockType) {
    ColaGesLockTypeSet = 500,   //  设置手势密码
    ColaGesLockTypeReset,          //  验证手势密码
    ColaGesLockTypeUnlock,       //  解锁手势密码
};

@interface ColaGesLockView : UIView

/**
 初始化手势UI
 @param frame frame值
 @param unlockStatus 是否是解锁，YES：解锁，NO：非解锁
 @return 手势密码UI
 */
- (instancetype)initWithFrame:(CGRect)frame unlock:(BOOL)unlockStatus;

/**
 重置手势类型
 @param type 手势密码类型
 */
- (void)reloadGesLockType:(ColaGesLockType)type;

@end

NS_ASSUME_NONNULL_END
