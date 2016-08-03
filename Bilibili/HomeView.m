//
//  HomeView.m
//  Bilibili
//
//  Created by weifengdq on 16/6/28.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "HomeView.h"
#import "VSCollectionCell.h"
#import "VVCollectionCell.h"
#import "VTopicCollectionCell.h"
#import "VBCollectionCell.h"
#import "VTVCollectionCell.h"
#import "LVBCollectionCell.h"
#import "MJRefresh.h"

#import <AFNetworking.h>
#import "HomeScrollModel/HomeDataModels.h"
#import "HomeResultModel/HResultDataModels.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface HomeView ()<UICollectionViewDataSource, UICollectionViewDelegate>
{
    //VSCollectionCell.h
    NSMutableArray *_urlImageVSArray;
    
    //VVCollectionCell.h
    NSMutableArray *_partitionNameVVArray;
    NSMutableArray *_paramVVArray;
    NSMutableArray *_countStatueVVArray;
    
    NSMutableArray *_coverImageVVArrArr;
    NSMutableArray *_titleImageVVArrArr;
    NSMutableArray *_playVVArrArr;
    NSMutableArray *_danmakuVVArrArr;
    
    //LVBCollectionCell
    NSMutableArray *_partionNameLVBArray;
    NSMutableArray *_countLiveLVBArray;
    NSMutableArray *_countStatusLVBArray;
    
    NSMutableArray *_coverImageLVBArrArr;
    NSMutableArray *_titleImageLVBArrArr;
    NSMutableArray *_onlineLVBArrArr;
    NSMutableArray *_ownerNameLVBArrArr;
    NSMutableArray *_ownerFaceLVBArrArr;
    
    //VTopicCollectionCell.h
    NSMutableArray *_urlImageStrVTArray;
    
    //VBCollectionCell.h
    NSMutableArray *_coverImageVBArrArr;
    NSMutableArray *_titleImageVBArrArr;
    NSMutableArray *_descStrVBArrArr;
    NSMutableArray *_glpicStrVBArray;
    
    //VTVCollectionCell.h
    NSMutableArray *_partionStrVTVArray;
    NSMutableArray *_coverImageVTVArrArr;
    NSMutableArray *_titleImageVTVArrArr;
    NSMutableArray *_descStrVTVArrArr;
    
    //设置一个type数组用来区分应该用什么种类的cell
    NSMutableArray *_typeArray;
    
    UICollectionView *_collectionView;
}
@end

@implementation HomeView

- (instancetype)initWithFrame: (CGRect)frame {
    
    if (self = [super initWithFrame: frame]) {
        
        _urlImageVSArray = [[NSMutableArray alloc] init];
        
        _partitionNameVVArray = [[NSMutableArray alloc] init];
        _paramVVArray = [[NSMutableArray alloc] init];
        _countStatueVVArray = [[NSMutableArray alloc] init];
        _coverImageVVArrArr = [[NSMutableArray alloc] init];
        _titleImageVVArrArr = [[NSMutableArray alloc] init];
        _playVVArrArr = [[NSMutableArray alloc] init];
        _danmakuVVArrArr = [[NSMutableArray alloc] init];
        
        
        _partionNameLVBArray = [[NSMutableArray alloc] init];
        _countLiveLVBArray = [[NSMutableArray alloc] init];
        _countStatusLVBArray = [[NSMutableArray alloc] init];
        
        _coverImageLVBArrArr = [[NSMutableArray alloc] init];
        _titleImageLVBArrArr = [[NSMutableArray alloc] init];
        _onlineLVBArrArr = [[NSMutableArray alloc] init];
        _ownerNameLVBArrArr = [[NSMutableArray alloc] init];
        _ownerFaceLVBArrArr = [[NSMutableArray alloc] init];
        
        _urlImageStrVTArray = [[NSMutableArray alloc] init];
        
        _coverImageVBArrArr = [[NSMutableArray alloc] init];
        _titleImageVBArrArr = [[NSMutableArray alloc] init];
        _descStrVBArrArr = [[NSMutableArray alloc] init];
        _glpicStrVBArray = [[NSMutableArray alloc] init];
        
        _partionStrVTVArray = [[NSMutableArray alloc] init];
        _coverImageVTVArrArr = [[NSMutableArray alloc] init];
        _titleImageVTVArrArr = [[NSMutableArray alloc] init];
        _descStrVTVArrArr = [[NSMutableArray alloc] init];
        
        _typeArray = [[NSMutableArray alloc] init];
        
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
        
        [_collectionView registerClass:[VSCollectionCell class]
            forCellWithReuseIdentifier:@"cell"];
        
        [_collectionView registerClass:[VVCollectionCell class]
            forCellWithReuseIdentifier:@"cell1"];
        
        [_collectionView registerClass:[LVBCollectionCell class]
            forCellWithReuseIdentifier:@"cell2"];
        
        [_collectionView registerClass:[VBCollectionCell class]
            forCellWithReuseIdentifier:@"cell3"];
        
        [_collectionView registerClass:[VTVCollectionCell class]
            forCellWithReuseIdentifier:@"cell4"];
        
        [_collectionView registerClass:[VTopicCollectionCell class]
            forCellWithReuseIdentifier:@"cell5"];
        
        //带上拉下拉刷新 一刷新会出现数组越界, 会崩溃...
//        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getData)];
        //[_collectionView.mj_header beginRefreshing];
        
        
        [self getData];
        
//        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getData)];
        
        
    }
    
    return self;
}

- (void)getData {
    //-----------------------------Scroll Get请求-------------------------------------
    //记得修改info.plist的网络设置
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *URLString = @"http://app.bilibili.com/x/banner?plat=1";
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        
        [_urlImageVSArray removeAllObjects];
        
        HSHomeScrollModel *model = [HSHomeScrollModel modelObjectWithDictionary:responseObject];
        
        
        for (HSData *data in model.data) {
            [_urlImageVSArray addObject:data.image];
        }
        
        //[NSThread sleepForTimeInterval:0.5f];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
        [_collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
        //[_collectionView reloadData];
        
        //[NSThread sleepForTimeInterval:1.0f];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2f target:self selector:@selector(reloadData1) userInfo:nil repeats:nil];
        [timer fire];
        
        //[self getData1];    //放到这里, 用来进行线程同步
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}

- (void)reloadData1 {
    [self getData1];
}

- (void)getData1 {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *URLString = @"http://app.bilibili.com/x/show/old";
    [manager GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [_collectionView.mj_header endRefreshing];
        [_collectionView.mj_footer endRefreshing];
        
        HRHomeResultModel *model = [HRHomeResultModel modelObjectWithDictionary:responseObject];

        //VVCollectionCell.h
        //        NSMutableArray *_partitionNameVVArray;
        //        NSMutableArray *_paramVVArray;
        //        NSMutableArray *_countStatueVVArray;
        //
        //        NSMutableArray *_coverImageVVArrArr;
        //        NSMutableArray *_titleImageVVArrArr;
        //        NSMutableArray *_playVVArrArr;
        //        NSMutableArray *_danmakuVVArrArr;
        
        [_partitionNameVVArray removeAllObjects];
        [_paramVVArray removeAllObjects];
        [_countStatueVVArray removeAllObjects];
        [_coverImageVTVArrArr removeAllObjects];
        [_titleImageVTVArrArr removeAllObjects];
        [_playVVArrArr removeAllObjects];
        [_danmakuVVArrArr removeAllObjects];
        
        //LVBCollectionCell
        [_partionNameLVBArray removeAllObjects];;
        [_countLiveLVBArray removeAllObjects];
        [_countStatusLVBArray removeAllObjects];
        
        [_coverImageLVBArrArr removeAllObjects];
        [_titleImageLVBArrArr removeAllObjects];
        [_onlineLVBArrArr removeAllObjects];
        [_ownerNameLVBArrArr removeAllObjects];
        [_ownerFaceLVBArrArr removeAllObjects];
        
        //VTopicCollectionCell.h
        [_urlImageStrVTArray removeAllObjects];
        
        //VBCollectionCell.h
        [_coverImageVBArrArr removeAllObjects];
        [_titleImageVBArrArr removeAllObjects];
        [_descStrVBArrArr removeAllObjects];
        [_glpicStrVBArray removeAllObjects];
        
        //VTVCollectionCell.h
        [_partionStrVTVArray removeAllObjects];
        [_coverImageVTVArrArr removeAllObjects];
        [_titleImageVTVArrArr removeAllObjects];
        [_descStrVTVArrArr removeAllObjects];
        
        //数组加入nil会崩溃 object cannot be nil
        int k = 0;
        for (HRResult *result in model.result) {
            k++;
            
            if (![result.head.style isEqualToString:@"gl_pic"]) {
                [_typeArray addObject:result.type];
            } else {
                [_typeArray addObject:@"nil"];
            }
//            if (result.type.length > 0) {
//                [_typeArray addObject:result.type];
//            } else {
//                [_typeArray addObject:@"nil"];
//            }
            
            
            //VBCollectionCell
//            if ([result.type isEqualToString:@"bangumi_2"] || result.type.length == 0) {
            
            //[result.head.style isEqualToString:@"gl_pic"]应该放到最前面, 顺序很重要!!!
            if ([result.head.style isEqualToString:@"gl_pic"] || [result.type isEqualToString:@"bangumi_2"]) {
                if ([result.type isEqualToString:@"bangumi_2"]) {
                    NSMutableArray *coverImageVBArr = [[NSMutableArray alloc] init];
                    NSMutableArray *titleImageVBArr = [[NSMutableArray alloc] init];
                    
                    NSMutableArray *descStrArr = [[NSMutableArray alloc] init];
                    
                    for (HRBody *body in result.body) {
                        [coverImageVBArr addObject:body.cover];
                        [titleImageVBArr addObject:body.title];
                        [descStrArr addObject:body.desc1];
                    }
                    
                    [_coverImageVBArrArr addObject:coverImageVBArr];
                    [_titleImageVBArrArr addObject:titleImageVBArr];
                    [_descStrVBArrArr addObject:descStrArr];
                }
                if([result.head.style isEqualToString:@"gl_pic"]) {
                    for (HRBody *body in result.body) {
                        [_glpicStrVBArray addObject:body.cover];
                    }
                }
            }
            else
            
            //VVCollectionCell
            if ([result.type isEqualToString:@"region"] || [result.type isEqualToString:@"recommend"]) {
                [_partitionNameVVArray addObject:result.head.title];
                
//                if (result.head.param.length > 0) {
                if (![result.type isEqualToString:@"recommend"]) {
                    [_paramVVArray addObject:[NSString stringWithFormat:@"%d", (int)result.head.param]];
                } else {
                    [_paramVVArray addObject:@"kong"];
                }
                
                [_countStatueVVArray addObject:[NSString stringWithFormat:@"%d", arc4random()%255]];
                
                NSMutableArray *coverImageVVArr = [[NSMutableArray alloc] init];
                NSMutableArray *titleImageVVArr = [[NSMutableArray alloc] init];
                NSMutableArray *playVVArr = [[NSMutableArray alloc] init];
                NSMutableArray *danmakuVVArr = [[NSMutableArray alloc] init];
                
                for (HRBody *body in result.body) {
                    [coverImageVVArr addObject:body.cover];
                    [titleImageVVArr addObject:body.title];
                    [playVVArr addObject:body.play];
                    [danmakuVVArr addObject:body.danmaku];
                }
                
                [_coverImageVVArrArr addObject:coverImageVVArr];
                [_titleImageVVArrArr addObject:titleImageVVArr];
                [_playVVArrArr addObject:playVVArr];
                [_danmakuVVArrArr addObject:danmakuVVArr];
            }
            
            else
            
            //LVBCollectionCell
            if ([result.type isEqualToString:@"live"]) {
                NSMutableArray *coverImageLVBArrArr = [[NSMutableArray alloc] init];
                NSMutableArray *titleImageLVBArrArr = [[NSMutableArray alloc] init];
                NSMutableArray *onlineLVBArrArr = [[NSMutableArray alloc] init];
                NSMutableArray *ownerNameLVBArrArr = [[NSMutableArray alloc] init];
                NSMutableArray *ownerFaceLVBArrArr = [[NSMutableArray alloc] init];
                
                [_partionNameLVBArray addObject:result.head.title];
                [_countLiveLVBArray addObject:[NSString stringWithFormat:@"%d", (int)result.head.count]];
                [_countStatusLVBArray addObject:[NSString stringWithFormat:@"%d", arc4random()%255]];
                
                for (HRBody *body in result.body) {
                    [coverImageLVBArrArr addObject:body.cover];
                    [titleImageLVBArrArr addObject:body.title];
                    [onlineLVBArrArr addObject:[NSString stringWithFormat:@"%d", (int)body.online]];
                    [ownerNameLVBArrArr addObject:body.up];
                    [ownerFaceLVBArrArr addObject:body.upFace];
                }
                
                [_coverImageLVBArrArr addObject:coverImageLVBArrArr];
                [_titleImageLVBArrArr addObject:titleImageLVBArrArr];
                [_onlineLVBArrArr addObject:onlineLVBArrArr];
                [_ownerNameLVBArrArr addObject:ownerNameLVBArrArr];
                [_ownerFaceLVBArrArr addObject:ownerFaceLVBArrArr];
                
                
            }
            
            else
            
            //VTVCollectionCell
            if ([result.type isEqualToString:@"bangumi_3"]) {
                NSMutableArray *coverImageVTVArr = [[NSMutableArray alloc] init];
                NSMutableArray *titleImageVTVArr = [[NSMutableArray alloc] init];
                NSMutableArray *descArray = [[NSMutableArray alloc] init];
                
                [_partionStrVTVArray addObject:result.head.title];
                
                for (HRBody *body in result.body) {
                    [coverImageVTVArr addObject:body.cover];
                    [titleImageVTVArr addObject:body.title];
                    [descArray addObject:body.desc1];
                }
                
                [_coverImageVTVArrArr addObject:coverImageVTVArr];
                [_titleImageVTVArrArr addObject:titleImageVTVArr];
                [_descStrVTVArrArr addObject:descArray];
                
            }
            
            else
            
            //VTopicCollectionCell
            if ([result.type isEqualToString:@"weblink"]) {
                for (HRBody *body in result.body) {
                    [_urlImageStrVTArray addObject:body.cover];
                }
            } else {
                ;
            }
            

            
            //刷新cell
//            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:k inSection:0];
//            [_collectionView reloadItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
        }
        
        //主线程停了白停, 还是不行的, 不如放到分线程中
        //[NSThread sleepForTimeInterval:1.0f];   //延时1s防崩溃, 其实应该和上面的getdata做线程同步, 不应该在主线程添加的
                                                //没有网或网速不好的时候会崩溃
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(reloadData) userInfo:nil repeats:nil];
        [timer fire];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

- (void)reloadData {
    [_collectionView reloadData];
}


#pragma mark - UICollectionViewDataSource  required
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return _partitionNameArray.count + 1;
    return _typeArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static int i1 = -1;
    static int i2 = -1;
    static int i3 = -1;
    static int i4 = -1;
    static int i5 = -1;
    
    if (indexPath.row == 0) {   //scrollView
        VSCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        for (UIView *view in [cell.contentView subviews]) {
            [view removeFromSuperview];
        }
        cell.urlImageArray = _urlImageVSArray;
        [cell refreshUI];
        return cell;
    }
    
//    [_collectionView registerClass:[VVCollectionCell class]
//        forCellWithReuseIdentifier:@"cell1"];
//    
//    [_collectionView registerClass:[LVBCollectionCell class]
//        forCellWithReuseIdentifier:@"cell2"];
//    
//    [_collectionView registerClass:[VBCollectionCell class]
//        forCellWithReuseIdentifier:@"cell3"];
//    
//    [_collectionView registerClass:[VTVCollectionCell class]
//        forCellWithReuseIdentifier:@"cell4"];
//    
//    [_collectionView registerClass:[VTopicCollectionCell class]
//        forCellWithReuseIdentifier:@"cell5"];
    
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"region"] || [_typeArray[indexPath.row - 1] isEqualToString:@"recommend"]) {
        
        VVCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        
        for (UIView *view in [cell.contentView subviews]) {
            [view removeFromSuperview];
        }
        
        i1 = (i1 + 1) % _coverImageVVArrArr.count;
        cell.partitionName = _partitionNameVVArray[i1];
        cell.param = _paramVVArray[i1];
        cell.countStatue = _countStatueVVArray[i1];
        cell.coverImageArray = _coverImageVVArrArr[i1];
        cell.titleImageArray = _titleImageVVArrArr[i1];
        cell.playArray = _playVVArrArr[i1];
        cell.danmakuArray = _danmakuVVArrArr[i1];

        [cell refreshUI];
        return cell;
        
    }
    
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"live"]) {   //正在直播
        LVBCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
        
        for (UIView *view in [cell.contentView subviews]) {
            [view removeFromSuperview];
        }
        
        i2 = (i2 + 1) % _coverImageLVBArrArr.count;
        cell.partitionName = _partionNameLVBArray[i2];
        cell.countLive = _countLiveLVBArray[i2];
        cell.countStatue = _countStatusLVBArray[i2];
        
        cell.coverImageArray = _coverImageLVBArrArr[i2];
        cell.titleImageArray = _titleImageLVBArrArr[i2];
        cell.onlineArray = _onlineLVBArrArr[i2];
        cell.ownerFaceArray = _ownerFaceLVBArrArr[i2];
        cell.ownerNameArray = _ownerNameLVBArrArr[i2];
        
        [cell refreshUI];
        
        return cell;
        
    }
    
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"bangumi_2"]) {
        VBCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell3" forIndexPath:indexPath];
        for (UIView *view in [cell.contentView subviews]) {
            [view removeFromSuperview];
        }
        
        i3 = (i3 + 1) % _coverImageVBArrArr.count;
        
        cell.coverImageArray = _coverImageVBArrArr[i3];
        cell.titleImageArray = _titleImageVBArrArr[i3];
        cell.descArray = _descStrVBArrArr[i3];
        if (_glpicStrVBArray.count > 0) {
            cell.glpicStr = _glpicStrVBArray[i3];
        }
        
        [cell refreshUI];
        
        return cell;
    }
    
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"bangumi_3"]) {
        VTVCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell4" forIndexPath:indexPath];
        for (UIView *view in [cell.contentView subviews]) {
            [view removeFromSuperview];
        }
        
        i4 = (i4 + 1) % _coverImageVTVArrArr.count;
        cell.partitionStr = _partionStrVTVArray[i4];
        cell.coverImageArray = _coverImageVTVArrArr[i4];
        cell.titleImageArray = _titleImageVTVArrArr[i4];
        cell.descArray = _descStrVTVArrArr[i4];
        
        [cell refreshUI];
        return cell;
    }
    
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"weblink"]) {
        VTopicCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell5" forIndexPath:indexPath];
        for (UIView *view in [cell.contentView subviews]) {
            [view removeFromSuperview];
        }
        
        i5 = (i5 + 1)%_urlImageStrVTArray.count;
        cell.urlImageStr = _urlImageStrVTArray[i5];
        
        [cell refreshUI];
        return cell;
        
    }
    
    //不会被看到
    VVCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
    for (UIView *view in [cell.contentView subviews]) {
        [view removeFromSuperview];
    }
    return cell;
    
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.3125); //450 VSCollectionCell
    }
  
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"region"] || [_typeArray[indexPath.row - 1] isEqualToString:@"recommend"]) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 1.330555);   //1916 VVCollectionCell
    }
    
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"live"]) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 1.236111);   //1780 LVBCollectionCell
    }
    
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"bangumi_2"]) {
        if (_glpicStrVBArray.count) {   //gl有时候有 有时候没有...
            return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 1.618055);   //2330 VBCollectionCell
        } else {
            return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 1.29166);   //2330 - 470 = 1860
            //return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0);
        }
    }
    
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"bangumi_3"]) {
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.753472);   //1085 VTVCollectionCell
    }
         
    if ([_typeArray[indexPath.row - 1] isEqualToString:@"weblink"]) {
        //return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.569444);   //820  VTopicCellectionCell
        return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 0.480444);
    }

    if ([_typeArray[indexPath.row - 1] isEqualToString:@"nil"]) {
        return CGSizeMake(SCREEN_WIDTH, 0);
    }

    
    //会被执行一次?
    //return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 1.330555);   //1916 VVCollectionCell
    return CGSizeMake(SCREEN_WIDTH, 0);
    
}



@end











































