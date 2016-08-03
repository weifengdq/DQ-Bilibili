//
//  UCHeadCollectionCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/4.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "UCHeadCollectionCell.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation UCHeadCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0.9686 green:0.3451 blue:0.5255 alpha:1.0];
        int sw = SCREEN_WIDTH;
        
        //背景图 490 240 574 530
        UIImageView *backImageView = [[UIImageView alloc] init];
        backImageView.backgroundColor = [UIColor clearColor];
        backImageView.frame = CGRectMake(0.340277*sw, 0.166666*sw, 0.379861*sw, 0.368055*sw);
        backImageView.image = [UIImage imageNamed:@"tv42"];
        backImageView.alpha = 0.7;
        [self.contentView addSubview:backImageView];
        
        //头像 62 90 282 282
        UIButton *portraitButton = [[UIButton alloc] init];
        portraitButton.frame = CGRectMake(0.043055*sw, 0.0625*sw, 0.195833*sw, 0.195833*sw);
        portraitButton.layer.cornerRadius = 0.195833*sw/2;
        portraitButton.clipsToBounds = YES;
        portraitButton.layer.borderWidth = 2;
        portraitButton.layer.borderColor = [UIColor whiteColor].CGColor;
        [self.contentView addSubview:portraitButton];
        
        //用户名 62 430 xxx 84
        UIButton *usernameButton = [[UIButton alloc] init];
        [usernameButton setTitle:@"weifengdq" forState:UIControlStateNormal];
        CGSize size = [usernameButton.titleLabel.text sizeWithFont:usernameButton.titleLabel.font];
        usernameButton.frame = CGRectMake(0.043055*sw, 0.298611*sw, size.width, 0.058333*sw);
        [usernameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.contentView addSubview:usernameButton];
        
        //用户等级
        UIImageView *order = [[UIImageView alloc] init];
        order.frame = CGRectMake(0.043055*sw+size.width+5, 0.298611*sw, 0.069444*sw, 0.048611*sw);
        order.image = [UIImage imageNamed:@"order"];
        [self.contentView addSubview:order];
        
        //性别
        UIImageView *sex = [[UIImageView alloc] init];
        CGFloat sex_x = 0.043055*sw+size.width+5 + 0.069444*sw + 5;
        sex.frame = CGRectMake(sex_x, 0.298611*sw, 0.052777*sw, 0.048611*sw);
        sex.image = [UIImage imageNamed:@"misc_sex_sox@3x"];
        [self.contentView addSubview:sex];
        
        //正式会员 79 520 216 70
        UILabel *VIPLabel = [[UILabel alloc] init];
        VIPLabel.frame = CGRectMake(0.043055*sw, 0.361111*sw, 0.15*sw, 0.048611*sw);    //0.054861*sw
        VIPLabel.font = [UIFont systemFontOfSize:12.0];
        VIPLabel.backgroundColor = [UIColor colorWithRed:0.9843 green:0.7216 blue:0.8039 alpha:1.0];
        VIPLabel.text = @"正式会员";
        VIPLabel.textAlignment = NSTextAlignmentCenter;
        VIPLabel.textColor = [UIColor colorWithRed:0.9686 green:0.3451 blue:0.5294 alpha:1.0];
        VIPLabel.layer.cornerRadius = 0.020833*sw;
        VIPLabel.clipsToBounds = YES;
        [self.contentView addSubview:VIPLabel];
        
        
        //硬币 62 600 xxx 80
        UILabel *coinLabel = [[ UILabel alloc] init];
        coinLabel.text = [NSString stringWithFormat:@"硬币: %d", 22];
        coinLabel.textColor = [UIColor colorWithRed:0.9843 green:0.7216 blue:0.8039 alpha:1.0];
        CGSize size1 = [coinLabel.text sizeWithFont:coinLabel.font];
        coinLabel.frame = CGRectMake(0.043055*sw, 0.416666*sw, size1.width, 0.055555*sw);
        [self.contentView addSubview:coinLabel];
        
        //信封 620 90 140 140
        UIButton *messageButton = [[UIButton alloc] init];
        messageButton.frame = CGRectMake(0.430555*sw, 0.0625*sw, 0.097222*sw, 0.097222*sw);
        [messageButton setBackgroundImage:[UIImage imageNamed:@"message"] forState:UIControlStateNormal];
        [self.contentView addSubview:messageButton];
        
        //夜间模式840 90 140 140
        UIButton *moonButton = [[UIButton alloc] init]; //其实命名与组件无关... 不应该挂button
        moonButton.frame = CGRectMake(0.583333*sw, 0.0625*sw, 0.097222*sw, 0.097222*sw);
        [moonButton setBackgroundImage:[UIImage imageNamed:@"moon"] forState:UIControlStateNormal];
        [self.contentView addSubview:moonButton];
        
        
        
        
        
        
        

    }
    return self;
}


@end

















