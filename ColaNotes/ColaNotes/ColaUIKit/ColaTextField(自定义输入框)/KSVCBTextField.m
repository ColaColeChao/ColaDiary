//
//  KSVCBTextField.m
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/29.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import "KSVCBTextField.h"

@interface KSVCBTextField ()
/** 背景 */
@property (nonatomic, strong) UIView *backView;
/** 输入框 */
@property (nonatomic, strong) UITextField *inputTxt;
/** 输入框底部提示语 */
@property (nonatomic, strong) UILabel *hintLab;
/** 输入框右部提示 */
@property (nonatomic, strong) UILabel *rightLab;
@end

@implementation KSVCBTextField

- (instancetype)initWithFrame:(CGRect)frame delegate:(id)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.inputTxt.delegate = delegate;
        [self addSubview:self.backView];
        [self addSubview:self.inputTxt];
        [self addSubview:self.hintLab];
        [self addSubview:self.rightLab];
    }
    return self;
}

- (void)loadPlaceholder:(NSString *)placeholder hintMessage:(NSString *)hintMessage rightMessage:(NSString *)rightMessage
{
    self.inputTxt.placeholder = placeholder;
    self.hintLab.text = hintMessage;
    self.rightLab.text = rightMessage;
    CGSize rightSize = [self.rightLab sizeThatFits:CGSizeMake(self.width * .5, self.height * .6)];
    self.hintLab.frame = CGRectMake(15, self.height * .6+5, self.width - 20, self.height * .4 - 5);
    self.rightLab.frame = CGRectMake(self.width - rightSize.width - 20, 0, rightSize.width, self.height * .6);
    self.inputTxt.frame = CGRectMake(15, 0, self.rightLab.x - 15 - 10, self.height * .6);
    self.hintLab.textColor = [UIColor lightGrayColor];
    self.backView.frame = CGRectMake(0, 0, self.width, self.height * .6);
}

- (void)addRightViewTarget:(id)target action:(SEL)action
{
    self.rightLab.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self.rightLab addGestureRecognizer:tap];
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType
{
    _keyboardType = keyboardType;
    self.inputTxt.keyboardType = keyboardType;
}

- (UIView*)backView
{
    if (!_backView) {
        _backView = [UIView new];
        _backView.layer.cornerRadius = self.height * .6 * .5;
        _backView.layer.borderWidth = .5f;
        _backView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _backView;
}
- (UITextField*)inputTxt
{
    if (!_inputTxt) {
        _inputTxt = [UITextField new];
        _inputTxt.font = [UIFont systemFontOfSize:14.f];
        _inputTxt.textColor = [UIColor darkGrayColor];
    }
    return _inputTxt;
}
- (UILabel*)hintLab
{
    if (!_hintLab) {
        _hintLab = [UILabel labelWithTitle:@"" txtColor:[UIColor lightGrayColor] txtFont:[UIFont systemFontOfSize:14.f]];
    }
    return _hintLab;
}
- (UILabel*)rightLab
{
    if (!_rightLab) {
        _rightLab = [UILabel labelWithTitle:@"" txtColor:[UIColor darkGrayColor] txtFont:[UIFont systemFontOfSize:14.f]];
    }
    return _rightLab;
}

@end
