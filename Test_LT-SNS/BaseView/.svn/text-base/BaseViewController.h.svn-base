//
//  BaseViewController.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/8.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

////---到时抽出到公共文件---//
//#define kScreenBounds [UIScreen mainScreen].bounds
//#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//#define kScreenHeight [UIScreen mainScreen].bounds.size.height
//
//#define kNavigationBarHeight 44
//#define kStatusBarHeight 20
////--------------------//
#import "BaseHomeView.h"

@interface BaseViewController : UIViewController

//在homeView的contentView中，放入自己的View。不用controller.view添加自定义的View
@property(nonatomic,strong)BaseHomeView *homeView;

-(id)initWithShowBackMenu:(BOOL)showBackMenu;


#pragma mark - MBProgressHUD的便捷使用

#pragma mark 弹出正在加载气泡
-(void)showProgressHudInView:(UIView *)inView animated:(BOOL)animated;

#pragma mark 移除正在加载气泡
-(void)hideProgressHudInView:(UIView *)inView animated:(BOOL)animated;

- (void)pushVCWithAnimation:(BaseViewController *)vc;

- (void)popVCWithAnimation;

@end
