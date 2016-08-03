//
//  LVBCollectionViewCell.m
//  Bilibili
//
//  Created by weifengdq on 16/7/1.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "LVBCollectionCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface LVBCollectionCell ()

//@property (nonatomic,strong) id timerTarget;

@end

//static const void * TimerKey = @"TimerKey";
//static const void * weakKey = @"weakKey";

@implementation LVBCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _coverImageArray = [[NSMutableArray alloc] init];
        _titleImageArray = [[NSMutableArray alloc] init];
        _onlineArray = [[NSMutableArray alloc] init];
        _ownerNameArray = [[NSMutableArray alloc] init];
        _ownerFaceArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)refreshUI {
    int sw = SCREEN_WIDTH;
    int gapE = 0.036 * SCREEN_WIDTH;    //到屏幕边缘的距离
    int gapH = 0.039 * SCREEN_WIDTH;    //中间的距离 横
    int gapV = 0.044 * SCREEN_WIDTH;    //中间的距离 竖
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.898 green:0.898 blue:0.898 alpha:1.0];
    
    UIView *topView = [[UIView alloc] init];
    topView.frame = CGRectMake(0, SCREEN_WIDTH * 0.04, SCREEN_WIDTH, SCREEN_WIDTH * 0.0785);
//    topView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
//                                              green:arc4random()%255/255.0
//                                               blue:arc4random()%255/255.0
//                                              alpha:0.5];
    [self.contentView addSubview:topView];
    
    //萌宅推荐
    UIButton *partitionNameButton = [[UIButton alloc] init];
    partitionNameButton.frame = CGRectMake(0.101*sw, 0, 0.229*sw, 0.0785 * sw);
    [partitionNameButton setTitle:_partitionName forState:UIControlStateNormal];
    [partitionNameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [topView addSubview:partitionNameButton];
    
    //当前324个直播
    UIButton *countLiveButton = [[UIButton alloc] init];
    countLiveButton.frame = CGRectMake(0.330*sw, 0, 0.4528*sw, 0.0785 * sw);
    [countLiveButton setTitle:[NSString stringWithFormat:@"当前%@个直播", _countLive] forState:UIControlStateNormal];
    [countLiveButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    countLiveButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;  //右对齐
    countLiveButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);   //与边框 top left botton right的距离
    [topView addSubview:countLiveButton];
    
    //进去看看
    UIButton *kankanButtton = [[UIButton alloc] init];
    kankanButtton.frame = CGRectMake(0.7828*sw, 0, 0.1812*sw, SCREEN_WIDTH * 0.0785);
    [kankanButtton setTitle:@"进去看看" forState:UIControlStateNormal];
    [kankanButtton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    kankanButtton.backgroundColor = [UIColor colorWithRed:0.6784 green:0.6784 blue:0.6784 alpha:1.0];
    kankanButtton.layer.cornerRadius = 4;
    kankanButtton.clipsToBounds = YES;
    [topView addSubview:kankanButtton];
    
    
    
    if (_coverImageArray.count >= 4) {
        for (int i = 0; i<4; i++) {
            UIButton *view = [[UIButton alloc] init];
            view.frame = CGRectMake(gapE+i%2*((sw-gapE*2-gapH)/2+gapH) , 0.157*sw+i/2*(0.4333*sw+gapV), 0.4444*sw, 0.4333*sw);
//            view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0
//                                                   green:arc4random()%255/255.0
//                                                    blue:arc4random()%255/255.0
//                                                   alpha:0.5];
            view.backgroundColor = [UIColor whiteColor];
            view.layer.cornerRadius = 4;
            view.clipsToBounds = YES;
            [self.contentView addSubview:view];
            
            int vw = view.frame.size.width;
            int vh = view.frame.size.height;
            
            //封面
            UIImageView *coverImageView = [[UIImageView alloc] init];
            coverImageView.frame = CGRectMake(0, 0, vw+1, 0.641 * vh);  //+1很重要, 不然会有白边
            coverImageView.backgroundColor = [UIColor whiteColor];
            NSURL *url = [NSURL URLWithString:_coverImageArray[i]];
            [coverImageView sd_setImageWithURL:url placeholderImage:nil];   //占位是背景色白的
            [view addSubview:coverImageView];
            
            //头像
            UIImageView *faceImageView = [[UIImageView alloc] init];
            faceImageView.frame = CGRectMake(0.03125*vw, 0.615*vh, 0.224*vw, 0.224*vw);
            NSURL *url1 = [NSURL URLWithString:_ownerFaceArray[i]];
            [faceImageView sd_setImageWithURL:url1 placeholderImage:nil];
            faceImageView.layer.cornerRadius = 0.112 * vw;
            faceImageView.clipsToBounds = YES;
            faceImageView.layer.borderWidth = 2;
            faceImageView.layer.borderColor = [UIColor whiteColor].CGColor;
            [view addSubview:faceImageView];
            
            
            //用户名
            UIButton *nameButton = [[UIButton alloc] init];
            nameButton.frame = CGRectMake(0.26 * vw, 0.663*vh, 0.74*vw-10, 0.122*vh);
            [nameButton setTitle:_ownerNameArray[i] forState:UIControlStateNormal];
            [nameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            nameButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;  //左对齐
            nameButton.contentEdgeInsets = UIEdgeInsetsMake(5, 5, 0, 0);   //与边框 top left botton right的距离
            nameButton.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;  //省略号显示在最右边
            [view addSubview:nameButton];
            
            
            //online  动态frame
            UILabel *onlineLabel = [[UILabel alloc] init];
            onlineLabel.font = [UIFont systemFontOfSize:12.0];
            onlineLabel.text = _onlineArray[i];
//            NSDictionary *dic = @{@"1":onlineLabel.text};
//            CGSize size = [onlineLabel.text sizeWithAttributes:dic];
            CGSize size = [onlineLabel.text sizeWithFont:[UIFont systemFontOfSize:12.0]];
            onlineLabel.frame = CGRectMake(0.03125*vw, 0.863*vh, size.width, 0.100*vh);
            onlineLabel.textColor = [UIColor grayColor];
            onlineLabel.backgroundColor = [UIColor colorWithRed:0.8314 green:0.8314 blue:0.8314 alpha:1.0];
            onlineLabel.layer.cornerRadius = 4;
            onlineLabel.clipsToBounds = YES;
            [view addSubview:onlineLabel];
            
            //title
            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.text = _titleImageArray[i];
            titleLabel.font = [UIFont systemFontOfSize:14.0];
            titleLabel.frame = CGRectMake(0.03125*vw+size.width+10, 0.863*vh, vw - 10 - (0.03125*vw+size.width+10) , 0.100*vh);
            titleLabel.textColor = [UIColor grayColor];
            
            [view addSubview:titleLabel];
            
            
            
            
            //学习下如何释放, 以免内存泄漏
            //http://blog.csdn.net/ggghub/article/details/50240225
            
//            _timerTarget = [NSObject new];
//            //初始化timerTarge对象
//            
//            class_addMethod([_timerTarget class], @selector(onTimer:), (IMP)timMethod, "v@:");
//            //动态创建timerEvent方法
//            
//            NSTimer *timer;
//            
//            //越滑动越转越快... 转疯了多个timer绑定一个方法
//            timer = [NSTimer scheduledTimerWithTimeInterval:0.03 target:_timerTarget selector:@selector(onTimer:) userInfo:faceImageView repeats:YES];
//            [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
//            //[_timer fire];
//            
            
        }
    }
    
    //查看更多
    UIButton *moreButton = [[UIButton alloc] init];
    moreButton.frame = CGRectMake(0.036*sw, 1.113*sw, 0.301*sw, 0.0917*sw);
    [moreButton setTitle:@"查看更多" forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    moreButton.backgroundColor = [UIColor whiteColor];
    moreButton.layer.cornerRadius = 6;
    moreButton.clipsToBounds = YES;
    [self.contentView addSubview:moreButton];
    
    //5条新动态, 点击刷新
    UIButton *refreshButton = [[UIButton alloc] init];
    refreshButton.frame = CGRectMake(0.4*sw, 1.113*sw, 0.5*sw, 0.0917*sw);
    [refreshButton setTitle:[NSString stringWithFormat:@"%@条新动态, 点击刷新!", _countStatue] forState:UIControlStateNormal];
    [refreshButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    refreshButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;  //右对齐
    refreshButton.contentEdgeInsets = UIEdgeInsetsMake(2, 0, 0, 5);   //与边框 top left botton right的距离
    [self.contentView addSubview:refreshButton];
    
    //刷新图标  1324 1915-145 68 68
    UIButton *refreshImage = [[UIButton alloc] init];
    refreshImage.frame =  CGRectMake(0.908*sw, 1.135166*sw, 0.047222*sw, 0.047222*sw);
    [refreshImage setImage:[UIImage imageNamed:@"home_refresh"] forState:UIControlStateNormal];
    [self.contentView addSubview:refreshImage];
    
}

//void timMethod(id self,SEL _cmd)
//{
//    LVBCollectionCell *cell = objc_getAssociatedObject(self, weakKey);
//    [cell performSelector:_cmd];
//}
//
//- (void)onTimer:(NSTimer *)timer {
//    static int i = 0;
//    i++;
//    UIImageView *imageView = [timer userInfo];
//    imageView.transform = CGAffineTransformMakeRotation(0.01*i);
//    [UIView commitAnimations];
//    
//    
//}
//
//- (void)dealloc {
//    [_timer invalidate];
//    _timer = nil;
//}

@end













































