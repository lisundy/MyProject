//
//  UserModel.h
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "LeTuoBaseModel.h"

@interface UserModel :LeTuoBaseModel

@property(nonatomic,copy)NSString *city;          //城市
@property(nonatomic,copy)NSString *homeID;
@property(nonatomic,copy)NSString *message;       //消息
@property(nonatomic,copy)NSString *nick;          //昵称
@property(nonatomic,copy)NSString *province;       //省份
@property(nonatomic,copy)NSString *xinqing;         //心情
@property(nonatomic,copy)NSString *sex;             //性别
@property(nonatomic,copy)NSString *curr_head;       //头像
@property(nonatomic,copy)NSString *isfollow;
@property(nonatomic,copy)NSString *fan_num;     //粉丝数量
@property(nonatomic,copy)NSString *follow_num;
@property(nonatomic,retain)NSArray *img_urls;                               //图片地址
@property(nonatomic,retain)NSArray *thumbimg_urls;                          //压缩图片地址
@property(nonatomic,retain)UIImage *headImg;  //头像

-(void)reciveHeadImg;

@end
