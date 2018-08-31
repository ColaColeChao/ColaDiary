
//
//  ColaTableFootMore.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaTableFootMore.h"

@interface ColaTableFootMore ()
/** 加载状态文字描述 */
@property (nonatomic, strong) UILabel *loadingStatusLab;
/** 加载动画或图片（git图） */
@property (nonatomic, strong) UIImageView *loadingImageView;
/** 加载动画的动画序列图片 */
@property (nonatomic, strong) NSArray *loadingImgaeOrders;
@end

@implementation ColaTableFootMore
- (void)prepare{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 80.f;
    
    self.loadingImageView.image = self.loadingImgaeOrders.firstObject;
    self.loadingImageView.animationImages = self.loadingImgaeOrders;
    self.loadingImageView.animationDuration = self.loadingImgaeOrders.count * .1;
    [self addSubview:self.loadingImageView];
    
    [self addSubview:self.loadingStatusLab];
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    self.loadingImageView.frame = CGRectMake((self.width - 25.f) / 2, 10.f, 25.f, 25.f);
    self.loadingStatusLab.frame = CGRectMake(0, CGRectGetMaxY(self.loadingImageView.frame), self.width, 30.f);
    
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
            self.loadingStatusLab.text = @"上拉加载";
            [self.loadingImageView stopAnimating];
            self.loadingStatusLab.hidden = YES;
            self.loadingImageView.hidden = YES;
            break;
        case MJRefreshStatePulling:
            self.loadingStatusLab.text = @"松开加载";
            [self.loadingImageView stopAnimating];
            self.loadingStatusLab.hidden = NO;
            self.loadingImageView.hidden = NO;
            break;
        case MJRefreshStateRefreshing:
            self.loadingStatusLab.text = @"加载中";
            [self.loadingImageView startAnimating];
            self.loadingStatusLab.hidden = NO;
            self.loadingImageView.hidden = NO;
            break;
        case MJRefreshStateNoMoreData:
            self.loadingStatusLab.text = @"已加载完，无更多数据";
            [self.loadingImageView stopAnimating];
            self.loadingStatusLab.hidden = NO;
            self.loadingImageView.hidden = YES;
            
            
        default:
            break;
    }
}

- (UIImageView*)loadingImageView
{
    if (!_loadingImageView) {
        _loadingImageView = [UIImageView new];
    }
    return _loadingImageView;
}
- (UILabel*)loadingStatusLab
{
    if (!_loadingStatusLab) {
        _loadingStatusLab = [UILabel labelWithTxtColor:ColaHex(0x99c3c7) txtFontSize:10.f alignment:NSTextAlignmentCenter];;
    }
    return _loadingStatusLab;
}
- (NSArray*)loadingImgaeOrders
{
    if (!_loadingImgaeOrders) {
        _loadingImgaeOrders = @[
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading01"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading02"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading03"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading04"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading05"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading06"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading07"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading08"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading09"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading10"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading11"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading12"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading13"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading14"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading15"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading16"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading17"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading18"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading19"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading20"],
                                [UIImage imageNamed:@"ColaRefreshImages.bundle/loading21"]
                                ];
    }
    return _loadingImgaeOrders;
}
@end
