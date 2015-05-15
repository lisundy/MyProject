//
//  LeShiViewModel.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "RepostModel.h"
#import "LeTuoBaseModel.h"

@class UserModel;
@interface LeShiViewModel : LeTuoBaseModel

@property(nonatomic,copy)NSString *hid;                                       //乐事ID；
@property(nonatomic,copy)NSString *ohid;                                     //原文ID
@property(nonatomic,copy)NSString *short_text;                               //话题简介
@property(nonatomic,copy)NSString *long_text;                               //原文内容
@property(nonatomic,copy)NSString *share_count;                             //分享数量
@property(nonatomic,copy)NSString *create_time;                             //发布时间时间
@property(nonatomic,copy)NSString *feedback_count;                          //评论数量
@property(nonatomic,copy)NSString *address;                                 //地址
@property(nonatomic,copy)NSString  *client;                                  //来自哪里
@property(nonatomic,copy)NSString *support_count;                           //支持数量
@property(nonatomic,retain)NSArray *img_urls;                               //图片地址
@property(nonatomic,retain)NSArray *thumbimg_urls;                          //压缩图片地址
@property(nonatomic,copy)NSString   *img_count;                             //图片数量
@property(nonatomic,copy)NSString   *remindid;                             //用于更新未读数量
@property(nonatomic,copy)NSString   *obj_type;                              //原文的类型
@property(nonatomic,copy)NSString   *obj_id;                                //原文ID
@property(nonatomic, copy)NSString  *isread;                                //判断是否已读
@property(nonatomic,retain)UserModel *userModel;                            //用户模型
@property(nonatomic,retain)RepostModel *repostModel;                          //转发的内容

@end
