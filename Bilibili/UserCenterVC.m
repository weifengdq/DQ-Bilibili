//
//  UserCenterVC.m
//  Bilibili
//
//  Created by weifengdq on 16/7/4.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "UserCenterVC.h"
#import "UCHeadCollectionCell.h"
#import "UCNormalCollectionCell.h"
#import "UCHeaderCell.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface UserCenterVC ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    NSArray *_imageArray;
    NSArray *_highlightImageArray;
    NSArray *_titleArray;
}
@end

@implementation UserCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageArray = [[NSArray alloc] initWithObjects:
                   @"shouye", @"xiazai", @"shoucang",
                   @"lishi", @"guanzhu", @"qianbao",
                   @"zhuti", @"yingyong", @"shezhi", nil];
    
    _highlightImageArray = [[NSArray alloc] initWithObjects:
                   @"shouye2", @"xiazai2", @"shoucang2",
                   @"lishi2", @"guanzhu2", @"qianbao2",
                   @"zhuti2", @"yingyong2", @"shezhi2", nil];
    _titleArray = [[NSArray alloc] initWithObjects:@"首页", @"离线缓存", @"我的收藏", @"历史记录", @"关注的人", @"我的钱包", @"主题选择", @"应用推荐", @"设置与帮助", nil];
    
    
    
    //-----------------CollectionView----------------
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //最小行间距
    flowLayout.minimumLineSpacing = 0;
    //单元格左右间距
    flowLayout.minimumInteritemSpacing = 0;
    //滑动方向->竖直方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //view的周边间距 top left bottom right
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //单元格大小 1064 771
    flowLayout.itemSize = CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.535416);
    
    //设置collectionView头视图的大小
//    flowLayout.headerReferenceSize = CGSizeMake(0.738888*SCREEN_WIDTH, 10);
//   flowLayout.footerReferenceSize = CGSizeMake(0.738888*SCREEN_WIDTH, 10);
    
    
    //宽度1064
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0.738888*SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collectionView];
    
    //注册cell单元格
    [collectionView registerClass:[UCHeadCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    [collectionView registerClass:[UCNormalCollectionCell class] forCellWithReuseIdentifier:@"cell1"];
    [collectionView registerClass:[UCHeaderCell class] forCellWithReuseIdentifier:@"cell2"];
//    //注册头视图
//    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
//    //注册尾视图
//    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    
    //视图被固定死怎么搞? 下拉不能拉出白
    
    
//        collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewContentModeBottom | UIViewAutoresizingFlexibleHeight;
    collectionView.showsVerticalScrollIndicator = NO;
    
    //整个右边弄成一个透明的button
    _rightButton = [[UIButton alloc] init];
    _rightButton.frame = CGRectMake(0.738888*SCREEN_WIDTH, 0, (1-0.738888)*SCREEN_WIDTH, SCREEN_HEIGHT);
//    _rightButton.backgroundColor = [UIColor blackColor];
//    _rightButton.alpha = 0.2;
    [self.view addSubview:_rightButton];
    
    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:1 inSection:1];
//    [self collectionView:collectionView didSelectItemAtIndexPath:indexPath];


}

#pragma mark - UICollectionViewDataSource  required
//第2被执行
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 4;
    } else if (section == 2) {
        return 6;
    } else {
        return 5;
    }
}

//第4被执行
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        UCHeadCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        
        return cell;
    } else {
        if (indexPath.section!=0 && indexPath.row == 0) {   //头
            UCHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];

            //cell.backgroundColor = [UIColor purpleColor];
            return cell;
        } else if ((indexPath.section==1&&indexPath.row==3) || (indexPath.section==2&&indexPath.row==5) || (indexPath.section==3&&indexPath.row==4)) {  //尾 和 头的高度不一致
            UCHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
            //cell.backgroundColor = [UIColor orangeColor];
            //cell.haveLine = YES;
            [cell refreshUI];
            return cell;
        } else {
            UCNormalCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
            
            if (indexPath.section==1 && indexPath.row == 1) {
                cell.label.text = _titleArray[0];
                cell.imageView.image = [UIImage imageNamed:_imageArray[0]];
                cell.imageView.highlightedImage =[UIImage imageNamed:_highlightImageArray[0]];
                
                //                cell.selected = YES;
//                cell.highlighted = YES;
//                cell.contentView.backgroundColor = [UIColor colorWithRed:0.8863 green:0.8863 blue:0.8863 alpha:1.0];
                
            } else if (indexPath.section==1 && indexPath.row==2) {
                cell.label.text = _titleArray[1];
                cell.imageView.image = [UIImage imageNamed:_imageArray[1]];
                cell.imageView.highlightedImage =[UIImage imageNamed:_highlightImageArray[1]];
            } else if (indexPath.section==2 && indexPath.row==1) {
                cell.label.text = _titleArray[2];
                cell.imageView.image = [UIImage imageNamed:_imageArray[2]];
                cell.imageView.highlightedImage =[UIImage imageNamed:_highlightImageArray[2]];
            } else if (indexPath.section==2 && indexPath.row==2) {
                cell.label.text = _titleArray[3];
                cell.imageView.image = [UIImage imageNamed:_imageArray[3]];
                cell.imageView.highlightedImage =[UIImage imageNamed:_highlightImageArray[3]];
            } else if (indexPath.section==2 && indexPath.row==3) {
                cell.label.text = _titleArray[4];
                cell.imageView.image = [UIImage imageNamed:_imageArray[4]];
                cell.imageView.highlightedImage =[UIImage imageNamed:_highlightImageArray[4]];
            } else if (indexPath.section==2 && indexPath.row==4) {
                cell.label.text = _titleArray[5];
                cell.imageView.image = [UIImage imageNamed:_imageArray[5]];
                cell.imageView.highlightedImage =[UIImage imageNamed:_highlightImageArray[5]];
            } else if (indexPath.section==3 && indexPath.row==1) {
                cell.label.text = _titleArray[6];
                cell.imageView.image = [UIImage imageNamed:_imageArray[6]];
                cell.imageView.highlightedImage =[UIImage imageNamed:_highlightImageArray[6]];
            } else if (indexPath.section==3 && indexPath.row==2) {
                cell.label.text = _titleArray[7];
                cell.imageView.image = [UIImage imageNamed:_imageArray[7]];
                cell.imageView.highlightedImage =[UIImage imageNamed:_highlightImageArray[7]];
            } else if (indexPath.section==3 && indexPath.row==3) {
                cell.label.text = _titleArray[8];
                cell.imageView.image = [UIImage imageNamed:_imageArray[8]];
                cell.imageView.highlightedImage =[UIImage imageNamed:_highlightImageArray[8]];
            } else {
                ;
            }
            
            [cell refreshUI];
            return cell;
        }
        
    }
    
}


//4个区  第1被执行
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}


#pragma mark - UICollectionViewDelegateFlowLayout
//第3被执行
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 0) {
//        return CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.535416);
//    }
////    else if (indexPath.section == 1) { //33*2 + 192*2 = 450
////        return CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.3125);
////    } else if (indexPath.section == 2) {
////        return CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.579166);
////    } else {
////        return CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.3125);
////    }
//    
//    return CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.133333);
    
    
    if (indexPath.section == 0) {
        return CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.535416);
    } else {
        if (indexPath.section!=0 && indexPath.row == 0) {   //头
            return CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.022222);
        } else if ((indexPath.section==1&&indexPath.row==3) || (indexPath.section==2&&indexPath.row==5) || (indexPath.section==3&&indexPath.row==4)) {  //尾 和 头的高度不一致
            return CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.026388);
        } else {
            return CGSizeMake(0.738888*SCREEN_WIDTH, SCREEN_WIDTH * 0.133333);
        }
        
    }

}

//是否可以被选择
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//选中高亮
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//选中时调用的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ((indexPath.section!=0 && indexPath.row == 0) || (indexPath.section==1&&indexPath.row==3) || (indexPath.section==2&&indexPath.row==5) || (indexPath.section==3&&indexPath.row==4)) {
        return;
    }
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:0.8863 green:0.8863 blue:0.8863 alpha:1.0];
//    NSLog(@"选中了%d", (int)indexPath.row);
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.highlighted = NO;
//    cell.selected = NO;
    cell.contentView.backgroundColor = [UIColor whiteColor];
}




//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    //头视图
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
//
////        UIView *view = [[UIView alloc] init];
////        view.frame = CGRectMake(0, 0, 0.738888*SCREEN_WIDTH, 10);
////        view.backgroundColor = [UIColor orangeColor];
////        [header addSubview:view];
//
//        return header;
//
//    }
//
//    return nil;
////    else {
////        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
////
////        UIView *view = [[UIView alloc] init];
////        view.frame = CGRectMake(0, 0, 0.738888*SCREEN_WIDTH, 10);
////        view.backgroundColor = [UIColor orangeColor];
////        [footer addSubview:view];
////
////        return footer;
////    }
//
////    //尾视图
////    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
////        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
////
////        UIView *view = [[UIView alloc] init];
////        view.frame = CGRectMake(0, 0, 0.738888*SCREEN_WIDTH, 10);
////        view.backgroundColor = [UIColor orangeColor];
////        [footer addSubview:view];
////
////        return footer;
////    }
////
////    return nil;
//
//}

@end









































