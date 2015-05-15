//
//  BaseSideViewController.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/8.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseSideViewController.h"

@implementation BaseSideViewController


- (void)changeContentViewController:(UIViewController *)contentViewController animated:(BOOL)animated{
    NSDictionary *dict = @{
                           @"contentViewController":contentViewController,
                           @"animated":@(animated)
                           };
    
    //发送通知，通知会被发送到AppDelegate里面
    [[NSNotificationCenter defaultCenter] postNotificationName:kSideMenuChangeContentVC object:nil userInfo:dict];
}

@end
