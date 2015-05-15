//
//  AboutCircleBottomView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/28.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "AboutCircleBottomView.h"

@implementation AboutCircleBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *buttonImage = [UIImage imageNamed:@"acc_circle_topic_btn"];
        CGSize btnImageSize = [buttonImage size];
        CGFloat btnWidth = btnImageSize.width/2;
        CGFloat btnHeight = btnImageSize.height/2;
        UIButton *lookupCircleButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMidX(frame)-btnWidth/2, 10, btnWidth, btnHeight)];
        [lookupCircleButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        [lookupCircleButton addTarget:self action:@selector(lookupButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:lookupCircleButton];
    }
    return self;
}

-(void)lookupButtonClick:(UIButton *)button{
    
}


@end
