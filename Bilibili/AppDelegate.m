//
//  AppDelegate.m
//  Bilibili
//
//  Created by weifengdq on 16/6/27.
//  Copyright © 2016年 weifengdq. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
{
    UIView *launchView;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //启动页暂停2s
    [NSThread sleepForTimeInterval:2.0];
    
    
    
    // Override point for customization after application launch.
    
    //图标 名字 启动页设置参考: http://blog.it985.com/8048.html
//    
//    [self.window makeKeyAndVisible];
//    
//    UIImageView *imageView1 = [[UIImageView alloc] init];
//    imageView1.frame = self.window.frame;
//    imageView1.image = [UIImage imageNamed:@"launcher"];
//    [self.window addSubview:imageView1];
//    [self.window bringSubviewToFront:imageView1];
//    
//    [NSThread sleepForTimeInterval:3.0];
//    
//    [imageView1 removeFromSuperview];

    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    //启动页放这里
//    UIImageView *imageView1 = [[UIImageView alloc] init];
//    imageView1.frame = self.window.frame;
//    imageView1.image = [UIImage imageNamed:@"launcher"];
//    
//    [self.window makeKeyAndVisible];
//    
//    UIView *view = [[UIView alloc] init];
//    
//    self.window.rootViewController = [[ViewController alloc] init];
//    [self.window.rootViewController.view addSubview:imageView1];
//    
//    //启动页隐藏状态栏, 启动完后再显示状态栏
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
//    //设置启动图时间
//    [NSThread sleepForTimeInterval:3.0];
//    [imageView1 removeFromSuperview];
//    
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    
    
    
    //ViewController *viewController = [[ViewController alloc] init];

//    [self.window makeKeyAndVisible];
//    launchView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    [self.window addSubview:launchView];
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:launchView.frame];
//    imageView.image = [UIImage imageNamed:@"launcher@2x.png"];
//    [launchView addSubview:imageView];
//    [self.window bringSubviewToFront:launchView];
//    
//    //[NSThread sleepForTimeInterval:3.0];
//    //http://blog.sina.com.cn/s/blog_4772dd7c0102w8uh.html
//     [NSTimer scheduledTimerWithTimeInterval:15 target:self selector:@selector(removeADView) userInfo:nil repeats:NO];
//    
//    [launchView removeFromSuperview];
    
    return YES;
}

-(void)removeADView {
    [launchView removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
