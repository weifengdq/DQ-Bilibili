//
//  UCNormalCollectionCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/4.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UCNormalCollectionCell : UICollectionViewCell

@property(nonatomic, assign)BOOL *isSelect;
@property(nonatomic, retain)UILabel *label;
@property(nonatomic, retain)UIImageView *imageView;

- (void)refreshUI;

@end
