//
//  HRAttributedLinkTextView.h
//  TestTextView
//
//  Created by znkj-iMac-hefs on 2019/6/20.
//  Copyright © 2019 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


/**
 链接文字点击事件

 @param linkText l链接文字
 */
typedef void(^HRAttributedLinkTextActionHandler)(NSString *linkText);

@interface HRAttributedLinkTextView : UITextView

/**
 链接文字的颜色
 */
@property (nonatomic) UIColor *defaultLinkTextColor;

/**
 链接文字字体
 */
@property (nonatomic) UIFont *defaultLinkTextFont;

/**
 是否有下划线
 */
@property (nonatomic) BOOL linkTextUnderlineFlag;

/**
 点击事件回调
 */
@property (nonatomic, copy) HRAttributedLinkTextActionHandler linkAction;

/**
 设置待显示的文本文字及可点击文字

 @param attributedString 待显示的富文本
 @param linkTexts 可点击的文字数组
 */
- (void)showAttributedText:(NSAttributedString *)attributedString linkTexts:(NSArray<NSString *> *)linkTexts;
@end

NS_ASSUME_NONNULL_END
