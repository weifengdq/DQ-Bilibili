//
//  SubscriptionsView.m
//  Bilibili
//
//  Created by weifengdq on 16/6/28.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "SubscriptionsView.h"
#import "SSBangumiCell.h"
#import "SSDynamicCell.h"

#import "SubscriptionsModel/SubDataModels.h"

#import "AFNetworking.h"
#import "MJRefresh.h"


#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

////data -> feeds -> addition
//@property(nonatomic, copy)NSString *avatarStr;  //头像
//@property(nonatomic, copy)NSString *autherStr;   //用户名
//@property(nonatomic, copy)NSString *creatTimeStr;  //2016.05.31(几小时前 几天前 日期)投递了
//@property(nonatomic, copy)NSString *picStr;         //封面
//@property(nonatomic, copy)NSString *titleStr;       //标题
//@property(nonatomic, copy)NSString *playStr;        //播放
//@property(nonatomic, copy)NSString *videoReviewStr; //弹幕

@interface SubscriptionsView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

{
    NSMutableArray *_avatarArray;
    NSMutableArray *_autherArray;
    NSMutableArray *_creatTimeArray;
    NSMutableArray *_picArray;
    NSMutableArray *_titleArray;
    NSMutableArray *_playArray;
    NSMutableArray *_videoReviewArray;
    NSMutableArray *_linkArray;
    
    UICollectionView *_collectionView;
    
}
@end


@implementation SubscriptionsView

- (instancetype)initWithFrame: (CGRect)frame {
    
    if (self = [super initWithFrame: frame]) {
        _avatarArray = [[NSMutableArray alloc] init];
        _autherArray = [[NSMutableArray alloc] init];
        _creatTimeArray = [[NSMutableArray alloc] init];
        _picArray = [[NSMutableArray alloc] init];
        _titleArray = [[NSMutableArray alloc] init];
        _playArray = [[NSMutableArray alloc] init];
        _videoReviewArray = [[NSMutableArray alloc] init];
        _linkArray = [[NSMutableArray alloc] init];
        
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
        
        [_collectionView registerClass:[SSBangumiCell class]
            forCellWithReuseIdentifier:@"cell"];
        
        [_collectionView registerClass:[SSDynamicCell class]
            forCellWithReuseIdentifier:@"cell1"];
        
        [self getData];
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getData)];
        //[_collectionView.mj_header beginRefreshing];
        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getData)];

        
        
        
    }
    return self;
}

- (void)getData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *URLString = @"http://api.bilibili.com/x/feed/pull?_device=android&_hwid=852fb80e125d18c0&_ulv=10000&access_key=8eff2447da4b97c6d9a4a45031d9a5ea&appkey=1d8b6e7d45233436&build=420000&mobi_app=android&platform=android&pn=1&ps=20&type=0&sign=9df427f7573d5454333aca02d88c9902";
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [_collectionView.mj_header endRefreshing];
        [_collectionView.mj_footer endRefreshing];
        
        SSSubModel *model = [SSSubModel modelObjectWithDictionary:responseObject];
        
        [_avatarArray removeAllObjects];
        [_autherArray removeAllObjects];
        [_creatTimeArray removeAllObjects];
        [_picArray removeAllObjects];
        [_titleArray removeAllObjects];
        [_playArray removeAllObjects];
        [_videoReviewArray removeAllObjects];
        [_linkArray removeAllObjects];
        
        for (SSFeeds *feeds in model.data.feeds) {
            [_avatarArray addObject:feeds.source.avatar];
            [_autherArray addObject:feeds.addition.author];
            [_creatTimeArray addObject:feeds.addition.create];
            [_picArray addObject:feeds.addition.pic];
            [_titleArray addObject:feeds.addition.title];
            [_linkArray addObject:feeds.addition.link];
            
            if (((int)feeds.addition.play) >=10000) {
                [_playArray addObject:[NSString stringWithFormat:@"%.1f万", feeds.addition.play/10000.0]];
            } else {
                [_playArray addObject:[NSString stringWithFormat:@"%d", (int)feeds.addition.play]];
            }
            if (((int)feeds.addition.videoReview) >= 10000) {
                [_videoReviewArray addObject:[NSString stringWithFormat:@"%.1f万",feeds.addition.videoReview/10000.0]];
            } else {
                [_videoReviewArray addObject:[NSString stringWithFormat:@"%d", (int)feeds.addition.videoReview]];
            }
            
        }
        [_collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}

#pragma mark - UICollectionViewDataSource  required
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _avatarArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        SSBangumiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        
        for (UIView *view in [cell.contentView subviews]) {
            [view removeFromSuperview];
        }
        
        [cell refreshUI];
        
        return cell;
    }
    
    
    SSDynamicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
    for (UIView *view in [cell.contentView subviews]) {
        [view removeFromSuperview];
    }

    
    if (_avatarArray.count > 0) {
        cell.avatarStr = _avatarArray[indexPath.row - 1];
        cell.autherStr = _autherArray[indexPath.row - 1];
        cell.creatTimeStr = _creatTimeArray[indexPath.row - 1];
        cell.picStr = _picArray[indexPath.row - 1];
        cell.titleStr = _titleArray[indexPath.row - 1];
        cell.playStr = _playArray[indexPath.row - 1];
        cell.videoReviewStr = _videoReviewArray[indexPath.row - 1];
        cell.linkStr = _linkArray[indexPath.row - 1];

    }
    
    [cell refreshUI];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.6625);  //含动态文字 cell 高度954 (0.6625)
    }
    
    return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.490277);  //高度706 (0.490277)
}


@end








































