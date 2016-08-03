//
//  VSCollectionCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/1.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSCollectionCell : UICollectionViewCell<UIScrollViewDelegate>
{
    NSInteger _speed;
    NSTimer *_timer;
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

@property(nonatomic, retain)NSMutableArray *urlImageArray;

- (void)refreshUI;

@end
