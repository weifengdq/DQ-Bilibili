//
//  VTopicCollectionCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/2.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VTopicCollectionCell : UICollectionViewCell

@property(nonatomic, copy)NSString *urlImageStr;

- (void)refreshUI;

@end
