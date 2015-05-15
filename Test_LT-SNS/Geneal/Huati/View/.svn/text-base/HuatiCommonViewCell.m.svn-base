//
//  HuatiCommonViewCell.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/17.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HuatiCommonViewCell.h"
#import "CommentModel.h"

#define KOffset 3

@interface HuatiCommonViewCell ()

@property (retain, nonatomic) CommentModel *commentModel;
@end

@implementation HuatiCommonViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
    }
    
    return self;
}

#pragma mark 组件布局
- (void)layoutSubviews
{
    //头像
    _headImageView.image = [UIImage imageNamed:_commentModel.userModel.curr_head];
    
    //昵称
    [_nickBtn setTitle:_commentModel.userModel.nick forState:UIControlStateNormal];
    
    //时间
    _timeLabel.text = _commentModel.comment_time;
    
    //评论内容
//    _contentLabel.text = _commentModel.commentText;
    CGSize commentTextSize = [self getTextSize:_commentModel.commentText withFont:[UIFont fontWithName:@"Helvetica" size:13]];
    _contentLabel.frame = CGRectMake( 10, _timeLabel.bottom + KOffset, self.width - 20, commentTextSize.height);
    _contentLabel.numberOfLines = 4;
    _contentLabel.text = _commentModel.commentText;
    
}

#pragma mark 计算文本大小
- (CGSize )getTextSize:(NSString *)str withFont:(UIFont *)dateFont
{
    CGSize maximumSize = CGSizeMake(self.width-30, MAXFLOAT);
    CGSize dateStringSize = [str sizeWithFont:dateFont
                            constrainedToSize:maximumSize
                                lineBreakMode:NSLineBreakByWordWrapping];
    return dateStringSize;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (IBAction)huifuAction:(id)sender {
}

- (IBAction)touchNickAction:(id)sender {
}
@end
