//
//  RepostModel.m
//  LeTuo_SNS
//
//  Created by Good idea-杰 on 14-5-28.
//  Copyright (c) 2014年 GoodIdea. All rights reserved.
//

#import "RepostModel.h"

@implementation RepostModel

//@property(nonatomic,copy)NSString *client;          //来自哪里
//@property(nonatomic,copy)NSString *create_time;     //发布时间
//@property(nonatomic,copy)NSString *feedback_count;  //评论数量
//@property(nonatomic,copy)NSString *hid;             //ID
//@property(nonatomic,copy)NSString *htype;           //类型，100为乐事、102为话题
//@property(nonatomic,copy)NSString *long_text;       //原文完整内容
//@property(nonatomic,copy)NSString *share_count;     //分享数量
//@property(nonatomic,copy)NSString *short_text;      //原文部分内容
//@property(nonatomic,copy)NSString *support_count;   //支持数量
//@property(nonatomic,retain)NSArray *thumbimg_url;   //缩略图地址
//@property(nonatomic,retain)NSArray *img_url;        //大图地址
//@property(nonatomic,copy)NSString *popedom;         //是否公开 默认为false 即公开
//@property(nonatomic,retain)UserModel *userModel;    //被转发人信息

-(NSDictionary *)attributeMapDictionary{
    
    NSDictionary *mapAtt = @{
                             @"client":@"client",
                             @"create_time":@"create_time",
                             @"feedback_count":@"feedback_count",
                             @"hid":@"hid",
                             @"htype":@"htype",
                             @"long_text":@"long_text",
                             @"short_text":@"short_text",
                             @"share_count":@"share_count",
                             @"support_count": @"support_count",
                             @"thumbimg_url":@"thumbimg_url",
                             @"img_url":@"img_url",
                             @"popedom":@"popedom"
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
