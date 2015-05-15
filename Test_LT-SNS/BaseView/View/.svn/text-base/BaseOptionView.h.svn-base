//
//  BaseOptionView.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/17.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"

/*乐事正文和话题详情页面下部操作view*/

#define KOptionH 35

typedef NS_ENUM(NSInteger, btnClickType)
{
    BtnFlash  = 1001,
    BtnAnswer = 1002,
    BtnRepost = 1003,
    BtnStore  = 1004,
    BtnShare  = 1005,
    
};


@class LeShiDetailViewController,HuaTiViewController;

@protocol BaseOptionViewDelegate;

@interface BaseOptionView : BaseView
{
    UIButton *_btnFlash;         //刷新
    UIButton *_btnAnswer;        //回复
    UIButton *_btnRepost;        //转发
    UIButton *_btnStore;         //收藏
    UIButton *_btnShare;         //分享
}

@property (retain, nonatomic) id<BaseOptionViewDelegate> delegate;

@end

@protocol BaseOptionViewDelegate <NSObject>

- (void)optionwith:(NSInteger)btnClickType;

@end