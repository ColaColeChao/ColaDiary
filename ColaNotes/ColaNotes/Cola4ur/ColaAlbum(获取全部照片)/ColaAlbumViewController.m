//
//  ColaAlbumViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/3.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaAlbumViewController.h"
#import <Photos/Photos.h>


@interface ColaAlbumViewController ()

@end

@implementation ColaAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"获取全部照片"];
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundStartColor:ColaHex(0xB9E9CE) endColor:ColaHex(0xBDE7DA)];
    
    [self setRightNavTitle:@"获取"];
}

#pragma mark -
#pragma mark - 获取手机相册权限
- (void)rightNavBarButtonAction:(UIButton *)sender
{
    __ColaWeakSelf(weak);
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        switch (status) {
            case PHAuthorizationStatusAuthorized:
                NSLog(@"用户已授权");
                [weak getPhoneAllPhotos];
                break;
            case PHAuthorizationStatusDenied:
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    ColaAlert *alert = [ColaAlert new];
                    [alert alertWithTitle:@"提示" desc:@"未授权系统相册权限，请到系统设置中修改权限后再使用" cancelTitle:nil sureTitle:@"我知道了"];
                });
            }
                NSLog(@"禁止使用");
                break;
            case PHAuthorizationStatusRestricted:
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    ColaAlert *alert = [ColaAlert new];
                    [alert alertWithTitle:@"提示" desc:@"未授权系统相册权限，请到系统设置中检查权限设置" cancelTitle:nil sureTitle:@"我知道了"];
                });
            }
                NSLog(@"其他原因造成的无权限使用");
                break;
            case PHAuthorizationStatusNotDetermined:
                NSLog(@"用户未授权");
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    ColaAlert *alert = [ColaAlert new];
                    [alert alertWithTitle:@"提示" desc:@"未授权系统相册权限，请到系统设置中修改权限后再使用" cancelTitle:nil sureTitle:@"我知道了"];
                });
            }
                break;
            default:
                break;
        }
    }];
}

#pragma mark -
#pragma mark - 获取手机全部照片+视频
- (void)getPhoneAllPhotos
{
    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    for (NSInteger i = 0; i < smartAlbums.count; i++) {
        PHAssetCollection *assetCollection = smartAlbums[i];
        NSLog(@"=================================");
        NSLog(@"%ld",(long)assetCollection.assetCollectionType);
        NSLog(@"%ld",(long)assetCollection.assetCollectionSubtype);
        NSLog(@"%lu",(unsigned long)assetCollection.estimatedAssetCount);
        NSLog(@"%@",assetCollection.localizedLocationNames);
        NSLog(@"%@",assetCollection.startDate);
        NSLog(@"%@",assetCollection.endDate);
    }
}

- (NSArray *)getAllPhotosAssetInAblumCollection:(PHAssetCollection *)assetCollection ascending:(BOOL)ascending
{
    // 存放所有图片对象
    NSMutableArray *assets = [NSMutableArray array];
    
    // 是否按创建时间排序
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:ascending]];
    option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
    
    // 获取所有图片对象
    PHFetchResult *result = [PHAsset fetchAssetsInAssetCollection:assetCollection options:option];
    // 遍历
    [result enumerateObjectsUsingBlock:^(PHAsset *asset, NSUInteger idx, BOOL * _Nonnull stop) {
        [assets addObject:asset];
    }];
    return assets;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
