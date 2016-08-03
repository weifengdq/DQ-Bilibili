//
//  SSDynamicCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/2.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSDynamicCell : UICollectionViewCell

//data -> feeds -> addition
@property(nonatomic, copy)NSString *avatarStr;  //头像
@property(nonatomic, copy)NSString *autherStr;   //用户名
@property(nonatomic, copy)NSString *creatTimeStr;  //2016.05.31(几小时前 几天前 日期)投递了
@property(nonatomic, copy)NSString *picStr;         //封面
@property(nonatomic, copy)NSString *titleStr;       //标题
@property(nonatomic, copy)NSString *playStr;        //播放
@property(nonatomic, copy)NSString *videoReviewStr; //弹幕
@property(nonatomic, copy)NSString *linkStr;

//@property(nonatomic, retain)UIButton *bottomButton; 


- (void)refreshUI;


@end
