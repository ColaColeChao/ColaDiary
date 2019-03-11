//
//  ColaBluetoothCell.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/9.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBluetoothCell.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ColaBluetoothCell ()
@property (nonatomic, strong) UILabel *nameLab;
@end

@implementation ColaBluetoothCell

- (void)initTableViewSubviews
{
    self.nameLab.frame = CGRectMake(20, 10, Cola_Width-40, 30);
    [self.contentView addSubview:self.nameLab];
    [self showBottomSeparator];
}

- (void)setData:(id)data
{
    _data = data;
    CBPeripheral *peripheral = (CBPeripheral*)data;
    self.nameLab.text = peripheral.name;
}

- (UILabel*)nameLab
{
    if (!_nameLab) {
        _nameLab = [UILabel labelWithTxtColor:[UIColor blackColor] txtFont:[UIFont boldSystemFontOfSize:16.f]];
    }
    return _nameLab;
}

@end
