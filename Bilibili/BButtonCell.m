//
//  BButtonCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/9.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "BButtonCell.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation BButtonCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        int sw = SCREEN_WIDTH;
        NSArray *nameArray = @[@"zhuifan", @"fangsongbiao", @"suoyin"];
        
        //self.frame = CGRectMake(0, 0, sw, 0.1805556*sw);
        
        //52 0.036111
        //35 0.024305
        //184 0.012777
        //422 0.293055
        for (int i = 0; i < 3; i++) {
            UIButton *button = [[UIButton alloc] init];
            button.frame = CGRectMake((0.036111+i*(0.012777+0.024305))*sw, 0.036111*sw, 0.293055*sw, 0.012777*sw);
            button.layer.borderWidth = 4;
            button.clipsToBounds = YES;
            [button setBackgroundImage:[UIImage imageNamed:nameArray[i]] forState:UIControlStateNormal];
            [self.contentView addSubview:button];
        }
        
    }
    
    return self;
}

@end
