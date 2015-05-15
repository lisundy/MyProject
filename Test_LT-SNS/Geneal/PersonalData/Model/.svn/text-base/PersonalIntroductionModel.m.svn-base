//
//  PersonalIntroductionModel.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalIntroductionModel.h"


//@property(nonatomic,copy)NSString *nickName;
//@property(nonatomic,copy)NSString *city;
//@property(nonatomic,copy)NSString *province;
//@property(nonatomic,copy)NSString *currentHead;
//@property(nonatomic,copy)NSString *sex;
//@property(nonatomic,copy)NSString *xinqing;
//@property(nonatomic,copy)NSString *homeId;
//
//@property(nonatomic,copy)NSString *fansCountString;
//@property(nonatomic,copy)NSString *concernCountString;
//@property(nonatomic,assign,getter=isConcerned)BOOL concern;

@implementation PersonalIntroductionModel

-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.nickName = [dict objectForKey:@"nick"];
        self.city = [dict objectForKey:@"city"];
        self.province = [dict objectForKey:@"province"];
        self.currentHead = [dict objectForKey:@"curr_head"];
        self.sex = [dict objectForKey:@"sex"];
        self.xinqing = [dict objectForKey:@"xinqing"];
        self.homeId = [dict objectForKey:@"homeid"];
        self.fansCountString = [dict objectForKey:@"fan_num"];
        self.concernCountString = [dict objectForKey:@"follow_num"];
        self.concern = [[dict objectForKey:@"isfollow"] boolValue];
        self.thumbPhotos = [dict objectForKey:@"thumb_photo"];
        self.largePhotos = [dict objectForKey:@"large_photo"];
        
    }
    return self;
}


@end
