//
//  CommentTableView.h
//  Test_LT-SNS
//
//  Created by pactera on 15/5/8.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseTableView.h"

#define COMMENT_SIZE @"5"
@class CommentModel;
@interface CommentTableView : BaseTableView

@property (retain, nonatomic) NSMutableArray *allCommentData;

@property (assign, nonatomic) CGFloat totalHeigh;


+ (CGFloat)getTableviewHeight:(NSMutableArray *)data;
@end
