//
//  BScrollCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/9.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BScrollCell : UICollectionViewCell

@property(nonatomic, retain)NSMutableArray *urlImageArray;

- (void)refreshUI;

@end
