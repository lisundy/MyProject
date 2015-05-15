//
//  LeShiDetailViewController.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseViewController.h"

@class CommentTableView;
@class LeshiTopView;
@class IndexViewCell;
@class LeShiViewModel;

@interface LeShiDetailViewController : BaseViewController
{
    UIScrollView               *_leshiScrollView;     //内容显示区域
    LeshiTopView               *_leshiTopView;        //上部区域
    IndexViewCell              *_contentCell;         //显示的乐事内容
    UILabel                    *_commentTotalLabel;   //显示评论总数
    CommentTableView           *_commentList;         //评论列表
    
}

@property (copy, nonatomic) NSString        *leshiID;

- (instancetype)initWithID:(NSString *)ID;


@end
