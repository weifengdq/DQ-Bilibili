//
//  LSBCollectionCell.h
//  Bilibili
//
//  Created by weifengdq on 16/6/30.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSBCollectionCell : UICollectionViewCell<UIScrollViewDelegate>
{
    NSInteger _speed;
    NSTimer *_timer;
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

@property(nonatomic, retain)NSMutableArray *buttonTextArray;
@property(nonatomic, retain)NSMutableArray *urlImageArray;
@property(nonatomic, retain)NSArray *labelArray;
@property(nonatomic, retain)NSArray *imageArray;

//@property(nonatomic, retain)UILabel *label;
//@property(nonatomic, retain)UIImageView *imageView;

//@property(nonatomic, retain)UIScrollView *scrollView;
//@property(nonatomic, retain)UIPageControl *pageControl;

- (void)refreshUI;

@end
