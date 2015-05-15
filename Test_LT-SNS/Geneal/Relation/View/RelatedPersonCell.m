//
//  RelatedPersonCell.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "RelatedPersonCell.h"
#import "RelationModel.h"
#import "UIImageView+WebCache.h"
#import "RelationViewController.h"

#define KCellHeight 54

@interface RelatedPersonCell ()
{
    UIImageView *headPhoto;
    UILabel     *nickLabel;
    UILabel     *lineLabel;
}
@end


@implementation RelatedPersonCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self initComponet];
    }
    
    return self;
}

- (void)initComponet
{
    headPhoto = [[UIImageView alloc] init];
    [self.contentView addSubview:headPhoto];
    
    nickLabel = [[UILabel alloc] init];
    nickLabel.textAlignment = NSTextAlignmentLeft;
    nickLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    [self.contentView addSubview:nickLabel];
    
    lineLabel = [[UILabel alloc] init];
    lineLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineLabel];
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self addGestureRecognizer:longPress];
    
}

- (void)layoutSubviews
{
    headPhoto = [UIFactory createUserPhoto];
    headPhoto.bounds = CGRectMake(10, 5, 0, 0);
    NSURL *url = [NSURL URLWithString:_relationModel.headImage];
    [headPhoto sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    
    nickLabel = [UIFactory createLabel:_relationModel.nick fontSize:15];
    nickLabel.frame = CGRectMake(headPhoto.right + 10, 5, 200, KCellHeight);
    
    lineLabel.frame = CGRectMake(0, KCellHeight - 0.5, self.contentView.width, 0.5);
}


//长按
- (void)longPress:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan) {

        RelatedPersonCell *cell = (RelatedPersonCell *)gesture.view;
        
        [self.delegate openDialog:cell];
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
