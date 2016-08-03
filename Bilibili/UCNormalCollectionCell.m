//
//  UCNormalCollectionCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/4.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "UCNormalCollectionCell.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation UCNormalCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        int sw = SCREEN_WIDTH;
        
        //前面的图片 68 51 90 * 90
        _imageView = [[UIImageView alloc] init];
        _imageView.frame = CGRectMake(0.047222*sw, 0.035416*sw, 0.0625*sw, 0.0625*sw);
        [self.contentView addSubview:_imageView];
        
        //280 53 xxx 87
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        _label.highlightedTextColor = [UIColor colorWithRed:0.9686 green:0.3451 blue:0.5294 alpha:1.0];
        
    }
    return self;
}

- (void)refreshUI {
    int sw = SCREEN_WIDTH;

    CGSize size = [_label.text sizeWithFont:_label.font];
    _label.frame = CGRectMake(0.194444*sw, 0.036805*sw, size.width, 0.0604166*sw);
    
    //imageView背景图片的改变在控制器中写

}

@end
