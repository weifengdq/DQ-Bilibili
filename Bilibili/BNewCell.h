//
//  BNewCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/9.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNewCell : UICollectionViewCell

@property(nonatomic, copy)NSString *updateCount;

@property(nonatomic, retain)NSMutableArray *coverArray;
@property(nonatomic, retain)NSMutableArray *titleArray;
@property(nonatomic, retain)NSMutableArray *totalCountArray;
@property(nonatomic, retain)NSMutableArray *watchingCountArray;
@property(nonatomic, retain)NSMutableArray *lastTimeArray;

- (void)refreshUI;

@end
