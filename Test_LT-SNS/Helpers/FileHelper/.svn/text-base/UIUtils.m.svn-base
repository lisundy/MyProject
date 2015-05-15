//
//  UIUtils.m
//  Test_LT-SNS
//
//  Created by Mark Lin on 15/4/7.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "UIUtils.h"
#import "OpenUDID.h"

@implementation UIUtils

+(NSString *)getDeciceID
{
    return [OpenUDID value];
}


+ (NSString*) stringFromFomate:(NSDate*) date formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

+ (NSDate *) dateFromFomate:(NSString *)datestring formate:(NSString*)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSDate *date = [formatter dateFromString:datestring];
    
    return date;
}

//Sat Jan 12 11:50:16 +0800 2013
////Tue May 31 17:46:55 +0800 2011
//目标2013/4/27 15:41:34
+ (NSString *)fomateString:(NSString *)datestring {
    NSString *formate = @"yyyy/MM/dd HH:mm:ss";
    NSDate *createDate = [UIUtils dateFromFomate:datestring formate:formate];
    NSString *text = [UIUtils stringFromFomate:createDate formate:@"MM-dd HH:mm"];
    return text;
}

+(NSString *)getSecond:(NSDate *)date
{
    
    
    NSTimeInterval time = [date timeIntervalSinceNow];
    long long int second = (long long int)time;
    NSNumber *secondNum = [[NSNumber alloc] initWithInt:second];
    
    NSString *string = [NSString stringWithFormat:@"%@",secondNum];
    return string;
    
}

+(void)ShowTheErrorMessage:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

//获取保存的token
+(NSString *)getToken
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userInfo = [defaults objectForKey:@"UserAuthData"];
    NSString *token = [userInfo objectForKey:@"AccessToken"];
    
    return token;
}

//获取保存的homeid
+(NSString *)getHomeID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userInfo = [defaults objectForKey:@"UserAuthData"];
    NSString *homeid = [userInfo objectForKey:@"homeid"];
    
    return homeid;
}

//获取网络参数
+(NSMutableDictionary *)getParam
{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *userInfo = [defaults objectForKey:@"UserAuthData"];
    NSString *token = [userInfo objectForKey:@"AccessToken"];
    
    [params setObject:token forKey:@"token"];
    return params;
}

//+(NSString *)getDeciceID
//{
//
//   NSString *openUDID = [CApiOpenUDID value];
//    return openUDID;
//}
//
//+(float)DDOSVersion
//{
//    return [[[UIDevice currentDevice] systemVersion] floatValue];
//}

+(float)getChangeHeight
{
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    
    float height = 0.0f;
    //IOS6,iphone5
    if (version>=6.0 && version <7.0 && iPhone5)
    {
        
        height =0;
        
    }
    //ios7,iphone5
    if (version >=7.0 && iPhone5) {
        height +=20;
    }
    
    if (version >=6.0 && version < 7.0 && !iPhone5) {
        height = 0;
    }
    
    if(version >=7.0 && !iPhone5)
    {
        
        height +=20;
    }
    return height;
    
}

+(float)getTabbarTop
{
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    float top = 0.0f;
    NSLog(@"%f",SCREEN_HEIGHT);
    NSLog(@"%f",SCREEN_WIDTH);
    if (version <7.0) {
        
        top = SCREEN_HEIGHT-20-55;
    }
    else
    {
        
        top = SCREEN_HEIGHT - 55;
    }
    
    return top;
}

//+(BOOL)checkNetworkState
//{
//
//        BOOL isExistenceNetwork;
//        Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];  // 测试服务器状态
//
//        switch([reachability currentReachabilityStatus]) {
//            case NotReachable:
//                isExistenceNetwork = FALSE;
//                break;
//            case ReachableViaWWAN:
//                isExistenceNetwork = TRUE;
//                break;
//            case ReachableViaWiFi:
//                isExistenceNetwork = TRUE;
//                break;
//        }
//
//        return  isExistenceNetwork;
//}
@end
