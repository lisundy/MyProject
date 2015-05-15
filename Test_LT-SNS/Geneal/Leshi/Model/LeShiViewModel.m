//
//  LeShiViewModel.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "LeShiViewModel.h"
#import "UserModel.h"

@implementation LeShiViewModel

-(NSDictionary *)attributeMapDictionary{
    
    NSDictionary *mapAtt = @{
                             @"hid" :@"hid",
                             @"ohid":@"ohid",
                             @"short_text":@"short_text",
                             @"long_text":@"long_text",
                             @"share_count":@"share_count",
                             @"create_time":@"create_time",
                             @"feedback_count":@"feedback_count",
                             @"address":@"address",
                             @"client":@"client",
                             @"support_count":@"support_count",
                             @"img_urls":@"img_urls",
                             @"thumbimg_urls":@"thumbimg_urls",
                             @"img_count" :@"img_count",
                             @"remindid" : @"remindid",
                             @"isread":@"isread",
                             @"obj_type":@"obj_type",
                             @"obj_id":@"obj_id"
                             };
    return mapAtt;
}

-(void)setAttributes:(NSDictionary *)dataDic{
    
    //将字典的映射关系填充到当前的对象属性上
    [super setAttributes:dataDic];
    
    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    NSDictionary *repostDic = [dataDic objectForKey:@"repost"];
    
    if (userDic != nil) {
        UserModel *userModel = [[UserModel alloc] initWithDataDic:userDic];
        self.userModel = userModel;
    }
    
    if (repostDic != nil) {
        RepostModel *repostModel = [[RepostModel alloc]initWithDataDic:repostDic];
        self.repostModel = repostModel;
//        NSLog(@"RepostMoel is :%@",self.repostModel);
    }
}

@end
