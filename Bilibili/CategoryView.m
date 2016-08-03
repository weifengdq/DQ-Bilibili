//
//  CategoryView.m
//  Bilibili
//
//  Created by weifengdq on 16/7/7.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "CategoryView.h"
#import <AFNetworking.h>
#import "CategoryMode/CATDataModels.h"
#import "CategoryCollectionCell.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface CategoryView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    
    NSMutableArray *_labelArray;
    NSArray *_imageArray;
}
@end



@implementation CategoryView

- (instancetype)initWithFrame: (CGRect)frame
{
    if (self = [super initWithFrame: frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
        
        _labelArray = [[NSMutableArray alloc] init];
        _imageArray = @[@"zhibo", @"fanju", @"donghua", @"yinyue", @"wudao", @"youxi", @"keji", @"shenghuo", @"guichu", @"shishang", @"yule", @"dianying", @"dianshiju",  @"youxizhongxin"];
        
        //---------------------------------CollectionView-----------------------------------
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //最小行间距
        flowLayout.minimumLineSpacing = 0;
        //单元格左右间距
        flowLayout.minimumInteritemSpacing = 0;
        //滑动方向->竖直方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //view的周边间距 top left bottom right
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //单元格大小  宽360
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH / 3.0, SCREEN_WIDTH *0.25);
        
        _collectionView = [[UICollectionView alloc]
                            initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
                            collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:_collectionView];
        [_collectionView registerClass:[CategoryCollectionCell class]
           forCellWithReuseIdentifier:@"cell"];
        
        
        [self getData];
    }
    
    return self;
}

- (void)getData {
    
    //记得修改info.plist的网络设置
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *URLString = @"http://app.bilibili.com/x/region/list/old";
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [_labelArray removeAllObjects];
        
        CATCategory *model = [CATCategory modelObjectWithDictionary:responseObject];
        for (CATRoot *root in model.result.root) {
            [_labelArray addObject:root.typename];
        }
        
        [_collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - UICollectionViewDataSource  required
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 14;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    CategoryCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"
                                                                           forIndexPath:indexPath];
    /*
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
                                           green:arc4random()%255/255.0
                                            blue:arc4random()%255/255.0
                                           alpha:0.5];
     */
    
    /*
    for (UIView *view in [cell.contentView subviews]) {
        [view removeFromSuperview];
    }
     */
    
    if (_labelArray.count) {
        if (indexPath.row == 0) {
            cell.label.text = @"直播";
        } else if (indexPath.row<13) {
            cell.label.text = _labelArray[indexPath.row - 1];
        } else if (indexPath.row == 13) {
            cell.label.text = @"游戏中心";
        } else {
            ;
        }
        cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    }

    [cell refreshUI];
    return cell;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了%ld", (long)indexPath.row);
}

@end






























