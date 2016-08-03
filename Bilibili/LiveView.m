//
//  LiveView.m
//  Bilibili
//
//  Created by weifengdq on 16/6/30.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "LiveView.h"
#import "LSBCollectionCell.h"
#import "LVBCollectionCell.h"

#import "LiveModel/LiveDataModels.h"

#import "AFNetworking.h"
#import "MJRefresh.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface LiveView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_urlImageArray;
    NSMutableArray *_buttonTextArray;
    
    NSMutableArray *_partitionNameArray;
    NSMutableArray *_countLiveArray;
    NSMutableArray *_countStatueArray;
//    NSString *_partitionName;
//    NSString *_countLive;
//    NSString *_countStatue;
    
    NSMutableArray *_coverImageArray;
    NSMutableArray *_titleImageArray;
    NSMutableArray *_onlineArray;
    NSMutableArray *_ownerNameArray;
    NSMutableArray *_ownerFaceArray;

    
    UICollectionView *_collectionView;
    
    
    NSArray *_labelArray;
    NSArray *_imageArray;
}

//@property(nonatomic, copy)NSString *partitionName;  //分类名
//@property(nonatomic, copy)NSString *countLive;   //当前x个直播
//@property(nonatomic, copy)NSString *countStatue; //x条新动态, 点击刷新 Lives的数量???
//
//
//@property(nonatomic, retain)NSMutableArray *coverImageArray;
//@property(nonatomic, retain)NSMutableArray *titleImageArray;
//@property(nonatomic, retain)NSMutableArray *onlineArray;
//@property(nonatomic, retain)NSMutableArray *ownerNameArray;
//@property(nonatomic, retain)NSMutableArray *ownerFaceArray;

@end


@implementation LiveView

- (instancetype)initWithFrame: (CGRect)frame {
    
    if (self = [super initWithFrame: frame]) {
        
        _labelArray = @[@"手机直播", @"绘画专区", @"萌宅推荐", @"网络游戏", @"单击联机", @"电子竞技", @"全部分类", @"全部直播"];
        _imageArray = @[@"shoujizhibo", @"huihuazhuanqu", @"mengzhaituijian", @"wangluoyouxi", @"danjilianji", @"dianzijingji", @"quanbufenlei", @"quanbuzhibo"];
        
        _urlImageArray = [[NSMutableArray alloc] init];
        _buttonTextArray = [[NSMutableArray alloc] init];
        
        _partitionNameArray = [[NSMutableArray alloc] init];
        _countLiveArray = [[NSMutableArray alloc] init];
        _countStatueArray = [[NSMutableArray alloc] init];
        
        
        _coverImageArray = [[NSMutableArray alloc] init];
        _titleImageArray = [[NSMutableArray alloc] init];
        _onlineArray = [[NSMutableArray alloc] init];;
        _ownerNameArray = [[NSMutableArray alloc] init];
        _ownerFaceArray = [[NSMutableArray alloc] init];
        
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
        //单元格大小
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 1.073);
        
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-130) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        //_collectionView.pagingEnabled = YES;
    
        
        [self addSubview:_collectionView];
        
        [_collectionView registerClass:[LSBCollectionCell class]
           forCellWithReuseIdentifier:@"cell"];

        [_collectionView registerClass:[LVBCollectionCell class]
            forCellWithReuseIdentifier:@"cell1"];
        
        [self getData];
        
        
        //上拉下拉刷新
//        _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getData)];
//        [_collectionView.header beginRefreshing];
        
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getData)];
        //[_collectionView.mj_header beginRefreshing];
        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getData)];
        
    }
    
    return self;
}

- (void)getData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *URLString = @"http://live.bilibili.com/AppIndex/home?_device=android&_hwid=852fb80e125d18c0&_ulv=10000&access_key=8eff2447da4b97c6d9a4a45031d9a5ea&appkey=1d8b6e7d45233436&build=420000&mobi_app=android&platform=android&scale=xxhdpi&sign=48c668d9213f3565efe99d25241a470c";
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [_collectionView.mj_header endRefreshing];
        [_collectionView.mj_footer endRefreshing];
        
        LSLiveModel *model = [LSLiveModel modelObjectWithDictionary:responseObject];
        
        [_urlImageArray removeAllObjects];
        [_buttonTextArray removeAllObjects];
        
        [_partitionNameArray removeAllObjects];
        [_countLiveArray removeAllObjects];
        [_countStatueArray removeAllObjects];
        
        [_coverImageArray removeAllObjects];
        [_titleImageArray removeAllObjects];
        [_onlineArray removeAllObjects];
        [_ownerNameArray removeAllObjects];
        [_ownerFaceArray removeAllObjects];
        
        
        for (LSBanner *data in model.data.banner) {
            [_urlImageArray addObject:data.img];
        }
        
        for (LSEntranceIcons *icon in model.data.entranceIcons) {
            [_buttonTextArray addObject:icon.name];
        }
        
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
//        [_collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];

//        int i = 0;
        for (LSPartitions *partitions in model.data.partitions) {
//            i++;
            
            
            LSPartition *partion = partitions.partition;
            
            [_partitionNameArray addObject:partion.name];
            [_countLiveArray addObject:[NSString stringWithFormat:@"%d", (int)partion.count]];
            
//            _partitionName = partion.name;
//            _countLive = [NSString stringWithFormat:@"%f", partion.count];
        
            
            NSMutableArray *coverImageArray = [[NSMutableArray alloc] init];
            NSMutableArray *titleImageArray = [[NSMutableArray alloc] init];
            NSMutableArray *onlineArray = [[NSMutableArray alloc] init];
            NSMutableArray *ownerNameArray = [[NSMutableArray alloc] init];
            NSMutableArray *ownerFaceArray = [[NSMutableArray alloc] init];
            
            int j = 0;
            for (LSLives *lives in partitions.lives) {
                j++;
                [coverImageArray addObject:lives.cover.src];
                [titleImageArray addObject:lives.title];
                [onlineArray addObject:[NSString stringWithFormat:@"%d", (int)lives.online]];
                [ownerNameArray addObject:lives.owner.name];
                [ownerFaceArray addObject:lives.owner.face];
            }
            
            [_countStatueArray addObject:[NSString stringWithFormat:@"%d", j]];
            
            [_coverImageArray addObject:coverImageArray];
            [_titleImageArray addObject:titleImageArray];
            [_onlineArray addObject:onlineArray];
            [_ownerFaceArray addObject:ownerFaceArray];
            [_ownerNameArray addObject:ownerNameArray];
            
//            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//            [_collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
            
        }
    
        
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
//        [_collectionView reloadItemsAtIndexPaths:indexPath];
//        //一个section刷新
//        NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:2];
//        [tableview reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
//        //一个cell刷新
//        NSIndexPath *indexPath=[NSIndexPath indexPathForRow:3 inSection:0];
//        [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
        
        
        [_collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


#pragma mark - UICollectionViewDataSource  required
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _partitionNameArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        LSBCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
        //cell.contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 0.629);
        
//        cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
//                                               green:arc4random()%255/255.0
//                                                blue:arc4random()%255/255.0
//                                               alpha:0.5];
        //[cell.urlImageArray removeAllObjects];
        //[cell.buttonTextArray removeAllObjects];
        
        for (UIView *view in [cell.contentView subviews]) {
            [view removeFromSuperview];
        }
        
        cell.urlImageArray = _urlImageArray;
        cell.buttonTextArray = _buttonTextArray;
        
        cell.labelArray = _labelArray;
        cell.imageArray = _imageArray;
        
        [cell refreshUI];

        return cell;
    }
    

    LVBCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1"
                                                                           forIndexPath:indexPath];
    //UIView *oldView = [cell.contentView viewWithTag:1000];
    //[oldView removeFromSuperview];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
//                                           green:arc4random()%255/255.0
//                                            blue:arc4random()%255/255.0
//                                           alpha:0.5];
    
    //        NSString *_partitionName;
    //        NSString *_countLive;
    //        NSString *_countStatue;
    
    //        _urlImageArray = [[NSMutableArray alloc] init];
    //        _buttonTextArray = [[NSMutableArray alloc] init];
    //
    //        _coverImageArray = [[NSMutableArray alloc] init];
    //        _titleImageArray = [[NSMutableArray alloc] init];
    //        _onlineArray = [[NSMutableArray alloc] init];;
    //        _ownerNameArray = [[NSMutableArray alloc] init];
    //        _ownerFaceArray = [[NSMutableArray alloc] init];
//    cell.partitionName = [_partitionNameArray objectAtIndex:indexPath.row-1];
//    cell.countLive = [_partitionNameArray objectAtIndex:indexPath.row -1];
    
    for (UIView *view in [cell.contentView subviews]) {
        [view removeFromSuperview];
    }
    
//    cell.partitionName = _partitionName;
//    cell.countLive = _countLive;
//    cell.countStatue = _countLive;
    if (_partitionNameArray.count >= 12) {
        cell.partitionName = _partitionNameArray[indexPath.row - 1];
        cell.countLive = _countLiveArray[indexPath.row - 1];
        cell.countStatue = _countStatueArray[indexPath.row - 1];
        
        cell.coverImageArray = _coverImageArray[indexPath.row - 1];
        cell.titleImageArray = _titleImageArray[indexPath.row - 1];
        cell.onlineArray = _onlineArray[indexPath.row - 1];
        cell.ownerFaceArray = _ownerFaceArray[indexPath.row - 1];
        cell.ownerNameArray = _ownerNameArray[indexPath.row - 1];
    }
    
    [cell refreshUI];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.760);
    }
    
    return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 1.236);
}

@end
































