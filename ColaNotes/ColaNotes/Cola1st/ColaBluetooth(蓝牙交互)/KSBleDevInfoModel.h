//
//  KSBleDevInfoModel.h
//  ColaNotes
//
//  Created by 可乐超 on 2018/10/16.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "KSBleBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSBleDevInfoModel : KSBleBaseModel
/** 批次号  */
@property (nonatomic, copy) NSString *batch;
/** 设备ID（CPU_ID） */
@property (nonatomic, copy) NSString *device_ID;
/** 钱包ID */
@property (nonatomic, copy) NSString *wallet_ID;
/** 钱包名称 */
@property (nonatomic, copy) NSString *wallet_name;
/** 当前钱包版本 */
@property (nonatomic, copy) NSString *wallet_version;
/** 语言 */
@property (nonatomic, copy) NSString *language;
/** majorVersion */
@property (nonatomic, copy) NSString *major_version;
/** minor_version */
@property (nonatomic, copy) NSString *minor_version;
/** patch_version */
@property (nonatomic, copy) NSString *patch_version;
/** bootloader_mode */
@property (nonatomic, copy) NSString *bootloader_mode;
/** pin_protection */
@property (nonatomic, copy) NSString *pin_protection;
/** passphrase_protection */
@property (nonatomic, copy) NSString *passphrase_protection;
/** initialized */
@property (nonatomic, copy) NSString *initialized;
/** revision */
@property (nonatomic, copy) NSString *revision;
/** bootloader_hash */
@property (nonatomic, copy) NSString *bootloader_hash;
/** imported */
@property (nonatomic, copy) NSString *imported;
/** pin_cached  */
@property (nonatomic, copy) NSString *pin_cached;
/** passphrase_cached */
@property (nonatomic, copy) NSString *passphrase_cached;
/** firmware_present */
@property (nonatomic, copy) NSString *firmware_present;
/** needs_backup */
@property (nonatomic, copy) NSString *needs_backup;
/** flags */
@property (nonatomic, copy) NSString *flags;
/** model */
@property (nonatomic, copy) NSString *model;
/** fw_major */
@property (nonatomic, copy) NSString *fw_major;
/** fw_minor */
@property (nonatomic, copy) NSString *fw_minor;
/** fw_patch */
@property (nonatomic, copy) NSString *fw_patch;
/** fw_vendor */
@property (nonatomic, copy) NSString *fw_vendor;
/** fw_vendor_keys */
@property (nonatomic, copy) NSString *fw_vendor_keys;
/** unfinished_backup */
@property (nonatomic, copy) NSString *unfinished_backup;

@end

NS_ASSUME_NONNULL_END
