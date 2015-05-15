//
//  HuaTiViewController.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseViewController.h"

@class HuaTiViewModel;
@class HuatiDtailTopView;
@class BaseOptionView;
@class HuatiOptionView;
@class BaseTableView;
@class CommentTableView;

@interface HuaTiViewController : BaseViewController
{
    UIScrollView      *_huatiScrollView;
    HuatiDtailTopView *_huatiDtailTopView;//显示个人信息简介的view
    UILabel           *_textLabel;        //显示文字文本
    UILabel           *_totalCommentLabel;//评论总数
    CommentTableView  *_commentTableView; //评论tableview
}

@property (retain, nonatomic) HuaTiViewModel *huatiModel;
@property (retain, nonatomic) NSArray        *imageArray;  //保存图片地址
@property (retain, nonatomic) NSMutableArray *commentData; //评论数据
@property (copy, nonatomic)   NSString       *HuatiID;

- (id)initWithID:(NSString *)ID;


@end
