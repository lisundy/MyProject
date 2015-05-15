//
//  PersonalLeshiCell.m
//  Test_LT-SNS
//
//  Created by Dev on 15/5/4.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalLeshiCell.h"

#import "PersonalLeshiFrame.h"
#import "PersonalLeshiModel.h"

#import "UIImageView+WebCache.h"

@interface PersonalLeshiCell ()

@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *sendDateLabel;
@property(nonatomic,strong)UIImageView *pinglunImageView;
@property(nonatomic,strong)UILabel *pinglunCountLabel;
@property(nonatomic,strong)UILabel *leshiContentLabel;
@property(nonatomic,strong)UIImageView *leshiImageView;

@end

@implementation PersonalLeshiCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
        
        _sendDateLabel = [[UILabel alloc] init];
        _sendDateLabel.font = [UIFont systemFontOfSize:13];
        _sendDateLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_sendDateLabel];
        
        _pinglunImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pinglun_10_10"]];
        _pinglunImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_pinglunImageView];
        
        _pinglunCountLabel = [[UILabel alloc] init];
        _pinglunCountLabel.font = [UIFont systemFontOfSize:13];
        _pinglunCountLabel.textColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_pinglunCountLabel];
        
        _leshiContentLabel = [[UILabel alloc] init];
        _leshiContentLabel.numberOfLines = 0;
        [self.contentView addSubview:_leshiContentLabel];
        
        _leshiImageView = [[UIImageView alloc] init];
        _leshiImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_leshiImageView];
    }
    return self;
}

-(void)setPersonalLeshiFrame:(PersonalLeshiFrame *)personalLeshiFrame{
    _personalLeshiFrame = personalLeshiFrame;
    
    _nameLabel.frame = _personalLeshiFrame.nameLabelFrame;
    _sendDateLabel.frame = _personalLeshiFrame.sendDateLabelFrame;
    _pinglunImageView.frame = _personalLeshiFrame.pinglunImageViewFrame;
    _pinglunCountLabel.frame = _personalLeshiFrame.pinglunCountLabelFrame;
    _leshiContentLabel.frame = _personalLeshiFrame.leshiContentLabelFrame;
    _leshiImageView.frame = _personalLeshiFrame.leshiImageViewFrame;
    
    PersonalLeshiModel *model = _personalLeshiFrame.personalLeshiModel;
    
    _nameLabel.text = model.userName;
    _sendDateLabel.text = model.sendDateString;
    _pinglunCountLabel.text = model.pinglunCountString;
    _leshiContentLabel.text = model.leshiContent;
    if ([model.imageURLString isEqualToString:@""]||model.imageURLString == nil) {
        _leshiImageView.hidden = YES;
        _leshiImageView.image = nil;
    }else{
        _leshiImageView.hidden = NO;
        [_leshiImageView sd_setImageWithURL:[NSURL URLWithString:model.imageURLString] placeholderImage:[UIImage imageNamed:@"whereToGoImage"]];
    }
    
}


@end
