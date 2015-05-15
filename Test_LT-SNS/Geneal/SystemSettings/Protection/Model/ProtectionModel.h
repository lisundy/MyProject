//
//  ProtectionModel.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/13.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 "device_name" = "IPhone\U2014x86_64";
 id = 10000132;
 "is_limit" = 0;
 "is_login" = 0;
 "login_time" = "2014-06-11 11:45:21";
 **/

@interface ProtectionModel : NSObject

@property(nonatomic,copy)NSString *device_name;
//@property(nonatomic,assign)NSInteger id;
@property(nonatomic,assign)NSInteger is_limit;
@property(nonatomic,assign)NSInteger is_login;
@property(nonatomic,copy)NSString *login_time;

-(id)initWithDictionary:(NSDictionary *)dict;
+(id)modelWithDictionary:(NSDictionary *)dict;


@end
