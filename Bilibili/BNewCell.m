//
//  BNewCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/9.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "BNewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation BNewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        int sw = SCREEN_WIDTH;
        
        _coverArray = [[NSMutableArray alloc] init];
        _titleArray = [[NSMutableArray alloc] init];
        _totalCountArray = [[NSMutableArray alloc] init];
        _watchingCountArray = [[NSMutableArray alloc] init];
        _lastTimeArray = [[NSMutableArray alloc] init];
        
        //顶部透明的按钮
        
        //区图标 52 62 72 72
        //0.036111 0.043055 0.05
        UIImageView *cellImage = [[UIImageView alloc] init];
        cellImage.frame = CGRectMake(0.036111*sw, 0.043055*sw, 0.05*sw, 0.05*sw);
        cellImage.image = [UIImage imageNamed:@"xinfanlianzai"];
        [self.contentView addSubview:cellImage];
        
        //区名 150 50 300 94
        UILabel *cellName = [[UILabel alloc] init];
        cellName.frame = CGRectMake(0.1041667*sw, 0.034722*sw, 0.208333*sw, 0.065277*sw);
        cellName.text = @"新番连载";
        cellName.textColor = [UIColor blackColor];
        [self.contentView addSubview:cellName];
        
    }
    
    return self;
}

- (void)refreshUI {
    int sw = SCREEN_WIDTH;
    
    //应该先清空再创建???
    
    //今日更新 3 >   关键字3标红
    UILabel *updateCount = [[UILabel alloc] init];
    NSString *keyword = _updateCount;
    NSString *result = [NSString stringWithFormat:@"今日更新 %@ >", keyword];
    // 设置标签文字
    NSMutableAttributedString *attrituteString = [[NSMutableAttributedString alloc] initWithString:result];
    // 获取标红的位置和长度
    NSRange range = [result rangeOfString:keyword];
    // 设置标签文字的属性
    [attrituteString setAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:0.9686 green:0.3451 blue:0.5294 alpha:1.0], NSFontAttributeName : [UIFont systemFontOfSize:17]} range:range];
    // 显示在Label上
    updateCount.attributedText = attrituteString;
    
    CGSize size = [result sizeWithFont:updateCount.font];
    updateCount.frame = CGRectMake(sw - 0.036111*sw - size.width, 0.043055*sw, size.width, 0.05*sw);
    
    if (_coverArray.count >= 6) {
        for (int i = 0; i<6; i++) {
            UIButton *button = [[UIButton alloc] init];
            //52+689*i%2  200+744*i/2 647 680
            //0.036111 0.478472 0.138888
            button.frame = CGRectMake(0.036111*sw+0.478472*i/2, 0.138888+0.516666*sw, 0.449305*sw, 0.4722222*sw);
            button.layer.cornerRadius = 4;
            button.clipsToBounds = YES;
            [self.contentView addSubview:button];
            
            //cover 0 0 647 404
            UIImageView *cover = [[UIImageView alloc] init];
            cover.frame = CGRectMake(0, 0 , 0.449305*sw, 0.280555*sw);
            cover.image = _coverArray[i];
            [button addSubview:cover];
            
            //title 20 436 627 80 黑色 居左
            //0.013888 0.302777 0.435416 0.055555
            UILabel *title = [[UILabel alloc] init];
            title.frame = CGRectMake(0.013888*sw, 0.302777*sw, 0.435416*sw, 0.055555*sw);
            title.text = _titleArray[i];
            title.textAlignment = NSTextAlignmentLeft;
            title.textColor = [UIColor blackColor];
            [button addSubview:title];
            
            //第13话 _totalCountArray 20 560 xxx 74
            //0.013888 0.388888 xxx 0.0513888
            UILabel *totalCount = [[UILabel alloc] init];
            totalCount.text = [NSString stringWithFormat:@"第%@话", _totalCountArray[i]];
            totalCount.textColor = [UIColor colorWithRed:0.9686 green:0.3451 blue:0.5294 alpha:1.0];
            //CGSize size =
            //totalCount.frame = CGRectMake(0.013888*sw, 0.388888*sw, <#CGFloat width#>, 0.0513888*sw);
            
        }
    }
    
}

@end







































