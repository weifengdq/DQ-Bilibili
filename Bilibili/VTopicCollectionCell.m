//
//  VTopicCollectionCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/2.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "VTopicCollectionCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation VTopicCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

- (void)refreshUI {
    self.contentView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    
    int sw = SCREEN_WIDTH;
    
    //话题
    UILabel *topicLabel = [[UILabel alloc] init];
    topicLabel.frame = CGRectMake(0.109722*sw, 0.05*sw, 0.118055*sw, 0.066666*sw);
    topicLabel.text = @"话题";
    topicLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:topicLabel];
    
    //图片展示 是可以点击的
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.frame = CGRectMake(0.038888*sw, 0.166666*sw, 0.922222*sw, 0.287234*sw);
    NSURL *url = [NSURL URLWithString:_urlImageStr];
    [imageView sd_setImageWithURL:url placeholderImage:nil];   //占位是背景色白的
    //添加点击事件
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickImage)];
    [imageView addGestureRecognizer:singleTap];
    [self.contentView addSubview:imageView];
    
}

-(void)onClickImage{
    // here, do whatever you wantto do
    NSLog(@"imageview is clicked!");
}


@end




















