//
//  RepostModel.h
//  LeTuo_SNS
//
//  Created by Good idea-杰 on 14-5-28.
//  Copyright (c) 2014年 GoodIdea. All rights reserved.
//

#import "LeTuoBaseModel.h"
#import "UserModel.h"

@interface RepostModel : LeTuoBaseModel

//client = "\U624b\U673aSNS";
//"create_time" = "2014/4/2 16:13:19";
//"feedback_count" = "";
//hid = "";
//htype = 100;
//"img_url" = "";
//"long_text" = "";
//popedom = "";
//"share_count" = 1;
//"short_text" = Test;
//"support_count" = 0;
//tag = "";
//"thumbimg_url" = "";
//user

@property(nonatomic,copy)NSString *client;          //来自哪里
@property(nonatomic,copy)NSString *create_time;     //发布时间
@property(nonatomic,copy)NSString *feedback_count;  //评论数量
@property(nonatomic,copy)NSString *hid;             //ID
@property(nonatomic,copy)NSString *htype;           //类型，100为乐事、102为话题
@property(nonatomic,copy)NSString *long_text;       //原文完整内容
@property(nonatomic,copy)NSString *share_count;     //分享数量
@property(nonatomic,copy)NSString *short_text;      //原文部分内容
@property(nonatomic,copy)NSString *support_count;   //支持数量
@property(nonatomic,copy)NSString *thumbimg_url;   //缩略图地址
@property(nonatomic,retain)NSArray *img_url;        //大图地址
@property(nonatomic,copy)NSString *popedom;         //是否公开 默认为false 即公开
@property(nonatomic,retain)UserModel *userModel;    //被转发人信息

@end
