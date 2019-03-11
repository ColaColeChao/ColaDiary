
//
//  KSBleConstDefine.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#ifndef KSBleConstDefine_h
#define KSBleConstDefine_h


/** 蓝牙收发数据的包头数据 */
#define BLE_PACKAGE_HEADER @"COLD"


/********** 热端下发的相关蓝牙基础指令 *********/
/********** ↓↓↓↓↓↓↓↓↓↓↓↓↓ *********/
/** 测试Ping指令 */
#define BLE_BASE_IN_MESSAGE_TYPE_PING_TEST 1
/** 获取监控地址信息的指令 */
#define BLE_BASE_IN_MESSAGE_TYPE_GET_MONITOR_ADDR 4
/** 自定义设置钱包名称的指令 */
#define BLE_BASE_IN_MESSAGE_TYPE_SET_WALLET_NAME 6
/** 校验钱包的指令 */
#define BLE_BASE_IN_MESSAGE_TYPE_CHECK_WALLET 8
/** 获取完成的蓝牙设备信息的指令 */
#define BLE_BASE_IN_MESSAGE_TYPE_GET_FEATURES 55
/** 取消当前操作的指令 */
#define BLE_BASE_IN_MESSAGE_TYPE_CANCEL 20
/** 清除蓝牙设备缓存数据的指令 */
#define BLE_BASE_IN_MESSAGE_TYPE_CLEAR_SESSION 24


/********** 接收蓝牙设备的相关基础指令 *********/
/********** ↓↓↓↓↓↓↓↓↓↓↓↓↓ *********/
/** 测试Ping成功返回的指令，对应指令1 */
#define BLE_BASE_OUT_MESSAGE_TYPE_PING_TEST_SUCCESS 2
/** 测试Ping失败返回的指令，对应指令1 */
#define BLE_BASE_OUT_MESSAGE_TYPE_PING_FAIL 3
/** 获取监控地址返回的监控数据指令，对应指令4 */
#define BLE_BASE_OUT_MESSAGE_TYPE_GET_MONITOR_ADDR 5
/** 设置钱包名称返回的指令，对应指令6 */
#define BLE_BASE_OUT_MESSAGE_TYPE_SET_WALLET_NAME 7
/** 校验钱包返回的指令，对应指令8 */
#define BLE_BASE_OUT_MESSAGE_TYPE_CHECK_WALLET 9
/** 获取蓝牙设备信息返回的指令，对应指令55 */
#define BLE_BASE_OUT_MESSAGE_TYPE_GET_FEATURES 17


/********** 热端下发比特系列的相关蓝牙指令 *********/
/********** ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ *********/
/** 获取一个或多个账户信息 */
#define BLE_BT_IN_MESSAGE_TYPE_GET_PUBLIC_KEY 11
/** 签名交易指令 */
#define BLE_BT_IN_MESSAGE_TYPE_SIGN_TX 15
/** 根据B1需求向蓝牙设备传递数据的指令 */
#define BLE_BT_IN_MESSAGE_TYPE_TX_ACK 22
/** 获取一个或多个地址的路径 */
#define BLE_BT_IN_MESSAGE_TYPE_GET_ADDR_PATH 29
/** 签名消息的指令 */
#define BLE_BT_IN_MESSAGE_TYPE_SIGN_MESSAGE 38
/** 获取验证签名消息的结果指令 */
#define BLE_BT_IN_MESSAGE_TYPE_VERIFY_MESSAGE 39
/** 添加主链的指令 */
#define BLE_BT_IN_MESSAGE_TYPE_CHAIN_ADD 16
/** 修改主链的指令 */
#define BLE_BT_IN_MESSAGE_TYPE_CHAIN_CHANGE 17


/********** 接收蓝牙设备的相关比特系列指令 *********/
/********** ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ *********/
/** 获取账户详情返回的指令，对应指令11 */
#define BLE_BT_OUT_MESSAGE_TYPE_GET_PUBLIC_KEY 12
/** 向热端索要签名交易数据的指令，对应指令15 */
#define BLE_BT_OUT_MESSAGE_TYPE_TX_REQUEST 21
/** 获取地址路径返回的指令，对应指令29 */
#define BLE_BT_OUT_MESSAGE_TYPE_GET_ADDR_PATH 30
/** 签名消息结果返回的指令，对应指令38、39 */
#define BLE_BT_OUT_MESSAGE_TYPE_SIGNATURE 40
/** 添加/修改主链结果返回的指令，对应指令16、17 */
#define BLE_BT_OUT_MESSAGE_TYPE_CHAIN 18


/********** 热端下发以太系列的相关蓝牙指令 *********/
/********** ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ *********/
/** 获取一个或多个地址的指令 */
#define BLE_ET_IN_MESSAGE_TYPE_GET_ADDR 56
/** 签名交易指令 */
#define BLE_ET_IN_MESSAGE_TYPE_SIGN_TX 58
/** 根据B1需求向蓝牙设备传递数据的指令 */
#define BLE_ET_IN_MESSAGE_TYPE_TX_ACK 60
/** 签名消息的指令 */
#define BLE_ET_IN_MESSAGE_TYPE_SIGN_MESSAGE 64
/** 获取验证签名消息的结果指令 */
#define BLE_ET_IN_MESSAGE_TYPE_VERIFY_MESSAGE 65


/********** 接收蓝牙设备的相关以太系列指令 *********/
/********** ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ *********/
/** 获取账户详情返回的指令，对应指令56 */
#define BLE_ET_OUT_MESSAGE_TYPE_GET_PUBLIC_KEY 57
/** 向热端索要签名交易数据的指令，对应指令58 */
#define BLE_ET_OUT_MESSAGE_TYPE_TX_REQUEST 59
/** 获取地址路径返回的指令，对应指令29 */
#define BLE_ET_OUT_MESSAGE_TYPE_GET_ADDR_PATH 30
/** 签名消息结果返回的指令，对应指令64、65 */
#define BLE_ET_OUT_MESSAGE_TYPE_SIGNATURE 40


#endif /* KSBleConstDefine_h */
