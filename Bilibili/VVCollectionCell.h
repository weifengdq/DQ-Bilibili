//
//  VVCollectionCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/1.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VVCollectionCell : UICollectionViewCell

//大体雷同, 局部定制
//通过 param来区分  热门推荐的param为空
@property(nonatomic, copy)NSString *partitionName;  //分区名
@property(nonatomic, copy)NSString *param;  //参数
@property(nonatomic, copy)NSString *countStatue; //x条新动态, 点击刷新 Lives的数量???


@property(nonatomic, retain)NSMutableArray *coverImageArray;    //封面
@property(nonatomic, retain)NSMutableArray *titleImageArray;    //标题
@property(nonatomic, retain)NSMutableArray *playArray;          //播放量
@property(nonatomic, retain)NSMutableArray *danmakuArray;       //弹幕


- (void)refreshUI;

@end
