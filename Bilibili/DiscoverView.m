//
//  DiscoverView.m
//  Bilibili
//
//  Created by weifengdq on 16/6/28.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "DiscoverView.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width


@implementation DiscoverView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self refreshUI];
    }
    return self;
}

- (void)refreshUI {
    
    //整个页面是可以滑动的, 估计也是构建在CollectionView上. 可以把整个界面作为一个cell
    int sw = SCREEN_WIDTH;
    
    self.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame = CGRectMake(0.034722*sw, 0.034722*sw, 0.930555*sw, 0.109722*sw);
    searchBar.placeholder = @"搜索视频, 番剧, up主或av号"; //应该是富文本
    //searchBar.backgroundColor = [UIColor whiteColor];
    [self addSubview:searchBar];
    
    //大家都在搜
    UILabel *dajiaLabel = [[UILabel alloc] init];
    dajiaLabel.frame = CGRectMake(0.034722*sw, 0.180555*sw, 0.25*sw, 0.0625*sw); //(50, 260, 360, 90)
    dajiaLabel.text = @"大家都在搜";
    dajiaLabel.textAlignment = NSTextAlignmentLeft;
    dajiaLabel.textColor = [UIColor colorWithRed:0.4863 green:0.4863 blue:0.4863 alpha:1.0];
    [self addSubview:dajiaLabel];
    
    //类似于横向的瀑布流
    
    //查看更多 展开 是另开了一个view吧 KVO可以实现展开监控?
    
    //tableview 手写view如何?
    //0 660+260 sw 904
    UIView *bottomView = [[UIView alloc] init];
    bottomView.frame = CGRectMake(0, 0.638888*sw, sw, 0.6902778*sw);
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    
}

@end


























