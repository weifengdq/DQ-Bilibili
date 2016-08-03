//
//  CategoryCollectionCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/7.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "CategoryCollectionCell.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation CategoryCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        float sw = SCREEN_WIDTH;
        
        _label = [[UILabel alloc] init];
        [self.contentView addSubview:_label];
        
        _imageView = [[UIImageView alloc] init];
        //150 80 180 180
        _imageView.frame = CGRectMake(0.104166*sw, 0.055555*sw, 0.125*sw, 0.125*sw);
        [self.contentView addSubview:_imageView];
    }
    
    return self;
}

- (void)refreshUI {
    float sw = SCREEN_WIDTH;
    
    //动态frame 240-宽/2 270 宽 90
    CGSize size = [_label.text sizeWithFont:_label.font];
    _label.frame = CGRectMake(0.166666*sw-size.width/2, 0.1875*sw, size.width, 0.0625*sw);

}

@end
