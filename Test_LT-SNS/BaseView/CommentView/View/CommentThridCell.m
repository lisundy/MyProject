//
//  CommentThridCell.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "CommentThridCell.h"
#import "CommentModel.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "PersonalInfoViewController.h"

#define KImageH 44
#define KOffset 3

@implementation CommentThridCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initComponent];
    }
    
    return self;
}

#pragma mark initComponent
//初始化组件
- (void)initComponent
{
    _headImageView = [UIFactory createUserPhoto];
    [self.contentView addSubview:_headImageView];
    
    _nickBtn = [UIFactory createButtonWithTitle:nil fontSize:15];
    _nickBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_nickBtn addTarget:self action:@selector(touchNick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_nickBtn];
    
    _commentBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_commentBtn];
    
    _createTimeLabel = [UIFactory createLabel:nil fontSize:13];
    [self.contentView addSubview:_createTimeLabel];
    
    //被评论的内容
    _reCommentText = [UIFactory createLabel:nil fontSize:9];
//    _reCommentText.backgroundColor = [UIColor lightGrayColor];
    _reCommentText.layer.cornerRadius = 5;
    _reCommentText.layer.masksToBounds = YES;
    [self.contentView addSubview:_reCommentText];
    
    _commentText = [UIFactory createLabel:nil fontSize:13];
    [self.contentView addSubview:_commentText];
    
    
}

#pragma mark layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_commentModel != nil) {
        
        self.contentView.frame = CGRectMake(10 +40, 6, [UIScreen mainScreen].bounds.size.width - 20 - 50, [CommentThridCell getCellHeightWithModel:_commentModel]);
        self.contentView.layer.cornerRadius = 10;
        self.contentView.layer.borderWidth  = 1;
        self.contentView.layer.borderColor  = [UIColor grayColor].CGColor;
        
        _headImageView.frame = CGRectMake(6, 6, KImageH, KImageH);
        UIImage *img = [UIImage imageNamed:@"whereToGoImage"];
        [_headImageView sd_setImageWithURL:[NSURL URLWithString:_commentModel.userModel.curr_head] placeholderImage:img];
        
        _nickBtn.frame = CGRectMake(_headImageView.right + KOffset, 6, 200, 22);
        [_nickBtn setTitle:_commentModel.userModel.nick forState:UIControlStateNormal];
        
        _createTimeLabel.frame = CGRectMake(_headImageView.right + KOffset, _nickBtn.bottom + KOffset, 200, 22);
        _createTimeLabel.text = _commentModel.comment_time;
        
        _commentBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 130, 6, 50, 18);
        [_commentBtn setBackgroundImage:[UIImage imageNamed:@"pinglun.png"] forState:UIControlStateNormal];
        
        //被评论的内容
        _reCommentText.frame = CGRectMake(_headImageView.right + KOffset, _createTimeLabel.bottom, 230, 20);
        _reCommentText.text = [NSString stringWithFormat:@"回复%@:%@",_commentModel.reply_name,_commentModel.reply_cont];
        
        _commentText.text = _commentModel.commentText;
        _commentText.frame = CGRectMake(6, _reCommentText.bottom + KOffset, [UIScreen mainScreen].bounds.size.width - 20, [CommentThridCell getTextSize:_commentModel.commentText withFont:_commentText.font].height);
        
    }
    
}

#pragma mark 计算cell高度
+ (CGFloat)getCellHeightWithModel:(CommentModel *)commentModel
{
    float height = 0;
    height += 6 + KImageH + 3 *KOffset +20;
    height += [CommentThridCell getTextSize:commentModel.commentText withFont:[UIFont fontWithName:@"Helvetica" size:13]].height +10;

    return height;
}

+(CGSize )getTextSize:(NSString *)str withFont:(UIFont *)dateFont
{
    CGSize maximumSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-70, 80);
    
    CGSize dateStringSize = [str sizeWithFont:dateFont
                            constrainedToSize:maximumSize
                                lineBreakMode:NSLineBreakByWordWrapping];
    return dateStringSize;
}

- (void)touchNick:(UIButton *)sender
{
    PersonalInfoViewController *personVC = [[PersonalInfoViewController alloc] initWithPersonHomeID:_commentModel.userModel.homeID];
    
    [currentVC presentViewController:personVC animated:YES completion:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
