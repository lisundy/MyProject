//
//  AboutCircleFrame.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AboutCircleFrame.h"
#import "AboutCircleModel.h"

#define kSystemFont [UIFont systemFontOfSize:17]

@interface AboutCircleFrame ()

@end

@implementation AboutCircleFrame


-(void)setModel:(AboutCircleModel *)model{
    _model = model;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat offset = 10;
    
    _titleLabelFrame = CGRectMake(offset, 0, (screenWidth-2*offset)*0.3, 50);
    
    NSString *string = @"我";
    CGFloat eachLineHeight = [string sizeWithFont:kSystemFont constrainedToSize:CGSizeMake((screenWidth-2*offset)*0.6, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping].height;
    
    CGSize size = [_model.contentString sizeWithFont:kSystemFont constrainedToSize:CGSizeMake((screenWidth-2*offset)*0.6, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
    
    CGFloat contentLabelHeight = [@(eachLineHeight) isEqualToNumber:@(size.height)] ? 50 : size.height+offset;
    
    _contentLabelFrame = CGRectMake(CGRectGetMaxX(_titleLabelFrame)+offset, 0, size.width, contentLabelHeight);
    
    _cellHeight = 50 > size.height+offset?50:size.height+offset;
    
}

@end
