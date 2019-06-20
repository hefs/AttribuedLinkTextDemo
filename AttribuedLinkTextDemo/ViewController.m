//
//  ViewController.m
//  AttribuedLinkTextDemo
//
//  Created by znkj-iMac-hefs on 2019/6/20.
//  Copyright © 2019 znkj-iMac-hefs. All rights reserved.
//

#import "ViewController.h"
#import "HRAttributedLinkTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HRAttributedLinkTextView *linkTextView = [[HRAttributedLinkTextView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 240)];
    NSString *Str = @"杭州XXX有限公司（以下简称“App”）在此特别提醒您，在注册成为App用户时或登录过程中，请您审慎阅读以下协议，确保您充分理解协议中的各条款内容后再点击同意或不同意（特别是以下划线标识的条款）：《App用户协议》与《App隐私政策》，如果您同意上述协议的约定，请您点击同意并开始使用平台的产品和服务。如您对以上协议内容有任何疑问，可以随时与App客服联系。";
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:Str];
    //段落样式
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    //行间距
    paragraphStyle.lineSpacing = 5;
    //指定段落开始的缩进像素
    paragraphStyle.firstLineHeadIndent = 20;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributedString.length)];
    [attributedString addAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor],
                                      NSFontAttributeName: [UIFont systemFontOfSize:13]} range: NSMakeRange(0, attributedString.length)];
    [linkTextView showAttributedText:attributedString linkTexts:@[@"App用户协议",@"App隐私政策"]];
    linkTextView.linkAction = ^(NSString * _Nonnull linkText) {
        NSLog(@"link action text : %@",linkText);
    };
    [self.view addSubview:linkTextView];
}


@end
