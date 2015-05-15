//
//  MessageViewCell.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KMesgCellImgHeight 47
@class MessageCellModel;

@interface MessageViewCell : UITableViewCell

@property(nonatomic, retain) UIImageView *messageTypeImage;          //消息类型图片
@property(nonatomic, retain) UILabel *messageTitleLabel;             //消息类型标题
@property(nonatomic, retain) UILabel *separatorLabel;                //分割线

@property (retain, nonatomic) MessageCellModel *messageModel;

+ (CGFloat)getMesgCellHeight:(MessageCellModel *)model;
@end
