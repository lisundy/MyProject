//
//  HuaTiViewModel.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HuaTiViewModel.h"

@implementation HuaTiViewModel

/*
 
 @property(nonatomic,copy)NSString *tid;                                     //话题ID
 @property(nonatomic,copy)NSString *short_text;                              //话题简介
 @property(nonatomic,copy)NSString *long_text;                               //原文内容
 @property(nonatomic,copy)NSString *share_count;                             //分享数量
 @property(nonatomic,copy)NSString *create_time;                             //发布时间时间
 @property(nonatomic,copy)NSString *feedback_count;                          //评论数量
 @property(nonatomic,copy)NSString *location;                                //来自哪里
 @property(nonatomic,retain)UserModel *userModel;                            //用户模型
 @property(nonatomic,copy)NSString *reposts;                                 //转发数量
 @property(nonatomic,copy)NSString *support_count;                           //支持数量
 @property(nonatomic,retain)NSArray *img_urls;                               //图片地址
 @property(nonatomic,retain)NSArray *thumbimg_urls;                          //压缩图片地址
 
 
 */

-(NSDictionary *)attributeMapDictionary{
    
    NSDictionary *mapAtt = @{
                             @"tid":@"tid",
                             @"short_text":@"short_text",
                             @"long_text":@"long_text",
                             @"share_count":@"share_count",
                             @"create_time":@"create_time",
                             @"feedback_count":@"feedback_count",
                             @"address":@"address",
                             @"client":@"client",
                             @"reposts":@"reposts",
                             @"support_count":@"support_count",
                             @"img_urls":@"img_urls",
                             @"thumbimg_urls":@"thumbimg_urls",
                             @"img_count" :@"img_count",
                             @"from":@"group_name",
                             @"title":@"title",
                             @"gid":@"group_id",
                             @"isread":@"isread"
                             };
    return mapAtt;
}



-(void)setAttributes:(NSDictionary *)dataDic{
    
    //将字典的映射关系填充到当前的对象属性上
    [super setAttributes:dataDic];
    
    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    
    if (userDic != nil) {
        UserModel *userModel = [[UserModel alloc] initWithDataDic:userDic];
        self.userModel = userModel;
//        NSLog(@"userModel is :%@",self.userModel);
    }
    
}

@end
