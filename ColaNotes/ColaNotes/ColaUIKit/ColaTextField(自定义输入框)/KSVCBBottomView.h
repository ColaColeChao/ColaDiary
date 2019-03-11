//
//  KSVCBBottomView.h
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/28.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KSVCBBottomViewType) {
    KSVCBBottomViewTypeMargin = 0,  //  杠杆交易底部视图
    KSVCBBottomViewTypePledge,      //  质押借款底部视图
    KSVCBBottomViewTypeFinance,     //  理财底部视图
};

@interface KSVCBBottomView : UIView


/**
 初始化UI
 @param frame frame值，子视图为居中显示
 @param vcbViewType 视图类型，用于区分显示内容的不同
 @return self，底部视图
 */
- (instancetype)initWithFrame:(CGRect)frame vcbViewType:(KSVCBBottomViewType)vcbViewType;

@end

