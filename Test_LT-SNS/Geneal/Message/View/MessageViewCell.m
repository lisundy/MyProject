//
//  MessageViewCell.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "MessageViewCell.h"
#import "MessageCellModel.h"
#import "UIViewExt.h"

@implementation MessageViewCell
{
    UILabel *countLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initComponent];
    }
    
    return self;
}

#pragma mark 初始化cell里面的组件
- (void)initComponent {
    _messageTypeImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_messageTypeImage];
    
    _messageTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_messageTitleLabel];
    
    _separatorLabel = [[UILabel alloc] init];
    _separatorLabel.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_separatorLabel];
    
    countLabel = [[UILabel alloc] init];
    countLabel.backgroundColor = [UIColor redColor];
    countLabel.textColor = [UIColor whiteColor];
    countLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:countLabel];
    
}

//
- (void)layoutSubviews
{
    _messageTypeImage.frame = CGRectMake(10, 10, KMesgCellImgHeight, KMesgCellImgHeight);
    _messageTypeImage.image = [UIImage imageNamed:_messageModel.messageTypeImg];
    
    _messageTitleLabel.frame = CGRectMake(self.messageTypeImage.right+10, 7, 150, KMesgCellImgHeight);
    _messageTitleLabel.text = _messageModel.messageTypeName;

    countLabel.frame = CGRectMake(self.contentView.width - 40, 22.5, 20, 20);
    countLabel.text = _messageModel.count;
    countLabel.layer.cornerRadius = 10;
    countLabel.layer.masksToBounds = YES;
    
    //未完待续
    if ([@"" isEqualToString:_messageModel.count] || [@"0" isEqualToString:_messageModel.count]) {
        countLabel.hidden = YES;
    }
    
    _separatorLabel.frame = CGRectMake(0, [MessageViewCell getMesgCellHeight:_messageModel] - 0.5, self.contentView.width, 0.5);
}


#pragma mark 获取cell高度
+ (CGFloat)getMesgCellHeight:(MessageCellModel *)model
{
    return KMesgCellImgHeight+20;
}

#pragma mark  (setSelected: animated:)
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
