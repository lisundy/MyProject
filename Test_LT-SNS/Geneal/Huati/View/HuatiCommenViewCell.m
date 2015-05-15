//
//  HuatiCommonViewCell.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/17.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HuatiCommenViewCell.h"
#import "CommentModel.h"
#import "UIViewExt.h"

#define KImageH 50
#define KOffset 3
#define KHuifuBtn_width 50
#define KHuifuBtn_height 18

@implementation HuatiCommenViewCell
@synthesize commentModel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initComponent];
    }
    
    return self;
}

#pragma mark initComponent
- (void)initComponent
{
    _headImageView = [UIFactory createUserPhoto];
    [self.contentView addSubview:_headImageView];
    
    _nickBtn = [UIFactory createButtonWithTitle:nil fontSize:12];
    _nickBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_nickBtn addTarget:self action:@selector(touchNickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_nickBtn];
    
    _timeLabel = [UIFactory createLabel:nil fontSize:12];
    [self.contentView addSubview:_timeLabel];
    
    _huifuBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [_huifuBtn setBackgroundImage:[UIImage imageNamed:@"huifu"] forState:UIControlStateNormal];
    [_huifuBtn addTarget:self action:@selector(huifuAction:) forControlEvents:UIControlEventTouchUpInside];
    _huifuBtn.layer.cornerRadius = 8;
    _huifuBtn.layer.borderWidth = 0.5;
    _huifuBtn.layer.borderColor = [UIColor grayColor].CGColor;
    [self.contentView addSubview:_huifuBtn];
    
    _contentLabel = [UIFactory createLabel:nil fontSize:13];
    [self.contentView addSubview:_huifuBtn];
    
    _lineLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _lineLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_lineLabel];
    
}

#pragma mark 组件布局
- (void)layoutSubviews
{
    //头像
    _headImageView.frame = CGRectMake(10, 6, KImageH, KImageH);
    _headImageView.image = [UIImage imageNamed:commentModel.userModel.curr_head];
    
    //昵称
    _nickBtn.frame = CGRectMake(_headImageView.right + KOffset, 0, 200, 25);
    [_nickBtn setTitle:commentModel.userModel.nick forState:UIControlStateNormal];
    
    //时间
    _timeLabel.frame = CGRectMake(_headImageView.right + KOffset, _nickBtn.bottom, 200, 25);
    _timeLabel.text = commentModel.comment_time;
    
    //回复按钮
    _huifuBtn.frame = CGRectMake(self.contentView.width - KHuifuBtn_width - 10, 10, KHuifuBtn_width, KHuifuBtn_height);
    
    //评论内容
//    _contentLabel.text = commentModel.commentText;
    CGSize commentTextSize = [HuatiCommenViewCell getTextSize:commentModel.commentText withFont:[UIFont fontWithName:@"Helvetica" size:13]];
    _contentLabel.frame = CGRectMake( 10, _timeLabel.bottom + KOffset, self.contentView.width - 20, commentTextSize.height);
    _contentLabel.numberOfLines = 2;
    _contentLabel.text = commentModel.commentText;
    
    //底部分割线
    _lineLabel.frame = CGRectMake(0, _contentLabel.bottom + 1, self.contentView.width, 0.3);
    
}


#pragma mark 计算文本大小
+ (CGSize )getTextSize:(NSString *)str withFont:(UIFont *)dateFont
{
    CGSize maximumSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-70, MAXFLOAT);
    
    CGSize dateStringSize = [str sizeWithFont:dateFont
                            constrainedToSize:maximumSize
                                lineBreakMode:NSLineBreakByWordWrapping];
    UILabel *label = [[UILabel alloc] init];
    label.text = str;
    CGRect myFrame = CGRectMake(0, 0, dateStringSize.width, dateStringSize.height);
    label.numberOfLines = 2;
    label.frame = myFrame;
    [label sizeToFit];
    
    return label.size;
}


#pragma mark 计算评论cell高度
+ (CGFloat)getCellHeight:(CommentModel *)commentModel
{
    CGSize commentTextSize = [HuatiCommenViewCell getTextSize:commentModel.commentText withFont:[UIFont fontWithName:@"Helvetica" size:13]];
    
    float height = 57 + commentTextSize.height;
    
    return height;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (void)huifuAction:(id)sender {
}

- (void)touchNickAction:(id)sender {
}
@end
