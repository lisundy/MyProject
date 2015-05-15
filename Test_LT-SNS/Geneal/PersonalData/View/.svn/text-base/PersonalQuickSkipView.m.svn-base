//
//  PersonalQuickSkipView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalQuickSkipView.h"

typedef NS_ENUM(NSInteger, ButtonTag){
    ButtonTagCollection = 100,
    ButtonTagFriends,
    ButtonTagCircle
};

@interface PersonalQuickSkipView()

@property(nonatomic,strong)UIButton *myCollectionButton;
@property(nonatomic,strong)UIButton *myFriendsButton;
@property(nonatomic,strong)UIButton *myCircle;

@end

@implementation PersonalQuickSkipView

- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat buttonHeigth = 45;
        
#warning 有适配问题。回头看。图片被横向拉长，纵向短了
        _myCollectionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _myCollectionButton.frame = CGRectMake(0, 0, kScreenWidth, buttonHeigth);
        //_myCollectionButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_myCollectionButton setImage:[UIImage imageNamed:@"shoucang_0_141_320_45"] forState:UIControlStateNormal];
        [_myCollectionButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _myCollectionButton.tag = ButtonTagCollection;
        [self addSubview:_myCollectionButton];
        
        _myFriendsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _myFriendsButton.frame = CGRectMake(0, CGRectGetMaxY(_myCollectionButton.frame), kScreenWidth, buttonHeigth);
        //_myFriendsButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_myFriendsButton setImage:[UIImage imageNamed:@"my_friend_0_186_320_44"] forState:UIControlStateNormal];
        [_myFriendsButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _myFriendsButton.tag = ButtonTagFriends;
        [self addSubview:_myFriendsButton];
        
        _myCircle = [UIButton buttonWithType:UIButtonTypeCustom];
        _myCircle.frame = CGRectMake(0, CGRectGetMaxY(_myFriendsButton.frame), kScreenWidth, buttonHeigth);
        //_myCircle.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_myCircle setImage:[UIImage imageNamed:@"wodequanzi_0_230_320_45"] forState:UIControlStateNormal];
        [_myCircle addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        _myCircle.tag = ButtonTagCircle;
        [self addSubview:_myCircle];
        
        _personalQuickSkipViewHeight = CGRectGetMaxY(_myCircle.frame);
    }
    return self;
}

-(void)buttonClick:(UIButton *)button{
    NSString *controllerName = nil;
    switch (button.tag) {
        case ButtonTagCollection:
        {
            controllerName = @"MyCollectionViewController";
        }
            break;
        case ButtonTagFriends:
        {
            controllerName = @"RelationViewController";
        }
            break;
        case ButtonTagCircle:
        {
            controllerName = @"CircleViewController";
        }
            break;
            
        default:
            break;
    }
    //发送通知到控制器
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationNamePersonalQuickSkip object:nil userInfo:@{@"controllerName":controllerName}];
    
}

@end
