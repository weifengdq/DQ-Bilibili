//
//  VVCollectionCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/1.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "VVCollectionCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

//@property(nonatomic, copy)NSString *partitionName;  //分区名
//@property(nonatomic, copy)NSString *param;  //参数
//@property(nonatomic, copy)NSString *countStatue; //x条新动态, 点击刷新 Lives的数量???
//
//
//@property(nonatomic, retain)NSMutableArray *coverImageArray;    //封面
//@property(nonatomic, retain)NSMutableArray *titleImageArray;    //标题
//@property(nonatomic, retain)NSMutableArray *playArray;          //播放量
//@property(nonatomic, retain)NSMutableArray *danmakuArray;       //弹幕

/*param参数    type      style
 nil 热门推荐 recommend gm_av
 nil 热门直播 live      gm_av
 13  番剧推荐 bangumi_2 gs_banguimi
 nil                   gl_pic       应该是属于番剧推荐的
 1   动画区   region   gm_av
 3   音乐区   region   gm_av
 129 舞蹈去   region   gm_av
 4   游戏区   region   gm_av
 119 鬼畜区   region   gm_av
 nil         weblink               weblink应该就是话题
 36  科技区   region   gm_av
 nil         weblink
 160 生活区   region   gm_av
 5   娱乐区   region   gm_av
 nil         weblink
 11 电视剧更新 bangumi_3 gs_banggumi   这个是scrollView(6个子视图)来实现的
 23  电影区   region   gm_av
 155 时尚区   region   gm_av
 
 根据type来确定cell
 cell0: 顶部scrollview  VSCollectionCell
 region: 各种区         VVCollectionCell
 recommend: 热门推荐同region  VVCollectionCell
 live: 正在直播         LVBCollectionCell
 bangumi_2: 番剧推荐    VBCollectionCell
 bangumi_3: 电视剧更新  VTVCollectionCell
 weblink:   话题       VTopicCollectionCell
 
 nil     划归到番剧推荐(style为gl_pic)
 
*/
@implementation VVCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _coverImageArray = [[NSMutableArray alloc] init];
        _titleImageArray = [[NSMutableArray alloc] init];
        _playArray = [[NSMutableArray alloc] init];
        _danmakuArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)refreshUI {
    int sw = SCREEN_WIDTH;
    int gapE = 0.036111 * SCREEN_WIDTH;    //到屏幕边缘的距离
    int gapH = 0.039888 * SCREEN_WIDTH;    //中间的距离 横
    int gapV = 0.044444 * SCREEN_WIDTH;    //中间的距离 竖
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, SCREEN_WIDTH * 0.05, SCREEN_WIDTH, SCREEN_WIDTH * 0.066666);
//    topView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
//                                              green:arc4random()%255/255.0
//                                               blue:arc4random()%255/255.0
//                                              alpha:0.5];
    [self.contentView addSubview:topView];
    
    //动画区
    UIButton *partitionNameButton = [[UIButton alloc] init];
    partitionNameButton.frame = CGRectMake(0.109722*sw, 0, 0.2115*sw, 0.066666 * sw);
    [partitionNameButton setTitle:_partitionName forState:UIControlStateNormal];
    [partitionNameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [topView addSubview:partitionNameButton];
    
    //进去看看
    UIButton *kankanButtton = [[UIButton alloc] init];
    kankanButtton.frame = CGRectMake(0.751389*sw, 0, 0.233333*sw, SCREEN_WIDTH * 0.066666);
    [kankanButtton setTitle:@"进去看看" forState:UIControlStateNormal];
    [kankanButtton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    kankanButtton.backgroundColor = [UIColor colorWithRed:0.6784 green:0.6784 blue:0.6784 alpha:1.0];
    kankanButtton.layer.cornerRadius = 4;
    kankanButtton.clipsToBounds = YES;
    [topView addSubview:kankanButtton];
    
    
    
    if (_coverImageArray.count >= 4) {
        for (int i = 0; i<4; i++) {
            UIButton *view = [[UIButton alloc] init];
            view.frame = CGRectMake(gapE+i%2*((sw-gapE*2-gapH)/2+gapH) , 0.1666667*sw+i/2*(0.4791667*sw+gapV), 0.444444*sw, 0.4791667*sw);
            view.backgroundColor = [UIColor whiteColor];
            view.layer.cornerRadius = 4;
            view.clipsToBounds = YES;
            [self.contentView addSubview:view];
            
            int vw = view.frame.size.width;
            
            //封面
            UIImageView *coverImageView = [[UIImageView alloc] init];
            coverImageView.frame = CGRectMake(0, 0, vw+1, 0.277777*sw);  //+1很重要, 不然会有白边?
            coverImageView.backgroundColor = [UIColor whiteColor];
            //coverImageView.backgroundColor = [UIColor cyanColor];   //测试
            NSURL *url = [NSURL URLWithString:_coverImageArray[i]];
            [coverImageView sd_setImageWithURL:url placeholderImage:nil];   //占位是背景色白的
            [view addSubview:coverImageView];

            //title 两行显示 左对齐
            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.text = _titleImageArray[i];
            //titleLabel.font = [UIFont systemFontOfSize:14.0]; //用默认的17号字
            titleLabel.frame = CGRectMake(0.006944*sw, 0.294444*sw, 0.430555*sw, 0.106944*sw);
            titleLabel.textColor = [UIColor blackColor];
            titleLabel.numberOfLines = 2;
            titleLabel.textAlignment = NSTextAlignmentLeft;
            [view addSubview:titleLabel];
            
            //play图标 26 610 50 40
            UIImageView *playImageView = [[UIImageView alloc] init];
            playImageView.frame = CGRectMake(0.018055*sw, 0.426611*sw, 0.034722*sw, 0.027777*sw);
            playImageView.image = [UIImage imageNamed:@"misc_play"];
            //playImageView.tintColor = [UIColor colorWithRed:0.5294 green:0.5294 blue:0.5294 alpha:1.0];
            [view addSubview:playImageView];
            
            //play  动态frame
            UILabel *playLabel = [[UILabel alloc] init];
            playLabel.font = [UIFont systemFontOfSize:14.0];
            playLabel.text = _playArray[i];
            CGSize size = [playLabel.text sizeWithFont:[UIFont systemFontOfSize:14.0]];
            playLabel.frame = CGRectMake(0.055555*sw, 0.419444*sw, size.width, 0.04166*sw);
            playLabel.textColor = [UIColor grayColor];
            //playLabel.backgroundColor = [UIColor colorWithRed:0.8314 green:0.8314 blue:0.8314 alpha:1.0];
            playLabel.layer.cornerRadius = 4;
            playLabel.clipsToBounds = YES;
            [view addSubview:playLabel];
            
            //弹幕图标 350
            UIImageView *danmakuImageView = [[UIImageView alloc] init];
            danmakuImageView.frame = CGRectMake(0.243055*sw, 0.426611*sw, 0.034722*sw, 0.027777*sw);
            danmakuImageView.image = [UIImage imageNamed:@"misc_danmaku"];
            [view addSubview:danmakuImageView];
            
            
            //danmaku  弹幕
            UILabel *danmakuLabel = [[UILabel alloc] init];
            danmakuLabel.font = [UIFont systemFontOfSize:14.0];
            danmakuLabel.text = _danmakuArray[i];
            danmakuLabel.textColor = [UIColor grayColor];
            CGSize size1 = [danmakuLabel.text sizeWithFont:danmakuLabel.font];
            danmakuLabel.frame = CGRectMake(0.280555*sw, 0.419444*sw, size1.width, 0.041666*sw);
            //danmakuLabel.backgroundColor = [UIColor colorWithRed:0.8314 green:0.8314 blue:0.8314 alpha:1.0];
            danmakuLabel.layer.cornerRadius = 4;
            danmakuLabel.clipsToBounds = YES;
            [view addSubview:danmakuLabel];

        }
    }
    
    //更多动画
    UIButton *moreButton = [[UIButton alloc] init];
    moreButton.frame = CGRectMake(0.036111*sw, 1.2125*sw, 0.309772*sw, 0.091666*sw);
    if (_partitionName.length>2) {  //此处待修改
        NSString *str = [_partitionName substringToIndex:2];  //截取下标2之前的字符串
        str = [NSString stringWithFormat:@"更多%@", str];
        [moreButton setTitle:str forState:UIControlStateNormal];
    }
    //    str = [str stringByAppendingString:str1];
    [moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    moreButton.backgroundColor = [UIColor whiteColor];
    moreButton.layer.cornerRadius = 6;
    moreButton.clipsToBounds = YES;
    [self.contentView addSubview:moreButton];
    
    //5条新动态, 点击刷新 右对齐
    UIButton *refreshButton = [[UIButton alloc] init];
    refreshButton.frame = CGRectMake(0.4*sw, 1.2125*sw, 0.5*sw, 0.0917*sw);
    [refreshButton setTitle:[NSString stringWithFormat:@"%@条新动态, 点击刷新", _countStatue] forState:UIControlStateNormal];
    [refreshButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    refreshButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;  //右对齐
    refreshButton.contentEdgeInsets = UIEdgeInsetsMake(2, 0, 0, 5);   //与边框 top left botton right的距离
    [self.contentView addSubview:refreshButton];
    
    //刷新图标  1324 1915-145 68 68
    UIButton *refreshImage = [[UIButton alloc] init];
    refreshImage.frame =  CGRectMake(0.908*sw, 1.233166*sw, 0.047222*sw, 0.047222*sw);
    [refreshImage setImage:[UIImage imageNamed:@"home_refresh"] forState:UIControlStateNormal];
    [self.contentView addSubview:refreshImage];
    
}


@end

























