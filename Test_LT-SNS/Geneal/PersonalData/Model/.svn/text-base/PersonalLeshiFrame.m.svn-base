//
//  PersonalLeshiFrame.m
//  Test_LT-SNS
//
//  Created by Dev on 15/5/4.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalLeshiFrame.h"
#import "PersonalLeshiModel.h"

#define kOffset 10

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface PersonalLeshiFrame ()



@end

@implementation PersonalLeshiFrame

-(void)setPersonalLeshiModel:(PersonalLeshiModel *)personalLeshiModel{
    _personalLeshiModel = personalLeshiModel;
    
    CGFloat nameLabelW = (kScreenWidth - 2 * kOffset) * 0.45 ;
    _nameLabelFrame = CGRectMake(kOffset, kOffset, nameLabelW, 20);
    
    CGFloat sendDateLabelW = (kScreenWidth - 2 * kOffset) * 0.42;
    _sendDateLabelFrame = CGRectMake(CGRectGetMaxX(_nameLabelFrame), CGRectGetMinY(_nameLabelFrame), sendDateLabelW, 20);
    
    CGFloat pinglunImageViewWH = 10;
    _pinglunImageViewFrame = CGRectMake(CGRectGetMaxX(_sendDateLabelFrame)+kOffset/2, CGRectGetMidY(_sendDateLabelFrame)-pinglunImageViewWH/2, pinglunImageViewWH, pinglunImageViewWH);
    
    CGFloat pinglunCountLabelW = (kScreenWidth - 2 * kOffset) * 0.1 ;
    _pinglunCountLabelFrame = CGRectMake(CGRectGetMaxX(_pinglunImageViewFrame)+kOffset/2, CGRectGetMinY(_nameLabelFrame), pinglunCountLabelW, 20);
    
    NSString *leshiString = _personalLeshiModel.leshiContent;
    CGFloat leshiStringW = kScreenWidth - 4 * kOffset;
    CGSize leshiStringSize = [leshiString sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(leshiStringW, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    _leshiContentLabelFrame = CGRectMake(2 * kOffset, CGRectGetMaxY(_nameLabelFrame)+kOffset/2, leshiStringW, leshiStringSize.height);
    
    _cellHeight = CGRectGetMaxY(_leshiContentLabelFrame);
    
    CGFloat leshiImageViewWH = 50;
    if (!([_personalLeshiModel.imageURLString isEqualToString:@""]||_personalLeshiModel.imageURLString == nil)) {
        _leshiImageViewFrame = CGRectMake(2 * kOffset, CGRectGetMaxY(_leshiContentLabelFrame)+kOffset/2, leshiImageViewWH, leshiImageViewWH);
        _cellHeight = CGRectGetMaxY(_leshiImageViewFrame);
    }
    
    _cellHeight += 10;
    
}

@end





