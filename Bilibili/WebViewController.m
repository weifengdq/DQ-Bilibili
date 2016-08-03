
//
//  WebViewController.m
//  Bilibili
//
//  Created by weifengdq on 16/7/8.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "WebViewController.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
//    NSString *urlStr = @"http://www.bilibili.com/video/av5239292/";
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    
//    UIWebView *webview = [[UIWebView alloc]init];
//    //webview.frame = self.view.frame;
//    webview.frame = CGRectMake(0, -44, SCREEN_WIDTH, SCREEN_HEIGHT + 110);
//    [webview loadRequest:request];
//    
//    [self.view addSubview:webview];
//    
//    
//    UIView *topView = [[UIView alloc] init];
//    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
//    [self.view addSubview:topView];
//    
//    UIButton *backButton = [[UIButton alloc] init];
//    backButton.frame = CGRectMake(10, 20, 75, 30);
//    backButton.titleLabel.textAlignment = NSTextAlignmentLeft;
//    //backButton.backgroundColor = [UIColor cyanColor];
//    [backButton setTitle:@"← back" forState:UIControlStateNormal];
//    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
//    [topView addSubview:backButton];

}



@end






















