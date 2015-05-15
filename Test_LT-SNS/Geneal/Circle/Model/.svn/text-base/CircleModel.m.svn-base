//
//  CircleModel.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "CircleModel.h"

@implementation CircleModel

//typedef NS_ENUM(NSInteger, CircleStatus) {
//    CircleStatusCanJoin,
//    CircleStatusAlreadyJoin,
//    CircleStatusCanOut
//};
//
//@interface CircleModel : NSObject
//
//@property(nonatomic,copy)NSString *avatarUrlString;
//@property(nonatomic,copy)NSString *circleName;
//@property(nonatomic,assign)CircleStatus circleStatus;


/*
 @"cycleName":@"gname",
 @"cycleImageURL":@"pic",
 @"cycleDescripe":@"gdes",
 @"gid":@"gid",
 @"gname":@"gname",
 @"notice":@"notice",
 @"isjoin":@"isjoin",@"isshow":@"isshow",
 @"mem_count":@"mem_count",
 @"topic_count":@"topic_count"
 */


-(id)initWithHotCircleDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        //NSDictionary *userInfo = [dict valueForKey:@"user"];
        self.avatarUrlString = [dict valueForKey:@"pic"];
        self.circleName = [dict valueForKey:@"gname"];
        self.circleStatus = [[dict valueForKey:@"isjoin"] integerValue];
        self.gid = [dict valueForKey:@"gid"];
    }
    return self;
}

+(id)circleModelWithHotCircleDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithHotCircleDictionary:dict];
}


@end
