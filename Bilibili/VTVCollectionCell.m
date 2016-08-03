//
//  VTVCollectionCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/2.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "VTVCollectionCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation VTVCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _coverImageArray = [[NSMutableArray alloc] init];
        _titleImageArray = [[NSMutableArray alloc] init];
        _descArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)refreshUI {
    int sw = SCREEN_WIDTH;
    int gapE = 0.036111 * SCREEN_WIDTH;    //到屏幕边缘的距离
    int gapH = 0.044444 * SCREEN_WIDTH;    //中间的距离
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, SCREEN_WIDTH * 0.05, SCREEN_WIDTH, SCREEN_WIDTH * 0.066666);
    [self.contentView addSubview:topView];

    
    //电视剧更新
    UILabel *partitionLabel = [[UILabel alloc] init];
    partitionLabel.frame = CGRectMake(0.109722*sw, 0, 0.2115*sw, 0.066666 * sw);
    partitionLabel.text = @"电视剧更新";
    partitionLabel.textColor = [UIColor blackColor];
    [topView addSubview:partitionLabel];
    
    //进去看看
    UIButton *kankanButtton = [[UIButton alloc] init];
    kankanButtton.frame = CGRectMake(0.751389*sw, 0, 0.233333*sw, SCREEN_WIDTH * 0.066666);
    [kankanButtton setTitle:@"进去看看" forState:UIControlStateNormal];
    [kankanButtton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    kankanButtton.backgroundColor = [UIColor colorWithRed:0.6784 green:0.6784 blue:0.6784 alpha:1.0];
    kankanButtton.layer.cornerRadius = 4;
    kankanButtton.clipsToBounds = YES;
    [topView addSubview:kankanButtton];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0.166666*sw, sw, 0.555555*sw);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(((0.261111*sw+gapH))*_coverImageArray.count-gapH+gapE, 0.555555*sw);
    scrollView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    scrollView.delegate = self; //不写行不行?
    [self.contentView addSubview:scrollView];
    
    int i = -1;
    for (NSString *str in _coverImageArray) {
        i++;
        
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(gapE+i*(0.261111*sw+gapH), 0, 0.261111*sw, 0.555555*sw);
        button.backgroundColor = [UIColor whiteColor];
        button.layer.cornerRadius = 4;
        button.clipsToBounds = YES;
        [scrollView addSubview:button];
        
        //封面
        UIImageView *coverImageView = [[UIImageView alloc] init];
        coverImageView.frame = CGRectMake(0, 0, 0.261111*sw, 0.3486118*sw);
        NSURL *url = [NSURL URLWithString:str];
        [coverImageView sd_setImageWithURL:url placeholderImage:nil];
        [button addSubview:coverImageView];
        
        //标题
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0.006944*sw, 0.365277*sw, 0.2472228*sw, 0.055555*sw);
        titleLabel.text = _titleImageArray[i];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [button addSubview:titleLabel];
        
        //更新到第x话
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.frame = CGRectMake(0.006944*sw, 0.486111*sw, 0.2472228*sw, 0.05*sw);
        descLabel.text = _descArray[i];
        descLabel.textColor = [UIColor lightGrayColor];
        descLabel.textAlignment = NSTextAlignmentLeft;
        [button addSubview:descLabel];
        
    }
    
    
}

@end




































