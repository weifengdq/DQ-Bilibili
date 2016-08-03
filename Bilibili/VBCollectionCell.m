//
//  VBCollectionCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/2.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "VBCollectionCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation VBCollectionCell

//@property(nonatomic, retain)NSMutableArray *coverImageArray;    //封面
//@property(nonatomic, retain)NSMutableArray *titleImageArray;    //标题
//@property(nonatomic, copy)NSString *descStr;    //第12话

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _coverImageArray = [[NSMutableArray alloc] init];
        _titleImageArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)refreshUI {
    
    int sw = SCREEN_WIDTH;
    int gapE = 0.036111 * SCREEN_WIDTH;    //到屏幕边缘的距离
    int gapH = 0.039888 * SCREEN_WIDTH;    //中间的距离 横
    int gapV = 0.044444 * SCREEN_WIDTH;    //中间的距离 竖
   
    self.contentView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    
    UIButton *topView = [[UIButton alloc] init];
    topView.frame = CGRectMake(0, SCREEN_WIDTH * 0.05, SCREEN_WIDTH, SCREEN_WIDTH * 0.066666);
//    topView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
//                                              green:arc4random()%255/255.0
//                                               blue:arc4random()%255/255.0
//                                              alpha:0.5];
    [self.contentView addSubview:topView];
    
    //番剧推荐
    UILabel *partitionLabel = [[UILabel alloc] init];
    partitionLabel.frame = CGRectMake(0.109722*sw, 0, 0.2115*sw, 0.066666 * sw);
    partitionLabel.text = @"番剧推荐";
    partitionLabel.textColor = [UIColor blackColor];
    [topView addSubview:partitionLabel];
    
    //更多
    UIButton *moreButton = [[UIButton alloc] init];
    moreButton.frame = CGRectMake(0.854166*sw, 0, 0.109722*sw, 0.066666*sw);
    [moreButton setTitle:@"更多" forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    moreButton.backgroundColor = [UIColor colorWithRed:0.6784 green:0.6784 blue:0.6784 alpha:1.0];
    moreButton.layer.cornerRadius = 4;
    moreButton.clipsToBounds = YES;
    [topView addSubview:moreButton];
    
    if (_coverImageArray.count >=4 ) {
        for (int i = 0; i<4; i++) {
            UIButton *view = [[UIButton alloc] init];
            view.frame = CGRectMake(gapE+i%2*((sw-gapE*2-gapH)/2+gapH) , 0.1666667*sw+i/2*(0.451338*sw+gapV), 0.444444*sw, 0.451338*sw);
            view.backgroundColor = [UIColor whiteColor];
            view.layer.cornerRadius = 4;
            view.clipsToBounds = YES;
            [self.contentView addSubview:view];
            
            int vw = view.frame.size.width;
            
            //封面
            UIImageView *coverImageView = [[UIImageView alloc] init];
            coverImageView.frame = CGRectMake(0, 0, vw+1, 0.277777*sw);  //+1很重要, 不然会有白边?
            //            coverImageView.backgroundColor = [UIColor whiteColor];
            coverImageView.backgroundColor = [UIColor cyanColor];   //测试
            NSURL *url = [NSURL URLWithString:_coverImageArray[i]];
            [coverImageView sd_setImageWithURL:url placeholderImage:nil];   //占位是背景色白的
            [view addSubview:coverImageView];
            
            //title 单行显示 左对齐
            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.text = _titleImageArray[i];
            //titleLabel.font = [UIFont systemFontOfSize:14.0]; //用默认的17号字
            titleLabel.frame = CGRectMake(0.006944*sw, 0.294444*sw, 0.430555*sw, 0.055555*sw);
            titleLabel.textColor = [UIColor blackColor];
            titleLabel.textAlignment = NSTextAlignmentLeft;
            [view addSubview:titleLabel];
            
            //第13话
            UILabel *descLabel = [[UILabel alloc] init];
            //playLabel.font = [UIFont systemFontOfSize:14.0];
            descLabel.text = _descArray[i];
            CGSize size = [descLabel.text sizeWithFont:descLabel.font];
            descLabel.frame = CGRectMake(0.006944*sw, 0.377777*sw, size.width, 0.055555*sw);
            descLabel.textColor = [UIColor colorWithRed:0.9686 green:0.3451 blue:0.5294 alpha:1.0];
            descLabel.layer.cornerRadius = 4;
            descLabel.clipsToBounds = YES;
            [view addSubview:descLabel];
            
        }
        
        //新手放送 番剧索引
        for (int i = 0; i<2; i++) {
            UIButton *newButton = [[UIButton alloc] init];
            if (i == 0) {
                newButton.frame = CGRectMake(0.036111*sw, 1.158333*sw, 0.449*sw, 0.116666*sw);
//                [newButton setTitle:@"新番放送" forState:UIControlStateNormal];
//                [newButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                newButton.backgroundColor = [UIColor colorWithRed:0.8549 green:0.3216 blue:0.3373 alpha:1.0];
                [newButton setBackgroundImage:[UIImage imageNamed:@"xinfantuisong"] forState:UIControlStateNormal];
            } else {
                newButton.frame = CGRectMake(0.514583*sw, 1.158333*sw, 0.449*sw, 0.116666*sw);
//                [newButton setTitle:@"番剧索引" forState:UIControlStateNormal];
//                [newButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//                newButton.backgroundColor = [UIColor colorWithRed:0.5765 green:0.8157 blue:0.9882 alpha:1.0];
                [newButton setBackgroundImage:[UIImage imageNamed:@"fanjusuoyin"] forState:UIControlStateNormal];
            }
            newButton.layer.cornerRadius = 6;
            newButton.clipsToBounds = YES;
            [self.contentView addSubview:newButton];
        }
        
        //gl_pic
        UIImageView *glImageView = [[UIImageView alloc] init];
        glImageView.backgroundColor = [UIColor whiteColor];
        glImageView.frame = CGRectMake(0.036111*sw, 1.319444*sw, 0.927777*sw, 0.270833*sw);
        NSURL *url1 = [NSURL URLWithString:_glpicStr];
        [glImageView sd_setImageWithURL:url1 placeholderImage:nil];   //占位是背景色白的
        [self.contentView addSubview:glImageView];

    }
    
}

@end











































