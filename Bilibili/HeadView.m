//
//  HeadView.m
//  Bilibili
//
//  Created by weifengdq on 16/7/4.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "HeadView.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {  //228/1440
        int sw = SCREEN_WIDTH;
        
        self.frame = CGRectMake(0, 20, sw, 0.158333*sw);
        
        //点击召唤侧边栏
        _leftButton = [[UIButton alloc] init];
        _leftButton.frame = CGRectMake(0, 0, sw/2, 0.158333*sw);
        [self addSubview:_leftButton];
        
        //三道杠 0 80 32 70
        UIImageView *threeImageView = [[UIImageView alloc] init];
        threeImageView.frame = CGRectMake(0, 0.055555*sw, 0.022222*sw, 0.048611*sw);
        threeImageView.image = [UIImage imageNamed:@"threeLine"];
        [_leftButton addSubview:threeImageView];
        
        //头像 87 45 140 140
        UIImageView *portraitImageView = [[UIImageView alloc] init];
        portraitImageView.frame = CGRectMake(0.0604166*sw, 0.03125*sw, 0.097222*sw, 0.097222*sw);
        //portraitImageView.image =
        portraitImageView.layer.cornerRadius = 0.097222*sw / 2.0;
        portraitImageView.clipsToBounds = YES;
        portraitImageView.layer.borderWidth = 2;
        portraitImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        [_leftButton addSubview:portraitImageView];
        
        //小圆点 194 45 44 44
        UIImageView *reddotImageView = [[UIImageView alloc] init];
        reddotImageView.frame = CGRectMake(0.134722*sw, 0.03125*sw, 0.030555*sw, 0.030555*sw);
        reddotImageView.layer.cornerRadius = 0.030555*sw / 2;
        reddotImageView.clipsToBounds = YES;
        reddotImageView.layer.borderWidth = 2;
        reddotImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        reddotImageView.backgroundColor = [UIColor redColor];
        [_leftButton addSubview:reddotImageView];
        
        //用户名 268 76 自适应 100
        UILabel *usernameLabel = [[UILabel alloc] init];
        usernameLabel.text = @"weifengdq";
        CGSize size = [usernameLabel.text sizeWithFont:usernameLabel.font];
        usernameLabel.frame = CGRectMake(0.186111*sw, 0.052777*sw, size.width, 0.069444*sw);
        usernameLabel.textColor = [UIColor whiteColor];
        usernameLabel.textAlignment = NSTextAlignmentLeft;
        [_leftButton addSubview:usernameLabel];
        
        //游戏 912 74 100 82
        UIButton *gameButton = [[UIButton alloc] init];
        gameButton.frame = CGRectMake(0.633333*sw, 0.0513888*sw, 0.069444*sw, 0.0569444*sw);
        [gameButton setBackgroundImage:[UIImage imageNamed:@"game"] forState:UIControlStateNormal];
        [self addSubview:gameButton];
        
        //下载 1104 74 100 82
        UIButton *downloadButton = [[UIButton alloc] init];
        downloadButton.frame = CGRectMake(0.766666*sw, 0.0513888*sw, 0.069444*sw, 0.0569444*sw);
        [downloadButton setBackgroundImage:[UIImage imageNamed:@"download"] forState:UIControlStateNormal];
        [self addSubview:downloadButton];
        
        //搜索 1296 74 100 82
        UIButton *searchButton = [[UIButton alloc] init];
        searchButton.frame = CGRectMake(0.9*sw, 0.0513888*sw, 0.069444*sw, 0.0569444*sw);
        [searchButton setBackgroundImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
        [self addSubview:searchButton];
        
    }
    
    return self;
}



@end































