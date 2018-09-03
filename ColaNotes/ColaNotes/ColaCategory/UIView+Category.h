//
//  UIView+Category.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)

/** UIView的x坐标 */
@property (nonatomic, assign) CGFloat x;
/** UIView的y坐标 */
@property (nonatomic, assign) CGFloat y;
/** UIView的宽度 */
@property (nonatomic, assign) CGFloat width;
/** UIView的x高度 */
@property (nonatomic, assign) CGFloat height;
/** UIView的右边frame值 */
@property (nonatomic, assign) CGFloat right;
/** UIView的底部frame值 */
@property (nonatomic, assign) CGFloat bottom;
/** UIView的size值 */
@property (nonatomic, assign) CGSize size;
/** UIView的origin值 */
@property (nonatomic, assign) CGPoint origin;
/** UIView的中心x坐标 */
@property (nonatomic, assign) CGFloat centerX;
/** UIView的中心y坐标 */
@property (nonatomic, assign) CGFloat centerY;

@end
