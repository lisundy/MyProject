//
//  AppDelegate.m
//  Test_LT-SNS
//
//  Created by Mark Lin on 15/4/7.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AppDelegate.h"
#import "RESideMenu.h"
#import "BaseViewController.h"
#import "BaseSideViewController.h"
#import "IQKeyboardManager.h"
#import "Reachability.h"

@interface AppDelegate ()
{
    Reachability *reacha;
}
@end

@implementation AppDelegate

#pragma mark - 生命周期代理方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //创建：首页控制器
    BaseViewController *indexVC = [[NSClassFromString(@"ViewController") alloc] init];
    currentVC = indexVC;
    
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:indexVC];
    navC.navigationBar.hidden = YES;
    
    //创建：左侧滑、右侧滑控制器
    BaseSideViewController *leftVC = [[NSClassFromString(@"LeftViewController") alloc] init];
    BaseSideViewController *rightVC = [[NSClassFromString(@"RightViewController") alloc] init];
    
    //初始化侧滑菜单控制器
    self.sideMenuViewController = [[RESideMenu alloc]
                            initWithContentViewController:navC
                            leftMenuViewController:leftVC
                            rightMenuViewController:rightVC];
    //设置侧滑背景图片
    self.sideMenuViewController.backgroundImage = [UIImage imageNamed:@"Stars"];
    
    self.window.rootViewController = self.sideMenuViewController;
    
    //检测网络状态
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(changeNetWorkStatus:) name:kReachabilityChangedNotification object:nil];
    reacha = [Reachability reachabilityForInternetConnection];
    [reacha startNotifier];
    
    NetworkStatus networkStatus = reacha.currentReachabilityStatus;
    [self doCheckNetWorkStatu:networkStatus];
    return YES;
}

//检测网络状况
- (void)changeNetWorkStatus:(NSNotification *)notification
{
    /*NotReachable     = kNotReachable,
     ReachableViaWiFi = kReachableViaWiFi,
     ReachableViaWWAN = kReachableViaWWAN*/
   
}

- (void)doCheckNetWorkStatu:(NetworkStatus)statu
{
    if (kNotReachable == statu) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"没有网络连接" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    //移除:更改首页控制器通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kSideMenuChangeContentVC object:nil];
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
    
    //注册:更改首页控制器通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contentViewControllerDidChange:) name:kSideMenuChangeContentVC object:nil];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 接收到需要更改首页内容控制器的通知
-(void)contentViewControllerDidChange:(NSNotification *)notification{
//    NSLog(@"接收到通知");
//    NSLog(@"%@",notification.userInfo);
    BaseViewController *baseVC = [notification.userInfo objectForKey:@"contentViewController"];
    
    [self.sideMenuViewController setContentViewController:baseVC animated:[[notification.userInfo objectForKey:@"animated"] boolValue]];
    [self.sideMenuViewController hideMenuViewController];
}

@end
