//
//  HuaTiViewModel.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//


#import "LeTuoBaseModel.h"
#import "UserModel.h"

/*
 
 
 {
 "tid":1174,话题ID
 "short_text":"吃了一",话题简介
 "long_text":"吃了一",原文内容
 "share_count":0,分享数量
 "create_time":"2012-09-28 22:39:05",发布时间时间
 "status":1,状态
 "isdelete":0,是否已经删除
 "feedback_count":0,评论数量
 "tag":null,
 "client":"乐驼网",来自哪里
 "user":user,作者身份信息
 "reposts":null,转发数量
 "support_count":0,支持数量
 "attach_url":null,附件地址
 "img_urls":[
 "http://www.51camel.com/sdg.jpg",
 "http://www.51camel.com/sdg.jpg",
 ………
 ],图片地址
 "thumbimg_urls":[
 "http://www.51camel.com/sdg.jpg",
 "http://www.51camel.com/sdg.jpg",
 ………
 ],压缩图片地址
 "img_count":10图片数量
 */

@interface HuaTiViewModel : LeTuoBaseModel

@property(nonatomic,copy)NSString *tid;                                     //话题ID
@property(nonatomic,copy)NSString *short_text;                              //话题简介
@property(nonatomic,copy)NSString *long_text;                               //原文内容
@property(nonatomic,copy)NSString *share_count;                             //分享数量
@property(nonatomic,copy)NSString *create_time;                             //发布时间时间
@property(nonatomic,copy)NSString *feedback_count;                          //评论数量
@property(nonatomic,copy)NSString *address;                                 //地址
@property(nonatomic,copy)NSString *client;                                  //来自哪里
@property(nonatomic,copy)NSString *from;                                    //圈子名字
@property(nonatomic,retain)UserModel *userModel;                            //用户模型
@property(nonatomic,copy)NSString *reposts;                                 //转发数量
@property(nonatomic,copy)NSString *support_count;                           //支持数量
@property(nonatomic,retain)NSArray *img_urls;                               //图片地址
@property(nonatomic,retain)NSArray *thumbimg_urls;                          //压缩图片地址
@property(nonatomic,copy)NSString  *img_count;          //图片数量

@property(nonatomic,copy)NSString *title;

@property(nonatomic,copy)NSString *gid;

@property(nonatomic, copy)NSString *isread;                                    //是否已读

@end

