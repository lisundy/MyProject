//
//  SquareView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "SquareView.h"

#import "YXEasing.h"



typedef NS_ENUM(NSInteger, ButtonTag) {
    ButtonTagCircle = 100,
    ButtonTagPeople,
    ButtonTagThing,
    ButtonTagTopic
};

@interface SquareView (){
    NSInteger buttonCount;
}

@property(nonatomic,strong)UIButton *hotCircleButton;
@property(nonatomic,strong)UIButton *hotPeopleButton;
@property(nonatomic,strong)UIButton *hotThingButton;
@property(nonatomic,strong)UIButton *hotTopicButton;

@property(nonatomic,copy)Need2PushControllerBlock need2PushControllerBlock;

@property(nonatomic,copy)NSDictionary *tag4ControllerDictionary;

@end

@implementation SquareView


- (instancetype)initWithFrame:(CGRect)frame need2PushControllerBlock:(Need2PushControllerBlock)block
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        buttonCount = 0;
        
        _need2PushControllerBlock = block;
        
        _tag4ControllerDictionary = @{
                                      [NSString stringWithFormat:@"%ld",(long)ButtonTagCircle]:@"HotCircleViewController",
                                      [NSString stringWithFormat:@"%ld",(long)ButtonTagPeople]:@"HotPeopleViewController",
                                      [NSString stringWithFormat:@"%ld",(long)ButtonTagThing ]:@"",
                                      [NSString stringWithFormat:@"%ld",(long)ButtonTagTopic ]:@""
                                      };
        
        CGSize size = [[UIImage imageNamed:@"hotCircle"] size];
        CGFloat buttonWidth = (CGFloat)size.width/2.0;
        CGFloat buttonHeight = (CGFloat)size.height/2.0;
        
        CGFloat viewWidth = CGRectGetWidth(frame);
        
        //这里就写死了只有4个按钮
        CGFloat offset = (viewWidth-4 * buttonWidth)/5;
        CGFloat buttonY = 100;
        
        _hotCircleButton = [self buildButtonWithTargetFrame:CGRectMake((buttonCount+1) * offset + buttonCount * buttonWidth, buttonY, buttonWidth, buttonHeight) image:[UIImage imageNamed:@"hotCircle"] tag:ButtonTagCircle selector:@selector(buttonClick:)];
        [self addSubview:_hotCircleButton];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _hotPeopleButton = [self buildButtonWithTargetFrame:CGRectMake((buttonCount+1) * offset +  buttonCount * buttonWidth, buttonY, buttonWidth, buttonHeight) image:[UIImage imageNamed:@"hotPeople"] tag:ButtonTagPeople selector:@selector(buttonClick:)];
            [self addSubview:_hotPeopleButton];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _hotThingButton = [self buildButtonWithTargetFrame:CGRectMake((buttonCount+1) * offset +  buttonCount * buttonWidth, buttonY, buttonWidth, buttonHeight) image:[UIImage imageNamed:@"hotThing"] tag:ButtonTagThing selector:@selector(buttonClick:)];
            [self addSubview:_hotThingButton];
        });
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            _hotTopicButton = [self buildButtonWithTargetFrame:CGRectMake((buttonCount+1) * offset +  buttonCount * buttonWidth, buttonY, buttonWidth, buttonHeight) image:[UIImage imageNamed:@"hotTopic"] tag:ButtonTagTopic selector:@selector(buttonClick:)];
            [self addSubview:_hotTopicButton];
        });
        
        
    }
    return self;
}

-(void)buttonClick:(UIButton *)button{
    NSString *controllerString = (NSString *)[_tag4ControllerDictionary valueForKey:[NSString stringWithFormat:@"%ld",(long)button.tag]];
    _need2PushControllerBlock(controllerString);
}

-(UIButton *)buildButtonWithTargetFrame:(CGRect)targetFrame image:(UIImage *)image tag:(ButtonTag)tag selector:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(CGRectGetMinX(targetFrame), CGRectGetMaxY(self.frame), CGRectGetWidth(targetFrame), CGRectGetHeight(targetFrame));
    button.contentMode = UIViewContentModeScaleAspectFit;
    button.tag = tag;
    button.layer.anchorPoint = CGPointZero;
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    
    CAKeyframeAnimation *animate = [CAKeyframeAnimation animation];
    animate.keyPath = @"position";
    animate.duration = 2;
    animate.fillMode = kCAFillModeForwards;
    animate.values = [YXEasing calculateFrameFromPoint:CGPointMake(CGRectGetMinX(targetFrame), CGRectGetMaxY(self.frame)) toPoint:CGPointMake(CGRectGetMinX(targetFrame), CGRectGetMinY(targetFrame)) func:BounceEaseOut frameCount:2*30];
    [button.layer addAnimation:animate forKey:nil];
    
    button.frame = targetFrame;
    
    buttonCount++;
    
    return button;
}



@end
