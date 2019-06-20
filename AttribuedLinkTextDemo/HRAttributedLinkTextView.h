//
//  HRAttributedLinkTextView.h
//  TestTextView
//
//  Created by znkj-iMac-hefs on 2019/6/20.
//  Copyright © 2019 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^HRAttributedLinkTextActionHandler)(NSString *linkText);

@interface HRAttributedLinkTextView : UITextView
@property (nonatomic) UIColor *defaultLinkTextColor;
@property (nonatomic) UIFont *defaultLinkTextFont;
@property (nonatomic) BOOL linkTextUnderlineFlag;
@property (nonatomic, copy) HRAttributedLinkTextActionHandler linkAction;
- (void)showAttributedText:(NSAttributedString *)attributedString linkTexts:(NSArray<NSString *> *)linkTexts;
@end

NS_ASSUME_NONNULL_END
