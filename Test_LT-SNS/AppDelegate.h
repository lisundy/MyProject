//
//  AppDelegate.h
//  Test_LT-SNS
//
//  Created by Mark Lin on 15/4/7.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RESideMenu;
@class BaseViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RESideMenu *sideMenuViewController;   //侧滑菜单控制器

@property (strong, nonatomic) BaseViewController *currentVC;

@end

