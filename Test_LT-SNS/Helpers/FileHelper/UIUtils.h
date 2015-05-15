//
//  UIUtils.h
//  Test_LT-SNS
//
//  Created by Mark Lin on 15/4/7.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIUtils : NSObject


+(NSString *)getDeciceID;

+ (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate;

+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate;

+ (NSString *)fomateString:(NSString *)datestring;

+(NSString *)getSecond:(NSDate *)date;

+(void)ShowTheErrorMessage:(NSString *)msg;

+(NSString *)getToken;

+(NSMutableDictionary *)getParam;

+(float)getChangeHeight;

+(float)getTabbarTop;
@end
