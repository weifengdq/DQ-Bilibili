//
//  BScrollCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/9.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "BScrollCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface BScrollCell ()<UIScrollViewDelegate>
{
    NSInteger _speed;
    NSTimer *_timer;
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}
@end

@implementation BScrollCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _urlImageArray = [[NSMutableArray alloc] init];
        
        //self.frame = CGRectMake(0, 0, sw, 0.3125*sw);

    }
    
    return self;
}

- (void)refreshUI {
    //===========================做好清理======================================
    
    UIScrollView *scrollView = (UIScrollView *)[self.contentView viewWithTag:100];
    [scrollView removeFromSuperview];
    
    UIPageControl *pageControl = (UIPageControl *)[self.contentView viewWithTag:101];
    [pageControl removeFromSuperview];
    
    if (_timer != nil)
    {
        [_timer invalidate];
        _timer = nil;
    }
    
    //===============================重绘======================================
    
    //    if (_urlImageArray.count > 0) {
    //
    //    }
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.3125);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * _urlImageArray.count, SCREEN_WIDTH * 0.3125);
    int i = -1;
    for (NSString *urlStr in _urlImageArray) {
        i++;
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.3125);
        NSURL *url = [NSURL URLWithString:urlStr];
        [imageView sd_setImageWithURL:url placeholderImage:nil];  //记得设置占位图片
        _scrollView.delegate = self;
        [_scrollView addSubview:imageView];
    }
    _scrollView.tag = 100;
    [self.contentView addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.frame = CGRectMake(SCREEN_WIDTH * 0.88, SCREEN_WIDTH * 0.3125 - 20, 20, 10);
    _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    _pageControl.hidesForSinglePage = YES;  //只有一页时隐藏
    _pageControl.numberOfPages = _urlImageArray.count;
    _pageControl.tag = 101;
    [self.contentView addSubview:_pageControl];
    
    _speed = 1;
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    
}


//定时器方法
- (void)onTimer
{
    if (_pageControl.currentPage == 0) {
        _speed = 1;
    }
    if (_pageControl.currentPage == _urlImageArray.count - 1) {
        _speed = (_urlImageArray.count - 1) * (-1);
    }
    _pageControl.currentPage = _pageControl.currentPage + _speed;
    [_scrollView setContentOffset:CGPointMake(_pageControl.currentPage * SCREEN_WIDTH, 0) animated:YES];
}

//scrollView的协议方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (_timer != nil)
    {
        [_timer invalidate];
        _timer = nil;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = _scrollView.contentOffset.x/SCREEN_WIDTH;
    if (_pageControl.currentPage == 0) {
        _speed = 1;
    }
    if (_pageControl.currentPage == _urlImageArray.count-1) {
        _speed = (_urlImageArray.count - 1) * (-1);
    }
    
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    }
}

//pageControl的点击事件
- (void)changeImage:(UIPageControl *)pageC {
    [_scrollView setContentOffset:CGPointMake(pageC.currentPage * SCREEN_WIDTH, 0) animated:YES];
}

@end
