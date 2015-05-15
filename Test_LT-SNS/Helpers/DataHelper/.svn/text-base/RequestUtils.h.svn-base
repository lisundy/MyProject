//
//  RequestUtils.h
//  Test_LT-SNS
//
//  Created by Mark Lin on 15/4/7.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface RequestUtils : NSObject

/**
 *  Get请求方法
 *
 *  @param Parameters 参数集合
 *  @param URL        接口
 *  @param success    成功的block
 *  @param failure    失败的block
 */
-(void)doGetHttpRequestWithParameters :(NSDictionary *)Parameters
                     andURL :(NSString *)url
                         andsuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         andfailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/**
 *  Post文本信息请求方法
 *
 *  @param Parameters 参数集合
 *  @param URL        接口
 *  @param success    成功的block
 *  @param failure    失败的block
 */
-(void)doPostHttpRequestWithParameters :(NSDictionary *)Parameters
                               andURL :(NSString *)url
                            andsuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                            andfailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/**
 *  Post图片信息请求方法
 *
 *  @param Parameters 参数集合
 *  @param URL        接口
 *  @param success    成功的block
 *  @param failure    失败的block
 */
-(void)doImagePostHttpRequestWithParameters :(NSDictionary *)Parameters
                                andURL :(NSString *)url
                             andsuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                             andfailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


@end
