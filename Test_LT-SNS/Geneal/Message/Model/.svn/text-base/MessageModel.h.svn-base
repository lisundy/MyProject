//
//  MessageModel.h
//  LeTuo_SNS
//
//  Created by lovelydd on 13-12-24.
//  Copyright (c) 2013年 GoodIdea. All rights reserved.
//

#import "LeTuoBaseModel.h"

/*
 "aid":"1008",
 "status":"1",
 "check_msg":"猜猜我是谁在2013-12-03 14:27:02请求关注无花身份主页",
 "apply_msg":"IOUIOUO",
 "refuse_msg":"",
 "apply_user":{
 "homeid":"10001537",
 "nick":"猜猜我是谁",
 "curr_head":"http://119.147.171.25:8083/Resources/userimages/img_luotuo.jpg",
 "sex":"",
 "province":"",
 "city":"",
 "xinqing":"",
 "homelabel":"",
 "access_token":"",
 "code":"100",
 "msg":""
 },
 "home_type":"1",
 "invite_name":"无花",
 "invite_head":"http://119.147.171.25:8083/Resources/userimages/img_luotuo.jpg",
 "invite_id":"10000042"
 */

@interface MessageModel : LeTuoBaseModel


@property(nonatomic,copy)NSString           *aid;                       //验证信息ID
@property(nonatomic,copy)NSString           *check_msg;                 //主要验证内容
@property(nonatomic,copy)NSString           *apply_msg;                 //用户提交内容
@property(nonatomic,copy)NSString           *invite_head;               //申请对象的头像地址
@property(nonatomic,copy)NSString           *invite_id;                 //申请对象的id
@property(nonatomic,copy)NSString           *invite_name;               //申请对象的名字
@property(nonatomic,copy)NSString           *status;                   //信息审核结果
@property(nonatomic,copy)NSString           *isRead;

@end
