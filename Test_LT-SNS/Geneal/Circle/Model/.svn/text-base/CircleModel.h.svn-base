//
//  CircleModel.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

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

typedef NS_ENUM(NSInteger, CircleStatus) {
    CircleStatusCanJoin,
    CircleStatusAlreadyJoin,
    CircleStatusCanOut
};

@interface CircleModel : NSObject

@property(nonatomic,copy)NSString *avatarUrlString;
@property(nonatomic,copy)NSString *circleName;
@property(nonatomic,assign)CircleStatus circleStatus;
@property(nonatomic,copy)NSString *gid;


-(id)initWithHotCircleDictionary:(NSDictionary *)dict;

+(id)circleModelWithHotCircleDictionary:(NSDictionary *)dict;

@end
