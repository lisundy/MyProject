//
//  PersonalDataView.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalDataView.h"

#import "PersonalIntroductionModel.h"
#import "PersonalCountModel.h"

//#import "PersonalIntroductionView.h"
//#import "PersonalQuickSkipView.h"
#import "PersonalCountView.h"

#import "UIUtils.h"
#import "RequestUtils.h"

@interface PersonalDataView()

@end

@implementation PersonalDataView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserAuthData"];
        //NSLog(@"%@",userInfo);
        
        PersonalIntroductionModel *model = [[PersonalIntroductionModel alloc] init];
        model.currentHead = [userInfo objectForKey:@"curr_head"];
        model.nickName = [userInfo objectForKey:@"nick"];
        model.city = [userInfo objectForKey:@"city"];
        model.province = [userInfo objectForKey:@"province"];
        model.sex = [userInfo objectForKey:@"sex"];
        model.homeId = [userInfo objectForKey:@"homeid"];
        model.xinqing = [userInfo objectForKey:@"xinqing"];
        
        
        //introduceView高度先随便写
        _introduceView = [[PersonalIntroductionView alloc] init];
        //先设置model，再设置frame。因为代码中，如果有“心情”，View高度会增加
        _introduceView.personalIntroductionModel = model;
        _introduceView.frame = CGRectMake(0, 0, kScreenWidth, _introduceView.introductionViewHeight);
        
        [self addSubview:_introduceView];
        
        _quickSkipView = [[PersonalQuickSkipView alloc] init];
        _quickSkipView.frame = CGRectMake(0, CGRectGetMaxY(_introduceView.frame), kScreenWidth, _quickSkipView.personalQuickSkipViewHeight);
        [self addSubview:_quickSkipView];
        
        
//        //*---测试模型---*//
//        PersonalCountModel *countModel = [[PersonalCountModel alloc] init];
//        countModel.pointsCountString = @"100";
//        countModel.tuoCoinCountString = @"999999";
//        countModel.shareCountString = @"12345";
//        //--------------//
        _countView = [[PersonalCountView alloc] init];
        _countView.frame = CGRectMake(0, CGRectGetMaxY(_quickSkipView.frame), kScreenWidth, _countView.personalCountViewHeight);
        //_countView.personalCountModel = countModel;
        [self addSubview:_countView];
        
        
        //为了添加UIScrollView
        _viewHeight = CGRectGetMaxY(_countView.frame);
        
        [self doRequest];
        
    }
    return self;
}

-(void)doRequest{
    NSString *token = [UIUtils getToken];
    RequestUtils *request = [[RequestUtils alloc] init];
    [request doGetHttpRequestWithParameters:@{@"token":token} andURL:@"users/cent_msg.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"%@",responseObject);
        [self fillData:responseObject];
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)fillData:(id)responseObject{
    PersonalCountModel *countModel = [[PersonalCountModel alloc] init];
    countModel.pointsCountString = [responseObject valueForKey:@"cent_count"];
    countModel.tuoCoinCountString = [responseObject valueForKey:@"money_count"];
    countModel.shareCountString = [responseObject valueForKey:@"share_count"];
    _countView.personalCountModel = countModel;
}

@end
