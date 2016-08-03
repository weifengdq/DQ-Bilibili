//
//  VTVCollectionCell.h
//  Bilibili
//
//  Created by weifengdq on 16/7/2.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VTVCollectionCell : UICollectionViewCell<UIScrollViewDelegate>

@property(nonatomic, copy)NSString *partitionStr;
@property(nonatomic, retain)NSMutableArray *coverImageArray;    //封面
@property(nonatomic, retain)NSMutableArray *titleImageArray;    //标题
@property(nonatomic, copy)NSMutableArray *descArray;    //第12话

- (void)refreshUI;

@end
