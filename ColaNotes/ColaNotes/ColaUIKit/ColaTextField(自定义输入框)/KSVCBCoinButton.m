//
//  KSVCBCoinButton.m
//  ColaNotes
//
//  Created by 可乐超 on 2019/1/29.
//  Copyright © 2019 可乐超. All rights reserved.
//

#import "KSVCBCoinButton.h"

@interface KSVCBCoinButton ()
/** 标题文字 */
@property (nonatomic, strong) UILabel *titleLab;
/** 右侧图标 */
@property (nonatomic, strong) UIImageView *rightImageView;
@end

@implementation KSVCBCoinButton

- (instancetype)initWithFrame:(CGRect)frame target:(id)target action:(SEL)action
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titleLab];
        [self addSubview:self.rightImageView];
        
        self.layer.cornerRadius = frame.size.height * .5;
        self.layer.borderWidth = .5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        UIImage *image = [UIImage imageNamed:@"cola_common_arrow"];
        _rightImageView.image = image;
        self.rightImageView.frame = CGRectMake(frame.size.width - frame.size.height, 0, frame.size.height, frame.size.height);
        self.titleLab.frame = CGRectMake(20, 0, self.rightImageView.x - 20, frame.size.height);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setText:(NSString *)text
{
    self.titleLab.text = text;
}

- (UILabel*)titleLab
{
    if (!_titleLab) {
        _titleLab = [UILabel labelWithTxtColor:[UIColor darkGrayColor] txtFont:[UIFont systemFontOfSize:14.f]];
    }
    return _titleLab;
}
- (UIImageView*)rightImageView
{
    if (!_rightImageView) {
        _rightImageView = [UIImageView new];
        _rightImageView.userInteractionEnabled = YES;
    }
    return _rightImageView;
}

@end
