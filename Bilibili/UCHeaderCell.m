//
//  UCHeaderCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/7.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "UCHeaderCell.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface LineView1 : UIView
@end

@implementation LineView1

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    /*------------------- 直线 ----------------------*/
    // UIBezierPath 实例
    UIBezierPath *line = [UIBezierPath bezierPath];
    
    // 起点
    [line moveToPoint:CGPointMake(0,0)];
    // 终点
    [line addLineToPoint:CGPointMake(0.738888*SCREEN_WIDTH,0)];
    
    // 画笔颜色
    [[UIColor colorWithRed:0.8314 green:0.8314 blue:0.8314 alpha:1.0] setStroke];
    // 线宽
    line.lineWidth = 3;
    // 绘制
    [line stroke];
}

@end


@implementation UCHeaderCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        

    }
    
    return self;
}

- (void)refreshUI {
    int sw = SCREEN_WIDTH;
    
    //self.backgroundColor = [UIColor grayColor];
    //灰色横线
    LineView1 *lineView = [[LineView1 alloc] init];
    lineView.frame = CGRectMake(0, 0.022222*sw, 0.738888*sw, 0.004166*sw);
    //lineView.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:lineView];
    
}

@end














