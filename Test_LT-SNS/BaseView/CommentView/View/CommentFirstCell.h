//
//  CommentFirstCell.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

//一级评论
#import <UIKit/UIKit.h>

@class CommentModel;
@interface CommentFirstCell : UITableViewCell
{
    UIImageView         *_headImageView;
    UIButton            *_nickBtn;
    UIButton            *_commentBtn;
    UILabel             *_createTimeLabel;      //创建时间
    UILabel             *_commentText;          //评论内容
    NSString            *_clayer;               //评论层级
    
}

@property (retain, nonatomic) CommentModel *commentModel;


+(CGSize )getTextSize:(NSString *)str withFont:(UIFont *)dateFont;
+(CGFloat)getCellHeightWithModel:(CommentModel *)commentModel;
@end
