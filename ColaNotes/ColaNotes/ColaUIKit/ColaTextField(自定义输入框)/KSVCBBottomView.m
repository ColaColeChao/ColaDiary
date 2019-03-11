//
//  KSVCBBottomView.m
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/28.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import "KSVCBBottomView.h"

@implementation KSVCBBottomView

- (instancetype)initWithFrame:(CGRect)frame vcbViewType:(KSVCBBottomViewType)vcbViewType
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *hintLab_01 = [UILabel labelWithTxtColor:[UIColor lightGrayColor] txtFont:[UIFont systemFontOfSize:14.f] alignment:NSTextAlignmentCenter];
        hintLab_01.text = @"市场有风险，交易需谨慎";
        hintLab_01.adjustsFontSizeToFitWidth = YES;
        hintLab_01.frame = CGRectMake(15, 15, frame.size.width - 30, 20);
        [self addSubview:hintLab_01];
        
        NSString *hintString_01 = @"";
        NSString *hintString_02 = @"  帮助中心  Support@vcb.com";
        if (KSVCBBottomViewTypeMargin == vcbViewType) {
            hintString_01 = @"VCB杠杆交易业务";
        } else if (KSVCBBottomViewTypePledge == vcbViewType) {
            hintString_01 = @"VCB质押借款业务";
        } else if (KSVCBBottomViewTypeFinance == vcbViewType) {
            hintString_01 = @"VCB理财交易业务";
        }
        UILabel *hintLab_02 = [UILabel labelWithTxtColor:[UIColor darkGrayColor] txtFont:[UIFont systemFontOfSize:14.f] alignment:NSTextAlignmentCenter];
        hintLab_02.adjustsFontSizeToFitWidth = YES;
        hintLab_02.text = [hintString_01 stringByAppendingString:hintString_02];
        hintLab_02.frame = CGRectMake(15, hintLab_01.bottom + 15, frame.size.width - 30, 20);
        [self addSubview:hintLab_02];
        
        NSString *hintString = [hintString_01 stringByAppendingString:hintString_02];
        NSRange range = [hintString rangeOfString:hintString_02];
        NSMutableAttributedString *hintAttr = [[NSMutableAttributedString alloc] initWithString:hintString];
        [hintAttr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:range];
        hintLab_02.attributedText = hintAttr;
        
        if (CGRectEqualToRect(frame, CGRectZero)) {
            self.frame = CGRectMake(0, 0, frame.size.width, hintLab_02.bottom + 15);
        } else {
            self.frame = frame;
        }
    }
    return self;
}

@end
