//
//  ColaTableHeadRefresh.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaTableHeadRefresh.h"

@interface ColaTableHeadRefresh ()
/** 加载状态文字描述 */
@property (nonatomic, strong) UILabel *loadingStatusLab;
/** 加载动画或图片（git图） */
@property (nonatomic, strong) UIImageView *loadingImageView;
/** 加载动画的动画序列图片 */
@property (nonatomic, strong) NSArray *loadingImgaeOrders;
@end

@implementation ColaTableHeadRefresh

- (void)prepare
{
    [super prepare];
    
    //  设置下拉刷新控件高度
    self.mj_h = 80.f;
    
    //  加载动画
    self.loadingImageView.image = self.loadingImgaeOrders.firstObject;
    self.loadingImageView.animationImages = self.loadingImgaeOrders;
    self.loadingImageView.animationDuration = self.loadingImgaeOrders.count*.1;
    [self addSubview:self.loadingImageView];
    
    [self addSubview:self.loadingStatusLab];
}

- (void)placeSubviews
{
    [super placeSubviews];
    
    self.loadingImageView.frame = CGRectMake((self.width - 25.f) / 2, 10.f, 25.f, 25.f);
    self.loadingStatusLab.frame = CGRectMake(0, CGRectGetMaxY(self.loadingImageView.frame), self.width, 30.f);
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
}

- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
}

- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    switch (state) {
        case MJRefreshStateIdle:
            self.loadingStatusLab.text = @"下拉加载";
            [self.loadingImageView stopAnimating];
            break;
        case MJRefreshStatePulling:
            self.loadingStatusLab.text = @"松开加载";
            [self.loadingImageView stopAnimating];
            break;
        case MJRefreshStateRefreshing:
            self.loadingStatusLab.text = @"加载中";
            [self.loadingImageView startAnimating];
            break;
        default:
            break;
    }
}

- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    self.loadingStatusLab.textColor = [UIColor blackColor];
    if (self.state != MJRefreshStateIdle || 0 == self.loadingImgaeOrders.count) {
        return;
    }
    [self.loadingImageView stopAnimating];
    
    NSUInteger index = self.loadingImgaeOrders.count * pullingPercent;
    if (index >= self.loadingImgaeOrders.count) {
        index = self.loadingImgaeOrders.count - 1;
    }
    self.loadingImageView.image = self.loadingImgaeOrders[index];
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
