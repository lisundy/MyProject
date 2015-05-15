//
//  IndexViewController.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/8.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseViewController.h"

@class IndexTableView;



@interface IndexViewController : BaseViewController
{
    IndexTableView *_indexTableView;
    UIView *typeChooseView;
    BOOL isOpen;
}

@property (strong, nonatomic) NSMutableArray        *data;
@end

//导航栏中部btn代理方法
@protocol IndexTitleBtnDelegate <NSObject>

- (void)closeTypeChoseView:(BOOL)animate;

@end