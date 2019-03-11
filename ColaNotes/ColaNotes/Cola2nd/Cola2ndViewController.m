//
//  Cola2ndViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/8/29.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "Cola2ndViewController.h"

@interface Cola2ndViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@end

@implementation Cola2ndViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"2nd"];
    
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundColor:ColaHex(0x95ACE6)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.layer.borderWidth = .5;
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.frame = CGRectMake(20, 100, Cola_Width - 40, 44);
    [button addTarget:self action:@selector(cccccccccccccccc:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"\t比特币(BTC)" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.view addSubview:button];
}

- (void)cccccccccccccccc:(UIButton*)sender
{
    if (!self.table) {
        self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, sender.height, sender.width, 0) style:UITableViewStylePlain];
        self.table.delegate = self;
        self.table.dataSource = self;
        [sender addSubview:self.table];
    }
    __ColaWeakSelf(weak);
    [UIView animateWithDuration:.2 animations:^{
        if (.0 == weak.table.height) {
            weak.table.height = 120.f;
        } else {
            weak.table.height = 0.f;
        }
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ColaIdentifiers(UITableViewCell)];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ColaIdentifiers(UITableViewCell)];
    }
    cell.textLabel.text = ColaString(@"请选择第%ld个cell",(long)indexPath.row);
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.height = .0f;
    [tableView removeFromSuperview];
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
