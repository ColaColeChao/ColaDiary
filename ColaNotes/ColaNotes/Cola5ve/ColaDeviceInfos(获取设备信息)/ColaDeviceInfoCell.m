//
//  ColaDeviceInfoCell.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/31.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaDeviceInfoCell.h"
#import "ColaDeviceInfoModel.h"

@interface ColaDeviceInfoCell ()
/** 设备信息 */
@property (nonatomic, strong) UILabel *deviceInfoLab;
/** UILabel跑马灯定时器 */
@property (nonatomic, strong) NSTimer *labTimer;
@end

@implementation ColaDeviceInfoCell
- (void)initTableViewSubviews
{
    [self showBottomSeparator];
    [self.contentView addSubview:self.deviceInfoLab];
}
- (void)loadCellData:(id)data
{
    if ([data isKindOfClass:[ColaDeviceInfoModel class]]) {
        ColaDeviceInfoModel *model = (ColaDeviceInfoModel*)data;
        self.deviceInfoLab.text = model.deviceInfo;
        CGSize size = [self.deviceInfoLab sizeThatFits:CGSizeMake(MAXFLOAT, 50)];
        //  字符串过长的添加UILabel的滚动显示
        if (size.width > Cola_Width-30) {
            self.deviceInfoLab.frame = CGRectMake(15, 0, Cola_Width-30, 50);
            [self setTimerStart];
        } else {
            self.deviceInfoLab.frame = CGRectMake(15, 0, Cola_Width-30, 50);
            [self removeTimer];
        }
    }
}
- (void)setTimerStart
{
    [self.labTimer invalidate];
    self.labTimer = nil;
    self.labTimer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.labTimer forMode:UITrackingRunLoopMode];
}
- (void)removeTimer
{
    [self.labTimer invalidate];
    self.labTimer = nil;
}
- (void)timerAction
{
    CGPoint centerPoint = self.deviceInfoLab.center;
    if (centerPoint.x < -(Cola_Width/2) ) {
        CGFloat distance = self.deviceInfoLab.frame.size.width/2;
        self.deviceInfoLab.center = CGPointMake(self.contentView.frame.size.width+distance, self.deviceInfoLab.center.y);
    } else {
        self.deviceInfoLab.center = CGPointMake(centerPoint.x-5, self.deviceInfoLab.center.y);
    }
}
-(UILabel*)deviceInfoLab
{
    if (!_deviceInfoLab) {
        _deviceInfoLab = [UILabel labelWithTxtColor:ColaHex(0x515151) txtFontSize:15.f];
        _deviceInfoLab.adjustsFontSizeToFitWidth = YES;
    }
    return _deviceInfoLab;
}
@end
