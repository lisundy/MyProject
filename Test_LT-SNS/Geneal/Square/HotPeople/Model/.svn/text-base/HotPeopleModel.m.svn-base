//
//  HotPeopleModel.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/23.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HotPeopleModel.h"

@implementation HotPeopleModel



-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.avatarString = [dict objectForKey:@"curr_head"];
        self.userName = [dict objectForKey:@"nick"];
        self.homeId = [dict objectForKey:@"homeid"];
        self.fansCountString = [dict objectForKey:@"fan_num"];
        NSString *sex = [dict objectForKey:@"sex"];
        self.genderType = [sex isEqualToString:@"男"]?GenderTypeMale:GenderTypeFemale;
        self.isConcern = [[dict objectForKey:@"isfollow"] boolValue];
    }
    return self;
}

@end
