//
//  ColaSnowView.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/3.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColaSnowView : UIView


/**
 初始化下雪的UIView
 @param snowImageName 雪花图片名称
 @param frame UIView的frame值
 @return UIView
 */
+ (instancetype)snowViewWithSnowImageName:(NSString *)snowImageName frame:(CGRect)frame;


/**
 开始下雪
 */
- (void)beginSnow;

@end
