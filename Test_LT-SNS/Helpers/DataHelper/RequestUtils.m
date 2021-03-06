//
//  RequestUtils.m
//  Test_LT-SNS
//
//  Created by Mark Lin on 15/4/7.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "RequestUtils.h"

@implementation RequestUtils

#define BASE_URL @"http://119.147.171.25:8081/" //测试环境
//#define BASE_URL @"http://api.51camel.com/"     //正式环境

-(void)doGetHttpRequestWithParameters :(NSDictionary *)Parameters
                            andURL :(NSString *)url
                         andsuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         andfailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    //拼装URL
    url = [BASE_URL stringByAppendingFormat:@"%@",url];
    NSMutableString *paramsString = [NSMutableString string];
    NSArray *allkeys = [Parameters allKeys];
    for (int i = 0 ; i<Parameters.count; i++) {
        NSString *key = [allkeys objectAtIndex:i];
        
        id value = [Parameters objectForKey:key];
//        NSLog(@"key is :%@,value is :%@",key,value);
        if (i==0) {
            [paramsString appendFormat:@"%@=%@",key,value];
        }else{
            [paramsString appendFormat:@"&%@=%@",key,value];
        }
        
//        NSLog(@"paramsString is :%@",paramsString);
    }
    url = [url stringByAppendingFormat:@"?%@",paramsString];
    
//    LTLog(@"打印URL：%@ \n打印Parameters：%@",url,Parameters);

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    
    AFHTTPRequestOperation *opera = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    opera.responseSerializer = [AFJSONResponseSerializer serializer];
    [opera setCompletionBlockWithSuccess:success failure:failure];
    [[NSOperationQueue mainQueue]addOperation:opera];
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    AFJSONRequestSerializer *afjsonRequestSerializer = [[AFJSONRequestSerializer alloc] init];
//    [afjsonRequestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [manager GET:url parameters:nil success:success failure:failure];
    
}

-(void)doPostHttpRequestWithParameters :(NSMutableDictionary *)Parameters
                                andURL :(NSString *)url
                             andsuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                             andfailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    
    //拼装URL
    url = [BASE_URL stringByAppendingFormat:@"%@",url];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    AFJSONRequestSerializer *afjsonRequestSerializer = [[AFJSONRequestSerializer alloc] init];
    [afjsonRequestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer = afjsonRequestSerializer;
    
    [manager POST:url parameters:Parameters success:success failure:failure];
}

-(void)doImagePostHttpRequestWithParameters :(NSDictionary *)Parameters
                                     andURL :(NSString *)url
                                  andsuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                  andfailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
{
    //拼装URL
    url = [BASE_URL stringByAppendingFormat:@"%@",url];
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSMutableArray *imgArray = [Parameters objectForKey:@"imageData"];
    
    [manager POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        if ([Parameters objectForKey:@"imageData"]) {
            
            for (int i = 0; i < imgArray.count; i++) {
            
            [formData appendPartWithFileData:[imgArray objectAtIndex:i] name:[NSString stringWithFormat:@"file%d",i+1] fileName:[NSString stringWithFormat:@"file%d.jpg",i+1] mimeType:@"image/jpeg"];
            }
        }
    } success:success failure:failure];
    
}
@end
