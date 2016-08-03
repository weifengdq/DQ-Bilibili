//
//  ViewController.m
//  Bilibili
//
//  Created by weifengdq on 16/6/27.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "ViewController.h"
#import "HeadView.h"
#import "UserCenterVC.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UIScrollViewDelegate>
{
    int _speed;
    NSTimer *_timer;
    UIImageView *_launchImageView1;
    UIImageView *_launchImageView2;
    
    NSArray *_viewNameArray;
    
    UserCenterVC *_userCenterVC;
}


@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIScrollView *topScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *bottomScrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //----------------------------------启动页-----------------------------------------
//    _launchImageView2 = [[UIImageView alloc] init];
//    _launchImageView2.frame = self.view.frame;
//    _launchImageView2.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
//    [self.view addSubview:_launchImageView2];
//    
//    _launchImageView1 = [[UIImageView alloc] init];
//    CGFloat height1 = self.view.frame.size.height - 100;
//    CGFloat width1 = self.view.frame.size.width;
//    _launchImageView1.frame = CGRectMake(0, 0, width1, height1);
//    _launchImageView1.image = [UIImage imageNamed:@"launcher"];
//    [self.view addSubview:_launchImageView1];
//    
//    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(removelaunchImageView) userInfo:nil repeats:NO];
    
    //----------------------------------头------------------------------------
    //self.view.backgroundColor = [UIColor cyanColor];
    HeadView *headView = [[HeadView alloc] init];
    headView.frame = CGRectMake(0, 20, SCREEN_WIDTH, 0.158333*SCREEN_WIDTH);
    [headView.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headView];
    
    //----------------------------------顶部ScrollView----------------------------------
    //需要解决顶部scrollview的拖动
    _topScrollView.delegate = self;
    _topScrollView.contentSize = _topScrollView.bounds.size;
    //_topScrollView.contentSize = CGSizeMake(_topScrollView.frame.size.width *6 / 6, _topScrollView.frame.size.height);
    _topScrollView.pagingEnabled = YES;
    _topScrollView.showsHorizontalScrollIndicator = NO;    //水平方向指示条会在拖动的时候出现, 隐藏起来
    
    CGFloat topSVWidth = _topScrollView.frame.size.width;
    CGFloat topSVHeight = _topScrollView.frame.size.height;
    NSArray *topArray = @[@"直播", @"推荐", @"番剧", @"分区", @"关注", @"发现"];
    for (int i = 0; i < 6; i++) {
        
        @autoreleasepool {
            UIButton *button = [[UIButton alloc] init];
            button.frame = CGRectMake(i * topSVWidth/6.0f, 0, topSVWidth/6.0f, topSVHeight);
            [button setTitle:topArray[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(topButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 50 + i;
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];  //把原来的按钮回归未选中颜色
            [_topScrollView addSubview:button];
            
            //指示条, 但事实是指示条的宽度和button标题的宽度一样, 有待修改
            UIView *view = [[UIView alloc] init];
            view.frame = CGRectMake(i * topSVWidth/6.0f, topSVHeight - 2, topSVWidth/6.0f, 2);
            view.tag = 60 + i;
            [_topScrollView addSubview:view];
            
//            if (i == 1) {   //默认选中推荐
//                [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                view.backgroundColor = [UIColor whiteColor];
//            } else {
//                [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//                view.backgroundColor = [UIColor clearColor];
//            }
        }

    }
    
    
    //----------------------------------底部ScrollView----------------------------------
    //_bottomScrollView = [[UIScrollView alloc] init];
    //_bottomScrollView.frame = CGRectMake(0, 70, SCREEN_WIDTH, SCREEN_HEIGHT - 70);
    _bottomScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 6, _bottomScrollView.frame.size.height);
    for (int i = 0; i < 6 ; i++) {
        @autoreleasepool {
            UIView *view = [[UIView alloc] init];
            view.frame = CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, _bottomScrollView.frame.size.height);
//            view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0f
//                                                   green:arc4random()%255/255.0f
//                                                    blue:arc4random()%255/255.0f
//                                                   alpha:0.3];
            [_bottomScrollView addSubview:view];
        }
    }
    _bottomScrollView.pagingEnabled = YES;
    _bottomScrollView.delegate = self;
    //[_bottomScrollView setContentOffset:CGPointMake(SCREEN_WIDTH, 0) animated:YES];
    
    _viewNameArray = [[NSArray alloc] initWithObjects:
                      @"LiveView",          //直播
                      @"HomeView",          //推荐
                      @"BangumiView",       //番剧
                      @"CategoryView",      //分区
                      @"SubscriptionsView", //关注
                      @"DiscoverView",          //发现
                      nil];
    
    //初始选中推荐 tag = 51
    [self changeTopScrollView:51];
    
}

//召唤左侧个人中心
- (void)leftButtonAction {
    //NSLog(@"Hello world");
    
//    UserCenterVC *userCenterVC = [[UserCenterVC alloc] init];
//    //-0.738888*SCREEN_WIDTH
//    userCenterVC.view.frame = CGRectMake(-0.738888*SCREEN_WIDTH, 0, 0.738888*SCREEN_WIDTH, SCREEN_HEIGHT);
//    //userCenterVC.view.backgroundColor = [UIColor clearColor];
//    
//    //[self addSubview:userCenterVC.view];
//    
//    UIWindow *window = [[UIApplication sharedApplication].delegate window];
//    [window addSubview:userCenterVC.view];
//    window.rootViewController = userCenterVC;
//    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:2];
//    
//    userCenterVC.view.transform = CGAffineTransformMakeTranslation(0.738888*SCREEN_WIDTH, 0);
//    
//    [UIView commitAnimations];
    
//    for (UIView *view in [self.view subviews]) {
//        view.alpha = 0.8;
//    }
    
    //self.view.backgroundColor = [UIColor blackColor];
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.1;
    view.tag = 599;
    [self.view addSubview:view];
    
    
    _userCenterVC = [[UserCenterVC alloc] init];
    _userCenterVC.view.frame = CGRectMake(-1*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);   //-0.738888*SCREEN_WIDTH
    _userCenterVC.view.backgroundColor = [UIColor clearColor];
   // [self presentViewController:userCenterVC animated:YES completion:nil];
    [self addChildViewController:_userCenterVC];
    _userCenterVC.view.tag = 600;
    [self.view addSubview:_userCenterVC.view];
    [_userCenterVC.rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _userCenterVC.view.transform = CGAffineTransformMakeTranslation(SCREEN_WIDTH, 0);
//        for (UIView *view in [self.view subviews]) {
//            if (view.tag != 600) {
//                view.alpha = 0.9;
//            }
//        }
        view.alpha = 0.5;

    } completion:^(BOOL finished) {
//        _userCenterVC.rightButton.backgroundColor = [UIColor blackColor];
//        _userCenterVC.rightButton.alpha = 0.4;
    }];

}

- (void)rightButtonAction {
    UIView *view0 = [self.view viewWithTag:599];
    UIView *view = [self.view viewWithTag:600];
//    _userCenterVC.rightButton.backgroundColor = [UIColor clearColor];
//    _userCenterVC.rightButton.alpha = 1;

    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        view.transform = CGAffineTransformMakeTranslation(-1*SCREEN_WIDTH, 0);
        view0.alpha = 0;
//        for (UIView *view in [self.view subviews]) {
//            view.alpha = 1;
//        }
    } completion:^(BOOL finished) {
        [view removeFromSuperview];
        [view0 removeFromSuperview];
    }];
}


//#pragma mark - 移除启动页
//-(void)removelaunchImageView {
//    [_launchImageView1 removeFromSuperview];
//    [_launchImageView2 removeFromSuperview];
//}

#pragma mark - 顶部ScrollView的Button点击事件
- (void)topButtonAction:(UIButton *)button {
    [self changeTopScrollView:button.tag];
}

#pragma mark - ScrollViewDelegate方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //NSLog(@"2.contentOffset = %f", _bottomScrollView.contentOffset.x);
    [self changeTopScrollView:_bottomScrollView.contentOffset.x/SCREEN_WIDTH + 50];
    
}

#pragma mark - 顶部ScrollView文字颜色的改变, 指示条的移动, 窗口页面的切换
- (void)changeTopScrollView:(NSInteger)tagtag {
    static NSInteger i = 51;

    UIButton *preButton = (UIButton *)[_topScrollView viewWithTag: i];  //初始选中第二个推荐
    UIButton *nowButton = (UIButton *)[_topScrollView viewWithTag:tagtag];
    
    UIView *preView = [_topScrollView viewWithTag:10 + i];
    UIView *nowView = [_topScrollView viewWithTag:tagtag + 10];
    
    [preButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];  //把原来的按钮回归未选中颜色
    [nowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    preView.backgroundColor = [UIColor clearColor];
    nowView.backgroundColor = [UIColor whiteColor];
    
    //实际应该添加指示条的UIView左右滑动UIView动画
    //    [UIView beginAnimations:nil context:(__bridge void * _Nullable)(nowView)];
    //    [UIView beginAnimations:nil context:(__bridge void * _Nullable)(preView)];
    //    [UIView setAnimationDuration:0.2];
    //
    //    preView.backgroundColor = [UIColor clearColor];
    //    nowView.backgroundColor = [UIColor whiteColor];
    //
    //    [UIView setAnimationDelegate:self];
    //    [UIView setAnimationDidStopSelector:nil];
    //
    //    [UIView commitAnimations];
    
    //应该让指示条随着bottomScrollView的移动而移动
    
    UIView *tmpView = nil;
    tmpView = [[NSClassFromString([_viewNameArray objectAtIndex:(tagtag - 50)]) alloc] init];
    tmpView.frame = CGRectMake((tagtag - 50) * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [_bottomScrollView addSubview:tmpView];
    
    
    [_bottomScrollView setContentOffset:CGPointMake(SCREEN_WIDTH * (tagtag - 50), 0) animated:YES];

    
    i = tagtag;
}

@end














































