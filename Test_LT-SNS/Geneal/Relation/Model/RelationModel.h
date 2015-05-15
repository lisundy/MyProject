//
//  RelationModel.h
//  LeTuo_SNS
//
//  Created by lovelydd on 13-11-14.
//  Copyright (c) 2013年 GoodIdea. All rights reserved.
//

#import "LeTuoBaseModel.h"

@interface RelationModel : LeTuoBaseModel


@property(nonatomic,copy)NSString *city;            //城市
@property(nonatomic,copy)NSString *homeID;          //身份ID
@property(nonatomic,copy)NSString *message;         //消息
@property(nonatomic,copy)NSString *nick;            //昵称
@property(nonatomic,copy)NSString *province;        //省份
@property(nonatomic,copy)NSString *xinqing;         //心情
@property(nonatomic,copy)NSString *sex;             //性别
@property(nonatomic,copy)NSString *headImage;       //头像




@end
