//
//  SSDynamicCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/2.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "SSDynamicCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import "WebViewController.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface LineView : UIView

@end

@implementation LineView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    /*------------------- 直线 ----------------------*/
    // UIBezierPath 实例
    UIBezierPath *line = [UIBezierPath bezierPath];
    
    // 起点
    [line moveToPoint:CGPointMake(5,5)];
    // 终点
    [line addLineToPoint:CGPointMake(0.9208333*SCREEN_WIDTH,5)];
    
    // 画笔颜色
    [[UIColor colorWithRed:0.7216 green:0.7216 blue:0.7216 alpha:1.0] setStroke];
    // 线宽
    line.lineWidth = 2;
    // 绘制
    [line stroke];
}

@end


////data -> feeds -> addition
//@property(nonatomic, copy)NSString *avatarStr;  //头像
//@property(nonatomic, copy)NSString *autherStr;   //用户名
//@property(nonatomic, copy)NSString *creatTimerStr;  //2016.05.31(几小时前 几天前 日期)投递了
//@property(nonatomic, copy)NSString *picStr;         //封面
//@property(nonatomic, copy)NSString *titleStr;       //标题
//@property(nonatomic, copy)NSString *playStr;        //播放
//@property(nonatomic, copy)NSString *videoReviewStr; //弹幕

@implementation SSDynamicCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

//高度706 (0.490277)
- (void)refreshUI {
    
    int sw = SCREEN_WIDTH;
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    
    //底层View
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0.036111*sw, 0, 0.927777*sw, 0.445833*sw);
    view.layer.cornerRadius = 4;
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:view];
    
    //上部分
    UIButton *topView = [[UIButton alloc] init];
    topView.frame = CGRectMake(0, 0, 0.927777*sw, 0.1875*sw);
    [view addSubview:topView];
    
    //头像
    UIImageView *avatarView = [[UIImageView alloc] init];
    avatarView.frame = CGRectMake(0.030555*sw, 0.05*sw, 0.097222*sw, 0.097222*sw);
    NSURL *url1 = [NSURL URLWithString:_avatarStr];
    [avatarView sd_setImageWithURL:url1 placeholderImage:nil];
    avatarView.layer.cornerRadius = 0.097222*sw/2;
    avatarView.clipsToBounds = YES;
    [topView addSubview:avatarView];
    
    //作者
    UILabel *authorLabel = [[UILabel alloc] init];
    authorLabel.text = _autherStr;
    CGSize size = [authorLabel.text sizeWithFont:authorLabel.font];
    authorLabel.frame = CGRectMake(0.166666*sw, 0.0319444*sw, size.width, 0.061111*sw);
    authorLabel.textColor = [UIColor blackColor];
    [topView addSubview:authorLabel];
    
    //20小时前投递了  不足20个小时用小时 不足48小时用昨天 不足一周用几天前 之上用日期2016年5月8日投递了
    UILabel *sendLabel = [[UILabel alloc] init];
    sendLabel.text = _creatTimeStr;
    CGSize size1 = [sendLabel.text sizeWithFont:sendLabel.font];
    sendLabel.frame = CGRectMake(0.166666*sw, 0.104166*sw, size1.width, 0.061111*sw);
    sendLabel.textColor = [UIColor blackColor];
    [topView addSubview:sendLabel];
    
    //灰色横线
    LineView *lineView = [[LineView alloc] init];
    lineView.frame = CGRectMake(0, 0.184027*sw, 0.927777*sw, 10);
    [view addSubview:lineView];
    
    //下部分
    UIButton *bottomView = [[UIButton alloc] init];
    bottomView.frame = CGRectMake(0, 0.1875*sw, 0.927777*sw, 0.258333*sw);
    [bottomView addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:bottomView];
    
    //封面
    UIImageView *picView = [[UIImageView alloc] init];
    picView.frame = CGRectMake(0.0319448*sw, 0.211111*sw, 0.329166*sw, 0.204166*sw);
    NSURL *url2 = [NSURL URLWithString:_picStr];
    [picView sd_setImageWithURL:url2 placeholderImage:nil];
    [view addSubview:picView];
    
    //标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(0.375*sw, 0.211111*sw, 0.545833*sw, 0.122222*sw);
    titleLabel.text = _titleStr;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.numberOfLines = 2;
    [view addSubview:titleLabel];
    
    //播放量
    UILabel *playLabel = [[UILabel alloc] init];
    playLabel.text = _playStr;
    playLabel.textColor = [UIColor colorWithRed:0.5294 green:0.5294 blue:0.5294 alpha:1.0];
    playLabel.font = [UIFont systemFontOfSize:14.0];
    CGSize size2 = [playLabel.text sizeWithFont:playLabel.font];
    playLabel.frame = CGRectMake(0.418055*sw, 0.370833*sw, size2.width, 0.043055*sw);
    [view addSubview:playLabel];
    
    //弹幕
    UILabel *videoReviewLabel = [[UILabel alloc] init];
    videoReviewLabel.text = _videoReviewStr;
    videoReviewLabel.textColor = [UIColor colorWithRed:0.5294 green:0.5294 blue:0.5294 alpha:1.0];
    videoReviewLabel.font = [UIFont systemFontOfSize:14.0];
    CGSize size3 = [videoReviewLabel.text sizeWithFont:playLabel.font];
    videoReviewLabel.frame = CGRectMake(0.593055*sw, 0.370833*sw, size3.width, 0.043055*sw);
    [view addSubview:videoReviewLabel];
 
}

- (void)buttonAction {
    //NSLog(@"Hello, world");
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    
    UIViewController *vc = window.rootViewController;
    
    WebViewController *wc = [[WebViewController alloc] init];
    
    [vc addChildViewController:wc];
    [vc.view addSubview:wc.view];
    
    
    NSString *urlStr = _linkStr;    //@"http://www.bilibili.com/video/av5239292/"
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    UIWebView *webview = [[UIWebView alloc]init];
    //webview.frame = self.view.frame;
    webview.frame = CGRectMake(0, -44, SCREEN_WIDTH, SCREEN_HEIGHT + 110);
    [webview loadRequest:request];
    
    [wc.view addSubview:webview];
    
    
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 44);
    [wc.view addSubview:topView];
    
    wc.view.tag = 700;
    
    UIButton *backButton = [[UIButton alloc] init];
    backButton.frame = CGRectMake(10, 20, 75, 30);
    backButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    //backButton.backgroundColor = [UIColor cyanColor];
    [backButton setTitle:@"← back" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:backButton];
    
    //    UINavigationController *nav = [[UINavigationController alloc] init];
    //    //window.rootViewController = nav;
    //    //[nav pushViewController:vc animated:YES];
    //    [vc addChildViewController:nav];
    //    [vc.view addSubview:nav.view];
    //
    //    [nav pushViewController:wc animated:YES];
    
    
    //    [vc addChildViewController:wc];
    //    [vc addChildViewController:wc];
    //
    //    [vc.navigationController pushViewController:wc animated:YES];
    
    //[wc presentedViewController];
    
}

- (void)backButtonAction {
    UIView *wc = [self.window viewWithTag:700];
    [wc removeFromSuperview];
    //[wc.superclass removeFromParentViewController];
}




@end


















































