//
//  ProtectionModel.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "ProtectionModel.h"

//@property(nonatomic,copy)NSString *device_name;
////@property(nonatomic,assign)NSInteger id;
//@property(nonatomic,assign)NSInteger is_limit;
//@property(nonatomic,assign)NSInteger is_login;
//@property(nonatomic,copy)NSString *login_time;


@implementation ProtectionModel

-(id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.device_name = [dict objectForKey:@"device_name"];
        self.is_limit = [[dict objectForKey:@"is_limit"] integerValue];
        self.is_login = [[dict objectForKey:@"is_login"] integerValue];
        self.login_time = [dict objectForKey:@"login_time"];
    }
    return self;
}
+(id)modelWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}

@end
