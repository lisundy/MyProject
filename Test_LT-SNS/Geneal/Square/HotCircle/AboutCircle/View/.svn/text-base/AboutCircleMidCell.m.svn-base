//
//  AboutCircleMidCell.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AboutCircleMidCell.h"
#import "AboutCircleFrame.h"
#import "AboutCircleModel.h"
@interface AboutCircleMidCell ()

@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;

@end

@implementation AboutCircleMidCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLabel];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_contentLabel];
        
    }
    return self;
}

-(void)setAboutCircleFrame:(AboutCircleFrame *)aboutCircleFrame{
    _aboutCircleFrame = aboutCircleFrame;
    
    _titleLabel.frame = _aboutCircleFrame.titleLabelFrame;
    _contentLabel.frame = _aboutCircleFrame.contentLabelFrame;
    
    _titleLabel.text = _aboutCircleFrame.model.titleString;
    _contentLabel.text = _aboutCircleFrame.model.contentString;
    
}


@end
