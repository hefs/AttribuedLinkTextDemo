//
//  HRAttributedLinkTextView.m
//  TestTextView
//
//  Created by znkj-iMac-hefs on 2019/6/20.
//  Copyright © 2019 JG. All rights reserved.
//

#import "HRAttributedLinkTextView.h"

@interface HRAttributedLinkTextView ()<UITextViewDelegate>
@property(nonatomic) NSArray *linkStrings;
@end

@implementation HRAttributedLinkTextView



/**
 禁用UITextView的长按弹出按钮事件
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    // 返回NO为禁用，YES为开启
    // 粘贴
    if (action == @selector(paste:)) return NO;
    // 剪切
    if (action == @selector(cut:)) return NO;
    // 复制
    if (action == @selector(copy:)) return NO;
    // 选择
    if (action == @selector(select:)) return NO;
    // 选中全部
    if (action == @selector(selectAll:)) return NO;
    // 删除
    if (action == @selector(delete:)) return NO;
    // 分享
    if (action == @selector(share)) return NO;
    return [super canPerformAction:action withSender:sender];
}


/**
 取消UITextView的编辑事件，避免弹出键盘

 @return NO
 */
- (BOOL)canBecomeFirstResponder {
    return NO;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefaultValues];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setDefaultValues];
}


/**
 设置默认属性
 */
- (void)setDefaultValues{
    _defaultLinkTextFont = [UIFont systemFontOfSize:14];
    _defaultLinkTextColor = [UIColor blueColor];
    _linkTextUnderlineFlag = YES;
    self.editable = NO;
//    self.selectable = NO;
    self.delegate = self;
//    self.linkTextAttributes = @{NSBackgroundColorAttributeName:[UIColor clearColor]};
}

- (void)showAttributedText:(NSAttributedString *)attributedString linkTexts:(NSArray<NSString *> *)linkTexts{
    NSMutableAttributedString *showAttributedText = attributedString.mutableCopy;
    _linkStrings = linkTexts;
    NSString *showText = attributedString.string;
    for (NSString *linkText in linkTexts) {
        NSRange range = [showText rangeOfString:linkText];
        [showAttributedText addAttributes:@{
                                            NSFontAttributeName:_defaultLinkTextFont,
                                            NSForegroundColorAttributeName:_defaultLinkTextColor,
                                            NSLinkAttributeName:@"url://"
                                            } range:range];
        if (_linkTextUnderlineFlag) {
            [showAttributedText addAttributes:@{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)} range:range];
        }
    }
    self.attributedText = showAttributedText;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    if ([URL.scheme isEqualToString:@"url"] && _linkAction) {
        NSString *string = [textView.attributedText.string substringWithRange:characterRange];
        _linkAction(string);
        return NO;
    }
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(nonnull NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_AVAILABLE(ios(10.0)){
    if ([URL.scheme isEqualToString:@"url"] && _linkAction) {
        NSString *string = [textView.attributedText.string substringWithRange:characterRange];
        _linkAction(string);
        return NO;
    }
    return YES;
}


/**
 禁用UITextView的长按手势
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    NSLog(@"%@",gestureRecognizer);
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
        return NO;
    }
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
