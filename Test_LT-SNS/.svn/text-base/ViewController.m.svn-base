//
//  ViewController.m
//  Test_LT-SNS
//
//  Created by Mark Lin on 15/4/7.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "ViewController.h"
#import "RequestUtils.h"
#import "UIDeviceUtil.h"
#import "UIUtils.h"
#import "SecurityUtil.h"
#import "IndexViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testCheck];
}

//接口调试
-(void)testCheck
{
    NSString *deviceName = [UIDeviceUtil hardwareString];
    NSString *deviceID = [UIUtils getDeciceID];
    NSString *deviceType = @"iOS";
    
    //获取系统当前的时间戳
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%.0f", a];//转为字符型
    
    //appKey
    NSString *appKey = @"10000000";
    //应用密匙
    NSString *secret = @"1A1D4EE7-6AEA-4FAB-8813-B77B13ADA7B6";
    
    NSString *requestToken_1 = [timeString stringByAppendingString:appKey];
    NSString *requestToken = [requestToken_1 stringByAppendingString:secret];
//    NSLog(@"%@",requestToken);
    NSString *RequestToken = [SecurityUtil encryptMD5String:requestToken];
//    NSLog(@"%@",RequestToken);
    
    //AES加密
    NSString *secret_1 = @"12345678";
    
    //加密
    NSData *aesData = [SecurityUtil encryptAESData:secret_1];
//    NSLog(@"AES加密的结果：%@",aesData);
    NSString *code_64 = [SecurityUtil encodeBase64Data:aesData];
//    NSLog(@"64位加密的密码结果：%@",code_64);
    
    //少锋账号
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"goodidea",@"mid",code_64,@"pwd",RequestToken,@"request_token",appKey,@"appKey",timeString,@"rand",deviceType,@"device_type",deviceID,@"device_num",deviceName,@"device_name",nil];
    
    //小兵账号
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"goodidea2",@"mid",code_64,@"pwd",RequestToken,@"request_token",appKey,@"appKey",timeString,@"rand",deviceType,@"device_type",deviceID,@"device_num",deviceName,@"device_name",nil];
//    NSLog(@"params is %@",params);
    
    RequestUtils *requests = [[RequestUtils alloc]init];
    
    [requests doPostHttpRequestWithParameters:params andURL:@"oauth/login.json" andsuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        LTLog(@"%@",responseObject);
        [self loginFinished:responseObject];
        
    } andfailure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}

- (void)loginFinished:(id)result
{
    NSString *code = [result objectForKey:@"code"];
    
    if ([@"100" isEqualToString:code]) {
        //数据请求成功
        
        //获取access_token
        self.access_token = [result objectForKey:@"access_token"];
        NSLog(@"token:%@",self.access_token);
        //获取当前用户名
        NSString *nick = [result objectForKey:@"nick"];
        //获取当前用户头像地址
        NSString *nickImageURL = [result objectForKey:@"curr_head"];
        //获取用户信息
        NSString *sex = [result objectForKey:@"sex"];
        NSString *homeID = [result objectForKey:@"homeid"];//10001835
        NSString *xinqing = [result objectForKey:@"xinqing"];
        NSString *province = [result objectForKey:@"province"];
        NSString *city = [result objectForKey:@"city"];
        NSString *pwd  = @"12345678";
        //获取homelabel
        self.homelabel = [result objectForKey:@"homelabel"];
        
        if (self.access_token.length > 0 )
        {
            NSNumber *index = [[NSNumber alloc] initWithInt:0];

            NSMutableDictionary *userData = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                             self.access_token, @"AccessToken",
                                             nick, @"User",
                                             pwd,@"PassWord",
                                             self.homelabel,@"HomeLabel",
                                             homeID,@"homeid",
                                             nick,@"nick",
                                             nickImageURL,@"curr_head",
                                             sex,@"sex",
                                             xinqing,@"xinqing",
                                             province,@"province",
                                             city,@"city",
                                             index,@"index",
                                             nil];
            [[NSUserDefaults standardUserDefaults] setObject:userData forKey:@"UserAuthData"];
            [[NSUserDefaults standardUserDefaults] synchronize];            //保存到本地

        }
    }
    
    IndexViewController *indexVC = [[IndexViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:indexVC];
    nav.navigationBar.hidden = YES;
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:nav forKey:@"contentViewController"];
    //发送通知修改主页
    [[NSNotificationCenter defaultCenter] postNotificationName:kSideMenuChangeContentVC object:nil userInfo:dic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
