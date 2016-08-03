//
//  SSBangumiCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/2.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "SSBangumiCell.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation SSBangumiCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {

    }
    
    return self;
}

//含动态文字 cell 高度954 (0.6625)  
- (void)refreshUI {
    
    int sw = SCREEN_WIDTH;
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    
    UIButton *topView = [[UIButton alloc] init];
    topView.frame = CGRectMake(0, SCREEN_WIDTH * 0.05, SCREEN_WIDTH, SCREEN_WIDTH * 0.066666);
//    topView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
//                                              green:arc4random()%255/255.0
//                                               blue:arc4random()%255/255.0
//                                              alpha:0.5];
    [self.contentView addSubview:topView];
    
    //番剧
    UILabel *partitionLabel = [[UILabel alloc] init];
    partitionLabel.frame = CGRectMake(0.109722*sw, 0, 0.118055*sw, 0.066666 * sw);
    partitionLabel.text = @"番剧";
    partitionLabel.textColor = [UIColor blackColor];
    [topView addSubview:partitionLabel];
    
    //戳我来追番
    UIButton *imageView = [[UIButton alloc] init];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.frame = CGRectMake(0.0361111*sw, 0.166666*sw, 0.927777*sw, 0.319444*sw);
    [imageView setBackgroundImage:[UIImage imageNamed:@"戳我来追番"] forState:UIControlStateNormal];
    imageView.layer.cornerRadius = 6;
    imageView.clipsToBounds = YES;
    [self.contentView addSubview:imageView];
    
    //动态    780
    UILabel *dynamicLabel = [[UILabel alloc] init];
    dynamicLabel.frame = CGRectMake(0.109722*sw , 0.541*sw, 0.118055*sw, 0.066666 * sw);
    dynamicLabel.text = @"动态";
    dynamicLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:dynamicLabel];
    
}

@end




































