//
//  HuatiCommonViewCell.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/17.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommentModel;
@interface HuatiCommenViewCell : UITableViewCell

@property (retain, nonatomic) UIImageView *headImageView;

@property (retain, nonatomic) UIButton *nickBtn;

@property (retain, nonatomic) UILabel *timeLabel;

@property (retain, nonatomic) UIButton *huifuBtn;

@property (retain, nonatomic) UILabel *contentLabel;

@property (retain, nonatomic) UILabel *lineLabel;

@property (retain, nonatomic) CommentModel *commentModel;//数据源


+ (CGFloat)getCellHeight:(CommentModel *)commentModel;

- (void)huifuAction:(id)sender;
- (void)touchNickAction:(id)sender;

@end
