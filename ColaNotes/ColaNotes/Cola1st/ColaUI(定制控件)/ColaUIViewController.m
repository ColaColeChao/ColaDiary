//
//  ColaUIViewController.m
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/29.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import "ColaUIViewController.h"
#import "KSVCBBorderLabel.h"
#import "KSVCBTextField.h"
#import "KSVCBBottomView.h"
#import "KSVCBCoinButton.h"

@interface ColaUIViewController ()
<UITextFieldDelegate>

@end

@implementation ColaUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //  设置导航栏标题
    [self setNavTitle:@"定制UI"];
    
    //  设置导航栏为自定义的渐变颜色
    [self setNavItemBackgroundColor:ColaHex(0x89B9DE)];
    
    [self textView];
    [self textLabel];
    [self textTextField];
    [self textBottomView];
    [self textArrowButton];
    [self textAttrButton];
}

#pragma mark -
#pragma mark - 定义圆角view
- (void)textView
{
    CGFloat width = 60.f;
    CGFloat space = (Cola_Width - width * 4) / 5;
    UIView *view01 = [UIView new];
    view01.frame = CGRectMake(space, self.originalY + 20, width, 30);
    UIRectCorner corner01 = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomRight;
    [view01 setBorderWithCornerRadius:15 borderWidth:.5 borderColor:[UIColor redColor] fillColor:[UIColor blueColor] corners:corner01];
    [self.view addSubview:view01];
    
    UIView *view02 = [UIView new];
    view02.frame = CGRectMake(view01.right+space, self.originalY + 20, width, 30);
    UIRectCorner corner02 = UIRectCornerTopRight | UIRectCornerBottomRight;
    [view02 setBorderWithCornerRadius:15 borderWidth:.5 borderColor:[UIColor redColor] fillColor:[UIColor redColor] corners:corner02];
    [self.view addSubview:view02];
    
    UIView *view03 = [UIView new];
    view03.frame = CGRectMake(view02.right+space, self.originalY + 20, width, 30);
    UIRectCorner corner03 = UIRectCornerTopLeft | UIRectCornerTopRight;
    [view03 setBorderWithCornerRadius:15 borderWidth:.5 borderColor:[UIColor redColor] fillColor:[UIColor clearColor] corners:corner03];
    [self.view addSubview:view03];
    
    UIView *view04 = [UIView new];
    view04.frame = CGRectMake(view03.right+space, self.originalY + 20, width, 30);
    UIRectCorner corner04 = UIRectCornerTopLeft | UIRectCornerBottomRight;
    [view04 setBorderWithCornerRadius:15 borderWidth:.5 borderColor:[UIColor blackColor] fillColor:[UIColor yellowColor] corners:corner04];
    [self.view addSubview:view04];
}

#pragma mark -
#pragma mark - 定义圆角Label
- (void)textLabel
{
    CGFloat width = 60.f;
    CGFloat space = (Cola_Width - width * 4) / 5;
    KSVCBBorderLabel *label01 = [[KSVCBBorderLabel alloc] initWithFrame:CGRectMake(space, self.originalY + 20 + 50, width, 30)];
    UIRectCorner corner01 = UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomRight;
    [label01 setBorderWithCornerRadius:15 borderWidth:.5 borderColor:[UIColor redColor] fillColor:[UIColor redColor] corners:corner01];
    [self.view addSubview:label01];
    label01.text = @"5.22%";
    
    KSVCBBorderLabel *label02 = [[KSVCBBorderLabel alloc] initWithFrame:CGRectMake(label01.right + space, self.originalY + 20 + 50, width, 30)];
    UIRectCorner corner02 = UIRectCornerTopRight | UIRectCornerBottomRight;
    [label02 setBorderWithCornerRadius:15 borderWidth:.5 borderColor:[UIColor redColor] fillColor:[UIColor redColor] corners:corner02];
    [self.view addSubview:label02];
    label02.text = @"0.45%";
    
    KSVCBBorderLabel *label03 = [[KSVCBBorderLabel alloc] initWithFrame:CGRectMake(label02.right + space, self.originalY + 20 + 50, width, 30)];
    UIRectCorner corner03 = UIRectCornerTopLeft | UIRectCornerTopRight;
    [label03 setBorderWithCornerRadius:15 borderWidth:.5 borderColor:[UIColor redColor] fillColor:[UIColor clearColor] corners:corner03];
    [self.view addSubview:label03];
    label03.text = @"100.00%";
    
    KSVCBBorderLabel *label04 = [[KSVCBBorderLabel alloc] initWithFrame:CGRectMake(label03.right + space, self.originalY + 20 + 50, width, 30)];
    UIRectCorner corner04 = UIRectCornerTopLeft | UIRectCornerBottomRight;
    [label04 setBorderWithCornerRadius:15 borderWidth:.5 borderColor:[UIColor blackColor] fillColor:[UIColor yellowColor] corners:corner04];
    [self.view addSubview:label04];
    label04.text = @"123456";
    label04.textColor = [UIColor redColor];
}

#pragma mark -
#pragma mark - 定制输入框
- (void)textTextField
{
    KSVCBTextField *txtField = [[KSVCBTextField alloc] initWithFrame:CGRectMake(20, self.originalY + 20 + 50 + 50, Cola_Width - 40, 60) delegate:self];
    [txtField loadPlaceholder:@"请输入划转金额" hintMessage:@"请输入整数的划转金额" rightMessage:@"全部"];
    txtField.keyboardType = UIKeyboardTypeDecimalPad;
    [self.view addSubview:txtField];
    [txtField addRightViewTarget:self action:@selector(arrowButtonAction)];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSArray *limits = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@".",@""];
    if (![limits containsObject:string]) {
        return NO;
    }
    if ([textField.text containsString:@"."] && [string isEqualToString:@"."]) {
        return NO;
    }
    if (![textField.text containsString:@"."] && [textField.text isEqualToString:@"0"] && [string isEqualToString:@"0"]) {
        return NO;
    }
    NSString *appendString = [textField.text stringByAppendingString:string];
    return [appendString judgeInputDigitsInt:10];
}

#pragma mark -
#pragma mark - 底部提醒视图
- (void)textBottomView
{
    KSVCBBottomView *bottomView01 = [[KSVCBBottomView alloc] initWithFrame:CGRectMake(20, self.originalY + 20 + 50 + 50 + 80, Cola_Width - 40, 85) vcbViewType:KSVCBBottomViewTypePledge];
    [self.view addSubview:bottomView01];
}

#pragma mark -
#pragma mark - 定制下拉按钮
- (void)textArrowButton
{
    CGRect rect = CGRectMake(20, self.originalY + 20 + 50 + 50 + 80 + 105, Cola_Width - 40, 44);
    KSVCBCoinButton *button = [[KSVCBCoinButton alloc] initWithFrame:rect target:self action:@selector(arrowButtonAction)];
    button.text = @"BTC";
    [self.view addSubview:button];
}
- (void)arrowButtonAction
{
    NSLog(@"下拉按钮点了,下拉按钮点了");
}

#pragma mark -
#pragma mark - 富文本按钮
- (void)textAttrButton
{
    NSString *hint02 = @"追加质押物";
    NSString *hint01 = [@"质押物总市值降低，有平仓风险，建议 " stringByAppendingString:hint02];
    NSRange range = [hint01 rangeOfString:hint02];
    NSMutableAttributedString *mutableString = [[NSMutableAttributedString alloc]initWithString:hint01];
    [mutableString addAttribute:NSForegroundColorAttributeName
                          value:[UIColor redColor]
                          range:range];
    UIButton *button = [UIButton buttonWithTitle:@"" txtColor:[UIColor redColor] txtFontSize:14.f image:nil target:self action:@selector(arrowButtonAction)];
    [button setAttributedTitle:mutableString forState:UIControlStateNormal];
    button.frame = CGRectMake(20, self.originalY + 20 + 50 + 50 + 80 + 105 + 64, Cola_Width - 40, 44);
    [self.view addSubview:button];
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
