//
//  ColaSnowView.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/3.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaSnowView.h"

@interface ColaSnowView ()
/** 雪花图片的名称 */
@property (nonatomic, copy) NSString *snowImageName;
@end

@implementation ColaSnowView

+ (instancetype)snowViewWithSnowImageName:(NSString *)snowImageName frame:(CGRect)frame
{
    ColaSnowView *view = [[ColaSnowView alloc] initWithFrame:frame];
    view.snowImageName = snowImageName;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)beginSnow
{
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)drawRect:(CGRect)rect
{
    if (self.subviews.count > 250) {
        return;
    }
    int width = arc4random() % 20;
    while (width < 5) {
        width = arc4random() % 20;
    }
    int speed = arc4random() % 15;
    while (speed < 5) {
        speed = arc4random() % 15;
    }
    
    int startY = - (arc4random() % 100);
    int startX = arc4random() % (int)[UIScreen mainScreen].bounds.size.width;
    int endX = arc4random() % (int)[UIScreen mainScreen].bounds.size.width;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.snowImageName]];
    imageView.frame = CGRectMake(startX, startY, width, width);
    
    [self addSubview:imageView];
    
    [UIView animateWithDuration:speed animations:^{
        imageView.frame = CGRectMake(endX, [UIScreen mainScreen].bounds.size.height, width, width);
        imageView.transform = CGAffineTransformRotate(imageView.transform, M_PI );
        imageView.alpha = 0.3;
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}


@end
