//
//  KSVCBBorderLabel.m
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/29.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import "KSVCBBorderLabel.h"

@interface KSVCBBorderLabel ()
/** 显示的文本 */
@property (nonatomic, strong) UILabel *textLab;
@end

@implementation KSVCBBorderLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textLab.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    }
    return self;
}

- (void)setText:(NSString *)text
{
    self.textLab.text = text;
    [self.textLab removeFromSuperview];
    [self addSubview:self.textLab];
}

- (void)setTextColor:(UIColor *)textColor
{
    self.textLab.textColor = textColor;
}

- (UILabel*)textLab
{
    if (!_textLab) {
        _textLab = [UILabel labelWithTxtColor:[UIColor blackColor] txtFontSize:14.f alignment:NSTextAlignmentCenter];
    }
    return _textLab;
}

@end
