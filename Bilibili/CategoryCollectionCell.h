//
//  CategoryCollectionCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/7.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryCollectionCell : UICollectionViewCell

@property(nonatomic, retain)UILabel *label;
@property(nonatomic, retain)UIImageView *imageView;

- (void)refreshUI;

@end
