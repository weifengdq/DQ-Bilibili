//
//  LVBCollectionViewCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/1.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LVBCollectionCell : UICollectionViewCell

@property(nonatomic, copy)NSString *partitionName;  //分类名
@property(nonatomic, copy)NSString *countLive;   //当前x个直播
@property(nonatomic, copy)NSString *countStatue; //x条新动态, 点击刷新 Lives的数量???


@property(nonatomic, retain)NSMutableArray *coverImageArray;
@property(nonatomic, retain)NSMutableArray *titleImageArray;
@property(nonatomic, retain)NSMutableArray *onlineArray;
@property(nonatomic, retain)NSMutableArray *ownerNameArray;
@property(nonatomic, retain)NSMutableArray *ownerFaceArray;


- (void)refreshUI;

@end
