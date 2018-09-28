//
//  ColaArrayViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2018/9/28.
//  Copyright © 2018年 可乐超. All rights reserved.
//

#import "ColaArrayViewController.h"

@interface ColaArrayViewController ()

@end

@implementation ColaArrayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<9000000; i++) {
        [array addObject:ColaString(@"%d",i)];
    }
    NSInteger count = array.count;
    
    
    //  1. 并行队列，迭代遍历数组
    NSLog(@"并行队列迭代开始[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    dispatch_queue_t queue =dispatch_queue_create("apply并行队列", DISPATCH_QUEUE_CONCURRENT);
    dispatch_apply(count, queue, ^(size_t index) {
        //NSLog(@"%@",array[index]);
    });
    NSLog(@"并行队列迭代结束[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    
    //  2. forin循环遍历
    NSLog(@"forin循环开始[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    for (NSString *string in array) {
        //NSLog(@"%@",string);
    }
    NSLog(@"forin循环结束[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    
    //  3. for循环遍历
    NSLog(@"for循环开始[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    for (int i=0; i<count; i++) {
        //NSLog(@"%@",array[i]);
    }
    NSLog(@"for循环结束[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    
    //  4. NSEnumerator快速枚举遍历
    NSLog(@"NSEnumerator开始[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    NSEnumerator *enumber = [array objectEnumerator];
    NSString *string;
    while (string == [enumber nextObject]) {
        //NSLog(@"%@",string);
    }
    NSLog(@"NSEnumerator结束[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    
    //  5. 快速枚举遍历
    NSLog(@"快速遍历开始[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //NSLog(@"%@",array[idx]);
    }];
    NSLog(@"快速遍历结束[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    
    //  6. 匹配遍历查询
    NSArray *data = @[
                      @{@"a":@"1",@"b":@"abc",@"c":@"123"},
                      @{@"a":@"2",@"b":@"dcf",@"c":@"456"},
                      @{@"a":@"6",@"b":@"ghi",@"c":@"789"},
                      @{@"a":@"1",@"b":@"jkl",@"c":@"101"},
                                ];
    NSLog(@"匹配遍历开始[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"a == '1'"];
    NSArray *results = [data filteredArrayUsingPredicate:predicate];
    NSLog(@"匹配遍历结束[%f]",[[NSDate date] timeIntervalSince1970]*1000);
    NSLog(@"%@",results);
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
