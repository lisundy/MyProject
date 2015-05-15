//
//  CommentCell.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/27.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "CommentCell.h"
#import "UIImageView+WebCache.h"
#import "IndexCellModel.h"

#define KImage 44
#define KOffset 3
#define KBecommentH 20

@interface CommentCell ()
{
    UIImageView     *headPhotoImgView;            //用户头像
    UILabel         *nickLabel;              //用户名字
    UIImageView     *statusImg;                //信息状态
    UILabel         *commentLabel;          //评论内容
    UILabel         *beCommentLabel;        //被评论内容
    UILabel         *creatTimeLabel;        //时间
    UIButton        *replyBtn;              //回复按钮
    UILabel         *lineLabel;
    UILabel         *isReadStatus;         //是否已读
}
@end

@implementation CommentCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initComponent];
    }
    
    return self;
}

#pragma mark -initComponent
- (void)initComponent
{
    //头像
    headPhotoImgView = [UIFactory createUserPhoto];
    [self.contentView addSubview:headPhotoImgView];
  
    //昵称
    nickLabel = [UIFactory createLabel:nil fontSize:15];
    nickLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:nickLabel];
    
    //信息状态
    statusImg = [[UIImageView alloc] init];
    [self.contentView addSubview:statusImg];
    //评论内容
    commentLabel = [UIFactory createLabel:nil fontSize:13];
    [self.contentView addSubview:commentLabel];
    
    //时间
    creatTimeLabel = [UIFactory createLabel:nil fontSize:13];
    [self.contentView addSubview:creatTimeLabel];
    
    //被评论内容
    beCommentLabel = [UIFactory createLabel:nil fontSize:10];
    beCommentLabel.backgroundColor = [UIColor lightTextColor];

    [self.contentView addSubview:beCommentLabel];
    
    //回复按钮
    replyBtn = [[UIButton alloc] init];
    [self.contentView addSubview:replyBtn];
    
    isReadStatus = [[UILabel alloc] init];
    isReadStatus.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:isReadStatus];
    
    lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineLabel];
    
}

#pragma mark layoutSubviews
- (void)layoutSubviews
{
    if (_model != nil) {
        
        headPhotoImgView.frame = CGRectMake(10, 10, KImage, KImage);//以后只修改这里的坐标即可
        
        UIImage *img = [UIImage imageNamed:@"whereToGoImage"];
        NSURL *url = [NSURL URLWithString:_model.userModel.curr_head];
        [headPhotoImgView sd_setImageWithURL:url placeholderImage:img];
        
        statusImg.frame        = CGRectMake(headPhotoImgView.right, headPhotoImgView.top + KImage/2, 16, 5);
        statusImg.image        = [UIImage imageNamed:_model.type];
        
        nickLabel.frame        = CGRectMake(statusImg.right + KOffset, headPhotoImgView.top, 200, KImage/2);
        nickLabel.text         = _model.userModel.nick;
        
        creatTimeLabel.frame   = CGRectMake(statusImg.right, nickLabel.bottom, 200, KImage/2);
        creatTimeLabel.text    = _model.create_time;
        
        //被评论内容
        beCommentLabel.frame   = CGRectMake(statusImg.right, creatTimeLabel.bottom + KOffset, SCREEN_WIDTH - statusImg.right - 20, KBecommentH);
        beCommentLabel.text    = _model.obj_cont;
        beCommentLabel.layer.cornerRadius = 8;
        
        //评论的内容
        commentLabel.frame     = CGRectMake(statusImg.right, beCommentLabel.bottom + KOffset,SCREEN_WIDTH - 20 , [CommentCell getTextSize:_model.ctext withFont:commentLabel.font].height);
        commentLabel.text      = _model.ctext;
        
        //回复按钮
        replyBtn.frame         = CGRectMake(SCREEN_WIDTH - 60, 10, 50, 18);
        [replyBtn setBackgroundImage:[UIImage imageNamed:@"huifu.png"] forState:UIControlStateNormal];
        
        //是否已读
        isReadStatus.frame     = CGRectMake(SCREEN_WIDTH - 40, 40, 5, 5);
        isReadStatus.layer.cornerRadius = 2.5f;
        isReadStatus.layer.masksToBounds = YES;
        
        if ([_model.isread isEqualToString:@"1"]) {
            isReadStatus.hidden = YES;
        }

        //分割线
        lineLabel.frame        = CGRectMake(0, [CommentCell getCellHeight:_model] - 0.5, SCREEN_WIDTH, 0.5);
    }
}

#pragma mark getCellHeight
+ (CGFloat)getCellHeight:(IndexCellModel *)model
{
    float height = 0;
    height += 10 + KImage + KOffset;//头像底部
    height += KBecommentH + KOffset;//被评论底部
    UIFont *myFont = [UIFont fontWithName:@"Helvetica" size:13];
    height += [CommentCell getTextSize:model.ctext withFont:myFont].height +KOffset;
    
    return height;
}

#pragma mark getTextSize
+ (CGSize)getTextSize:(NSString *)str withFont:(UIFont *)font
{
    CGSize maximumSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-70, 80);
    CGSize textSize    = [str sizeWithFont:font
                                  constrainedToSize:maximumSize
                             lineBreakMode:NSLineBreakByWordWrapping];
    
    return textSize;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
