//
//  LeshiDtailOptionView.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/16.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

#define KBtn_Height 60

//乐事正文下部操作区域
@interface LeshiDtailOptionView : BaseView
{
    UIButton *_btnFlash;         //刷新
    UIButton *_btnAnswer;        //回复
    UIButton *_btnRepost;        //转发
    UIButton *_btnStore;         //收藏
    UIButton *_btnShare;         //分享
}

@end
