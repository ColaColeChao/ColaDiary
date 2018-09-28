//
//  Cola1stViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "Cola1stViewController.h"
#import "Cola1stCell.h"
#import "ColaScanViewController.h"
#import "ColaArrayViewController.h"

@interface Cola1stViewController ()
<UICollectionViewDataSource,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>
/** 集合视图 */
@property (nonatomic, strong) UICollectionView *mainCollectionView;

@end

@implementation Cola1stViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"1st"];
    
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundColor:ColaHex(0x89B9DE)];
    
    [self.view addSubview:self.mainCollectionView];
    
    [self.mainCollectionView registerClass:[Cola1stCell class] forCellWithReuseIdentifier:ColaIdentifiers(Cola1stCell)];
}

#pragma mark -
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cola1stCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ColaIdentifiers(Cola1stCell) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    NSArray *titles = @[@"Scan",@"Array遍历"];
    [cell loadCellTitle:titles[indexPath.row]];
    return cell;
}

#pragma mark -
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 80);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}

#pragma mark -
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            ColaScanViewController *scanVc = [[ColaScanViewController alloc] init];
            [self.navigationController pushViewController:scanVc animated:YES];
        }
            break;
        case 1:
        {
            ColaArrayViewController *arrayVc = [[ColaArrayViewController alloc] init];
            [self.navigationController pushViewController:arrayVc animated:YES];
        }
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark - 懒加载部分
- (UICollectionView*)mainCollectionView
{
    if (!_mainCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.originalY, Cola_Width, self.mainViewHeight) collectionViewLayout:flowLayout];
        _mainCollectionView.dataSource = self;
        _mainCollectionView.delegate = self;
        _mainCollectionView.backgroundColor = [UIColor whiteColor];
    }
    return _mainCollectionView;
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
