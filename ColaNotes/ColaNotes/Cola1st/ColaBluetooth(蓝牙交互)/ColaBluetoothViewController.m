//
//  ColaBluetoothViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/8.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaBluetoothViewController.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "ColaBluetoothCell.h"
#import "KSBleMonitorModel.h"
#import "KSBleIssuedDataManage.h"
#import "KSBleReciveDataManage.h"
#import "KSBleCoinManage.h"
#import "KSBleConstDefine.h"
#import "ColaShareInstance.h"

@interface ColaBluetoothViewController ()
<CBCentralManagerDelegate,CBPeripheralDelegate>

/** 蓝牙中心管理者 */
@property (nonatomic, strong) CBCentralManager *centerManager;
/** 扫描到的设备 */
@property (nonatomic, strong) CBPeripheral *cbperipheral;
/** 可写入的特征值 */
@property (nonatomic, strong) CBCharacteristic *characteristic;
/** 外设状态 */
@property (nonatomic, assign) CBManagerState peripheralState;
/** 接收的数据 */
@property (nonatomic, strong) NSMutableData *reciveData;
/** 接收的数据长度 */
@property (nonatomic, assign) int reciveDataLength;

/** 记录显示 */
@property (nonatomic, strong) UIScrollView *recordScl;
@property (nonatomic, strong) UILabel *recordLab;
@property (nonatomic, strong) NSData *sendData;

@end

@implementation ColaBluetoothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"蓝牙设备"];

    [self setRightNavTitle:@"清空日志"];

    self.listTable.frame = CGRectMake(0, self.originalY, Cola_Width, 100);

    [self.recordScl addSubview:self.recordLab];
    self.recordScl.frame = CGRectMake(0, self.listTable.bottom+105, Cola_Width, Cola_Height-self.listTable.bottom-105);
    [self.view addSubview:self.recordScl];

    [self initTestButton];

    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundColor:ColaHex(0x89B9DE)];

    [self.listTableData removeAllObjects];
    [self.centerManager stopScan];
    self.centerManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    [[ColaShareInstance shareInstance] setaaaaaValue:@"yyyyyyy"];
}

#pragma mark -
#pragma mark - delegate: 当前设备状态更新时的回调
- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    self.peripheralState = central.state;
    switch (central.state) {
        case CBManagerStatePoweredOn:
        {
            CBUUID *uuid = [CBUUID UUIDWithString:@"0000E0FF-3C17-D293-8E48-14FE2E4DA212"];
            [self.centerManager scanForPeripheralsWithServices:@[uuid] options:nil];
        }
            break;
        default:
            NSLog(@"未知状态、重置状态、不支持状态、未授权状态、关闭状态");
            break;
    }
}

#pragma mark -
#pragma mark - 扫描到的设备
- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *,id> *)advertisementData RSSI:(NSNumber *)RSSI
{
    if ([peripheral.name isEqualToString:@"Basic001"] && ![self.listTableData containsObject:peripheral] && [advertisementData.allKeys containsObject:@"kCBAdvDataManufacturerData"]) {
        NSLog(@"蓝牙设备信息 [%@]===[%@]",advertisementData,peripheral);
        peripheral.delegate = self;
        self.cbperipheral = peripheral;
        [self.listTableData addObject:peripheral];
        [self.listTable reloadData];
    }
}

#pragma mark -
#pragma mark - 连接成功
- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral
{
    [self.cbperipheral discoverServices:nil];
}

#pragma mark -
#pragma mark - 扫描到的服务
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(nullable NSError *)error
{
    if (error) {
        NSLog(@"扫描服务错误=[%@]",error.localizedDescription);
        return;
    }
    for (CBService *service in peripheral.services) {
        [self.cbperipheral discoverCharacteristics:nil forService:service];
    }
}

#pragma mark -
#pragma mark - 扫描到对应的特征值
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(nullable NSError *)error
{
    if (error) {
        NSLog(@"扫描特征值错误=[%@]",[error localizedDescription]);
        return;
    }
    
    for (CBCharacteristic *characteristic in service.characteristics) {
        if (characteristic.properties & CBCharacteristicPropertyWrite) {
            self.characteristic = characteristic;
            break;
        } else {
            //NSLog(@"不可写数据，UUID=[%@]",characteristic.UUID);
        }
    }
    if (self.characteristic && self.cbperipheral && [service.UUID.UUIDString isEqualToString:@"0000E0FF-3C17-D293-8E48-14FE2E4DA212"]) {
        [self writeData];
    }
}

- (void)writeData
{
    if (_sendData.length > 50) {
        NSLog(@"需要分包发送...");
        [self showRecordWithData:@"需要分包发送..."];
        NSUInteger count = _sendData.length/50;
        if (_sendData.length%50 != 0) {
            count++;
        }
        NSMutableData *dddd = [NSMutableData dataWithData:_sendData];
        for (int i=1; i<=count; i++) {
            NSUInteger length = 50;
            if (i*50 > _sendData.length) {
                length = _sendData.length - (i-1)*50;
            }
            NSData *d = [dddd subdataWithRange:NSMakeRange((i-1)*50, length)];
            [self.cbperipheral writeValue:d forCharacteristic:self.characteristic type:CBCharacteristicWriteWithResponse];
        }
    } else {
        [self.cbperipheral writeValue:_sendData forCharacteristic:self.characteristic type:CBCharacteristicWriteWithResponse];
    }
}


#pragma mark -
#pragma mark - 写入数据后的回调
- (void)peripheral:(CBPeripheral*)peripheral didWriteValueForCharacteristic:(nonnull CBCharacteristic *)characteristic error:(nullable NSError *)error
{
    if (error) {
        NSLog(@"写入数据错误[%@]",error);
        return;
    }
    [self.cbperipheral setNotifyValue:YES forCharacteristic:characteristic];
    //[self.cbperipheral readValueForCharacteristic:characteristic];
}

#pragma mark -
#pragma mark - 根据特征读到数据
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error
{
    [self showRecordWithData:ColaString(@"接收数据时间 [%@]",[NSDate date])];
    [self showRecordWithData:@"接收到的原始数据: "];
    [self showRecordWithData:characteristic.value];
    NSMutableData *data = [NSMutableData dataWithData:characteristic.value];
    if ([KSBleReciveDataManage checkPackageHeaderData:data]) {
        _reciveData = [NSMutableData data];
        [_reciveData appendData:data];
        _reciveDataLength = [KSBleReciveDataManage parsePackageDataLength:_reciveData];
        if (_reciveDataLength == _reciveData.length - 8) {
            //  对返回的数据进行hash校验
            [self parseBleData];
        }
    } else {
        if (_reciveData.length-8 < _reciveDataLength) {
            [_reciveData appendData:data];
        } else {
            [self showRecordWithData:@"异常数据"];
            [self showRecordWithData:data];
        }
        if (_reciveDataLength == _reciveData.length - 8) {
            //  对返回的数据进行hash校验
            [self parseBleData];
        }
    }
}

- (void)parseBleData
{
    if ([KSBleReciveDataManage checkPackageHash:_reciveData]) {
        [self showRecordWithData:@"接收到的完整数据: "];
        [self showRecordWithData:_reciveData];
        [self showRecordWithData:@"接收到的数据指令码: "];
        int orderInt = [KSBleReciveDataManage parsePackageOrder:_reciveData];
        [self showRecordWithData:ColaString(@"%d",orderInt)];
        [self showRecordWithData:@"接收到的解析后的数据: "];
        id contentData = [KSBleReciveDataManage parsePackageContent:_reciveData];
        NSLog(@"===== %@ =====",contentData);
        [self showRecordWithData:contentData];
        if (21 == orderInt) {
            if ([[contentData allKeys] containsObject:@"request_type"] && 3 == [contentData[@"request_type"] intValue]) {
                NSLog(@"========== Finish ==========");
                [self showRecordWithData:@"========== Finish =========="];
                [self showRecordWithData:@"签名数据结果："];
                [self showRecordWithData:contentData];
                NSLog(@"%@",contentData);
            } else {
                if ([contentData[@"payload"][@"request_type"] intValue] == 0) {
                    NSLog(@"========== Input ==========");
                    [self showRecordWithData:@"========== Input =========="];
                    [self showRecordWithData:[self txActInputData]];
                    _sendData = [self txActInputData];
                    [self writeData];
                } else if ([contentData[@"payload"][@"request_type"] intValue] == 1) {
                    NSLog(@"========== Output ==========");
                    [self showRecordWithData:@"========== Output =========="];
                    [self showRecordWithData:[self txActOutputData]];
                    _sendData = [self txActOutputData];
                    [self writeData];
                } else if ([contentData[@"payload"][@"request_type"] intValue] == 2) {
                    NSLog(@"========== Meta ==========");
                    [self showRecordWithData:@"Meta"];
                    [self showRecordWithData:[self txActMetaData]];
                    _sendData = [self txActMetaData];
                    [self writeData];
                } else if ([contentData[@"payload"][@"request_type"] intValue] == 3) {
                    NSLog(@"========== Finish ==========");
                    [self showRecordWithData:@"========== Finish =========="];
                    [self showRecordWithData:@"签名数据结果："];
                    [self showRecordWithData:contentData];
                    NSLog(@"%@",contentData);
                }
            }
        }
    } else {
        [self showRecordWithData:@"hash校验错误"];
    }
}

- (NSData*)txActInputData
{
    NSDictionary *dict = @{
                           @"path":@"m/44'/3'/0'/0/0",
                           @"prev_hash":@"039a6dd92bea5189b3c14e5a838b0d99a9c99e1e5d997e55bfa2856043a93e02",
                           @"amount":@"400000000",
//                           @"script_type":@"P2PKH",
//                           @"sequence":@"0xFFFFFFFF",
                           @"prev_index":@"0"
                           };
    return [KSBleIssuedDataManage manageIssuedDataWithOrder:BLE_BT_IN_MESSAGE_TYPE_TX_ACK content:dict];
}

- (NSData*)txActOutputData
{
    NSDictionary *dict = @{
                           @"address":@"DDaaz8VMQFkzG4aoxcDhtBSxMUbmTLEYMx",
                           @"amount":@"100000000",
//                           @"publickey":@"2030205347278384",
                           };
    return [KSBleIssuedDataManage manageIssuedDataWithOrder:BLE_BT_IN_MESSAGE_TYPE_TX_ACK content:dict];
}

- (NSData*)txActMetaData
{
    NSDictionary *contentDict = @{
                                  @"outputs_count":@1,
                                  @"inputs_count":@1,
                                  @"version":@1,
                                  @"lock_time":@00000000,
                                  @"slip44":@3,
                                  };
    return [KSBleIssuedDataManage manageIssuedDataWithOrder:BLE_BT_IN_MESSAGE_TYPE_TX_ACK content:contentDict];
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    [self showRecordWithData:@"断开连接..."];
}

- (void)peripheral:(CBPeripheral *)peripheral didWriteValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error
{
    NSLog(@"%@",error);
}

#pragma mark -
#pragma mark - 连接失败
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"连接失败=[%@]=[%@]",error,peripheral);
    [self showRecordWithData:ColaString(@"连接失败：[%@]",error)];
    [self showRecordWithData:ColaString(@"连接失败：[%@]",peripheral)];
}

#pragma mark -
#pragma mark - UITableViewDelegate / UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listTableData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ColaBluetoothCell *cell = [tableView dequeueReusableCellWithIdentifier:ColaIdentifiers(ColaBluetoothCell)];
    if (!cell) {
        cell = [[ColaBluetoothCell alloc] initWithReuseIdentifier:ColaIdentifiers(ColaBluetoothCell)];
    }
    cell.data = self.cbperipheral;
    return cell;
}

- (void)showRecordWithData:(id)data
{
    NSString *string = self.recordLab.text;
    string = ColaString(@"%@\n%@",[string isNotEmpty]?string:@"",data);
    self.recordLab.text = string;
    CGSize size = [self.recordLab sizeThatFits:CGSizeMake(Cola_Width - 30, MAXFLOAT)];
    self.recordLab.frame = CGRectMake(15, 15, Cola_Width-30, size.height);
    self.recordScl.contentSize = CGSizeMake(Cola_Width, size.height+30);
}

- (void)initTestButton
{
    CGFloat width = (Cola_Width-50)/4;
    UIButton *pingBtn = [UIButton buttonWithTitle:@"Ping测试" txtColor:[UIColor blackColor] txtFontSize:10.f backgroundImage:nil target:self action:@selector(pingSend)];
    pingBtn.frame = CGRectMake(10, self.listTable.bottom+10, width, 30);
    pingBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:pingBtn];
    UIButton *deviceInfoBtn = [UIButton buttonWithTitle:@"设备信息" txtColor:[UIColor blackColor] txtFontSize:10.f backgroundImage:nil target:self action:@selector(deviceInfoSend)];
    deviceInfoBtn.frame = CGRectMake(pingBtn.right+10, self.listTable.bottom+10, width, 30);
    deviceInfoBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:deviceInfoBtn];
    UIButton *monitorBtn = [UIButton buttonWithTitle:@"监控信息" txtColor:[UIColor blackColor] txtFontSize:10.f backgroundImage:nil target:self action:@selector(monitorSend)];
    monitorBtn.frame = CGRectMake(deviceInfoBtn.right+10, self.listTable.bottom+10, width, 30);
    monitorBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:monitorBtn];
    UIButton *walletNameBtn = [UIButton buttonWithTitle:@"设置名称" txtColor:[UIColor blackColor] txtFontSize:10.f backgroundImage:nil target:self action:@selector(setWalletNameSend)];
    walletNameBtn.frame = CGRectMake(monitorBtn.right+10, self.listTable.bottom+10, width, 30);
    walletNameBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:walletNameBtn];
    
    UIButton *btAccountInfBtn = [UIButton buttonWithTitle:@"比特账户" txtColor:[UIColor blackColor] txtFontSize:10.f backgroundImage:nil target:self action:@selector(btcAccountInfo)];
    btAccountInfBtn.frame = CGRectMake(10, pingBtn.bottom+5, width, 30);
    btAccountInfBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btAccountInfBtn];
    UIButton *btGetAddr = [UIButton buttonWithTitle:@"bt路径取地址" txtColor:[UIColor blackColor] txtFontSize:10.f backgroundImage:nil target:self action:@selector(btcAddrWithPath)];
    btGetAddr.frame = CGRectMake(pingBtn.right+10, pingBtn.bottom+5, width, 30);
    btGetAddr.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btGetAddr];
    UIButton *btSignBtn = [UIButton buttonWithTitle:@"比特签名消息" txtColor:[UIColor blackColor] txtFontSize:10.f backgroundImage:nil target:self action:@selector(btcSign)];
    btSignBtn.frame = CGRectMake(deviceInfoBtn.right+10, pingBtn.bottom+5, width, 30);
    btSignBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btSignBtn];
    UIButton *btSignTxBtn = [UIButton buttonWithTitle:@"比特签名交易" txtColor:[UIColor blackColor] txtFontSize:10.f backgroundImage:nil target:self action:@selector(btcSignTx)];
    btSignTxBtn.frame = CGRectMake(monitorBtn.right+10, pingBtn.bottom+5, width, 30);
    btSignTxBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:btSignTxBtn];
}

- (void)pingSend
{
    NSDictionary *pingDict = @{@"message":@"test_message"};
    _sendData = [KSBleIssuedDataManage manageIssuedDataWithOrder:BLE_BASE_IN_MESSAGE_TYPE_PING_TEST content:pingDict];
    [self showRecordWithData:@"正在下发Ping指令..."];
    [self showRecordWithData:@"指令内容:"];
    [self showRecordWithData:_sendData];
    [self showRecordWithData:ColaString(@"下发数据大小: [%lu]",(unsigned long)_sendData.length)];
    [self showRecordWithData:ColaString(@"下发时间: [%@]",[NSDate date])];
    [self.centerManager connectPeripheral:self.cbperipheral options:nil];
}

- (void)deviceInfoSend
{
    _sendData = [KSBleIssuedDataManage manageIssuedDataWithOrder:BLE_BASE_IN_MESSAGE_TYPE_GET_FEATURES content:@""];
    [self showRecordWithData:@"正在下发获取设备信息指令..."];
    [self showRecordWithData:@"指令内容:"];
    [self showRecordWithData:_sendData];
    [self showRecordWithData:ColaString(@"下发数据大小: [%lu]",(unsigned long)_sendData.length)];
    [self showRecordWithData:ColaString(@"下发时间: [%@]",[NSDate date])];
    [self.centerManager connectPeripheral:self.cbperipheral options:nil];
}

- (void)monitorSend
{
    NSDictionary *contentDict = @{@"coin_type":@[@"0",@"4"]};
    _sendData = [KSBleIssuedDataManage manageIssuedDataWithOrder:4 content:contentDict];
    [self showRecordWithData:@"正在下发获取监控信息指令..."];
    [self showRecordWithData:@"指令内容:"];
    [self showRecordWithData:_sendData];
    [self showRecordWithData:ColaString(@"下发数据大小: [%lu]",(unsigned long)_sendData.length)];
    [self showRecordWithData:ColaString(@"下发时间: [%@]",[NSDate date])];    [self showRecordWithData:ColaString(@"正在下发获取监控信息指令...[%@] + 数据大小 [%lu] + 时间 [%@]",_sendData,(unsigned long)_sendData.length,[NSDate date])];
    [self.centerManager connectPeripheral:self.cbperipheral options:nil];
}

- (void)setWalletNameSend
{
    NSDictionary *contentDict = @{@"wallet_name":@"myWallet"};
    _sendData = [KSBleIssuedDataManage manageIssuedDataWithOrder:6 content:contentDict];
    [self showRecordWithData:@"正在下发设置钱包名称指令..."];
    [self showRecordWithData:@"指令内容:"];
    [self showRecordWithData:_sendData];
    [self showRecordWithData:ColaString(@"下发数据大小: [%lu]",(unsigned long)_sendData.length)];
    [self.centerManager connectPeripheral:self.cbperipheral options:nil];
}

- (void)btcAccountInfo
{
    NSDictionary *contentDict = @{@"bundle":@[@{@"path":@"m/44'/3'/0'"}]};
    _sendData = [KSBleIssuedDataManage manageIssuedDataWithOrder:11 content:contentDict];
    [self showRecordWithData:@"正在下发获取比特系列账户信息指令..."];
    [self showRecordWithData:@"指令内容:"];
    [self showRecordWithData:_sendData];
    [self showRecordWithData:ColaString(@"下发数据大小: [%lu]",(unsigned long)_sendData.length)];
    [self.centerManager connectPeripheral:self.cbperipheral options:nil];
}

- (void)btcAddrWithPath
{
    NSDictionary *contentDict = @{@"bundle":@[@{@"path":@"m/44'/3'/0'/0/0",@"showOnB1":@1}]};
    _sendData = [KSBleIssuedDataManage manageIssuedDataWithOrder:29 content:contentDict];
    [self showRecordWithData:@"正在下发根据路径获取比特系列地址指令..."];
    [self showRecordWithData:@"指令内容:"];
    [self showRecordWithData:_sendData];
    [self showRecordWithData:ColaString(@"下发数据大小: [%lu]",(unsigned long)_sendData.length)];
    [self.centerManager connectPeripheral:self.cbperipheral options:nil];
}

- (void)btcSign
{
    NSDictionary *contentDict = @{@"path":@"m/44'/3'/0'/0/0",@"message":@"messagemessagemessage"};
    _sendData = [KSBleIssuedDataManage manageIssuedDataWithOrder:38 content:contentDict];
    [self showRecordWithData:@"正在下发比特系列签名消息指令..."];
    [self showRecordWithData:@"指令内容:"];
    [self showRecordWithData:_sendData];
    [self showRecordWithData:ColaString(@"下发数据大小: [%lu]",(unsigned long)_sendData.length)];
    [self.centerManager connectPeripheral:self.cbperipheral options:nil];
}

- (void)btcSignTx
{
    NSDictionary *contentDict = @{
                                  @"outputs_count":@1,
                                  @"inputs_count":@1,
                                  @"version":@1,
                                  @"lock_time":@00000000,
                                  @"slip44":@3,
                                  };
    _sendData = [KSBleIssuedDataManage manageIssuedDataWithOrder:15 content:contentDict];
    [self showRecordWithData:@"正在下发比特系列签名交易的指令..."];
    [self showRecordWithData:@"指令内容:"];
    [self showRecordWithData:_sendData];
    [self showRecordWithData:ColaString(@"下发数据大小: [%lu]",(unsigned long)_sendData.length)];
    [self.centerManager connectPeripheral:self.cbperipheral options:nil];
}

- (void)rightNavBarButtonAction:(UIButton *)sender
{
    self.recordLab.text = @"";
    self.recordScl.contentSize = CGSizeMake(Cola_Width, 0);
}


- (UILabel*)recordLab
{
    if (!_recordLab) {
        _recordLab = [UILabel labelWithTxtColor:[UIColor blackColor] txtFontSize:14.f];
        _recordLab.numberOfLines = 0;
    }
    return _recordLab;
}
- (UIScrollView*)recordScl
{
    if (!_recordScl) {
        _recordScl = [UIScrollView new];
    }
    return _recordScl;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
