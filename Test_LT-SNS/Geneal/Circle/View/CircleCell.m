//
//  CircleCell.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "CircleCell.h"

#import "CircleModel.h"

#import "UIAlertView+AlertViewBlock.h"

#import "UIImageView+WebCache.h"

@interface CircleCell ()

@property(nonatomic,strong)UIImageView *avatarImageView;
@property(nonatomic,strong)UILabel *circleNameLabel;
@property(nonatomic,strong)UIButton *circleStatusButton;


@end

@implementation CircleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        CGFloat cellWidth = CGRectGetWidth(self.contentView.frame);
        //CGFloat cellHeight = CGRectGetHeight(self.contentView.frame);
        CGFloat borderOffset = 10;
        CGFloat imageWH = (cellWidth-2*borderOffset) * 0.1;
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(borderOffset, CGRectGetMidY(self.contentView.frame)-(CGFloat)imageWH/2.0, imageWH, imageWH)];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 10.0f;
        [self.contentView addSubview:_avatarImageView];
        
        CGFloat labelWidth = (cellWidth-2*borderOffset) * 0.4;
        _circleNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame)+borderOffset, CGRectGetMinY(_avatarImageView.frame), labelWidth, CGRectGetHeight(_avatarImageView.frame))];
        [self.contentView addSubview:_circleNameLabel];
        
        UIImage *quitImage = [UIImage imageNamed:@"quanzi_out_246_25_68_24"];
        CGSize btnImageSize = [quitImage size];
        CGFloat btnImageWidth = (CGFloat)btnImageSize.width/2.0;
        CGFloat btnImageHeight = (CGFloat)btnImageSize.height/2.0;
        _circleStatusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _circleStatusButton.frame = CGRectMake(cellWidth-borderOffset-btnImageWidth, CGRectGetMidY(self.contentView.frame)-(CGFloat)btnImageHeight/2.0, btnImageWidth, btnImageHeight);
        _circleStatusButton.tag = CircleStatusCanOut;
        [_circleStatusButton setBackgroundImage:quitImage forState:UIControlStateNormal];
        //[self.contentView addSubview:_circleStatusButton];
        [_circleStatusButton addTarget:self action:@selector(quitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        self.accessoryView = _circleStatusButton;
        
    }
    return self;
}

-(void)setCircleModel:(CircleModel *)circleModel{
    _circleModel = circleModel;
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:_circleModel.avatarUrlString] placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    _circleNameLabel.text = _circleModel.circleName;
    _circleStatusButton.tag = _circleModel.circleStatus;
    
    switch (_circleModel.circleStatus) {
        case CircleStatusCanOut:
        {
            [_circleStatusButton setBackgroundImage:[UIImage imageNamed:@"quanzi_out_246_25_68_24"] forState:UIControlStateNormal];
        }
            break;
        case CircleStatusAlreadyJoin:
        {
            [_circleStatusButton setBackgroundImage:[UIImage imageNamed:@"added_btn"] forState:UIControlStateNormal];
        }
            break;
        case CircleStatusCanJoin:
        {
            [_circleStatusButton setBackgroundImage:[UIImage imageNamed:@"join_btn"] forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
    
}

-(void)quitButtonClick:(UIButton *)button{
    switch (button.tag) {
        case CircleStatusCanOut:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"是否要退出该圈子?" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        }
            break;
        case CircleStatusCanJoin:
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"是否要加入圈子?" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"加入", nil];
            [alertView showAlertViewWithCompleteBlock:^(NSInteger clickButtonIndex) {
                //NSLog(@"%ld",(long)clickButtonIndex);
            }];
        }
            break;
        case CircleStatusAlreadyJoin:
        {
            
        }
            break;
        default:
            break;
    }
    
}

@end




