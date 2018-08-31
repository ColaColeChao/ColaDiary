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
@end

@implementation ColaDeviceInfoCell
- (void)initTableViewSubviews
{
    [self showBottomSeparator];
    [self.contentView addSubview:self.deviceInfoLab];
    self.deviceInfoLab.frame = CGRectMake(15, 0, Cola_Width-30, 50);
}
- (void)loadCellData:(id)data
{
    if ([data isKindOfClass:[ColaDeviceInfoModel class]]) {
        ColaDeviceInfoModel *model = (ColaDeviceInfoModel*)data;
        self.deviceInfoLab.text = model.deviceInfo;
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
