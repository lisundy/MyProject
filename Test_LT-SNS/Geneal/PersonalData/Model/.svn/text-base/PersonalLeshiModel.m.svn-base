//
//  PersonalLeshiModel.m
//  Test_LT-SNS
//
//  Created by Dev on 15/5/4.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "PersonalLeshiModel.h"

//@property(nonatomic,copy)NSString *userName;
//@property(nonatomic,copy)NSString *sendDateString;
//@property(nonatomic,copy)NSString *pinglunCountString;
//@property(nonatomic,copy)NSString *leshiContent;
//@property(nonatomic,copy)NSString *imageURLString;


@implementation PersonalLeshiModel

-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.userName = [[dict objectForKey:@"user"] objectForKey:@"nick"];
        self.leshiContent = [dict objectForKey:@"long_text"];
        self.sendDateString = [dict objectForKey:@"create_time"];
        self.pinglunCountString = [dict objectForKey:@"feedback_count"];
        self.imageURLString = [[dict objectForKey:@"img_urls"] firstObject];
    }
    return self;
}


@end
