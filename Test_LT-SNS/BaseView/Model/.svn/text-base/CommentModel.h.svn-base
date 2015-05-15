//
//  CommentModel.h
//  LeTuo_SNS
//
//  Created by lovelydd on 13-12-13.
//  Copyright (c) 2013年 GoodIdea. All rights reserved.
//

#import "LeTuoBaseModel.h"

#import "UserModel.h"
@interface CommentModel : LeTuoBaseModel

@property(nonatomic,copy)NSString           *total_count;        //评论总数
@property(nonatomic,retain)NSDictionary     *children;          //子评论内容
@property(nonatomic,copy)NSString           *commentText;       //评论内容
@property(nonatomic,copy)NSString           *type;              /*  评论类型
                                                                 *  100代表乐事
                                                                 *  102代表话题
                                                                 *  103代表心情
                                                                 */
@property(nonatomic,copy)NSString           *reply_cont;            //上层评论的内容
@property(nonatomic,copy)NSString           *reply_name;            //上层评论发布人名字
@property(nonatomic,copy)NSString           *reply_homeid;          //上层评论发布人ID
@property(nonatomic,copy)NSString           *object_ID;           //评论对象ID
@property(nonatomic,copy)NSString           *pcid;                //回复的评论ID
@property(nonatomic,copy)NSString           *obj_content;         //评论对象内容
@property(nonatomic,copy)NSString           *remindid;            //用于更新未读数量
@property(nonatomic,copy)NSString           *comment_time;       //最新回复时间
@property(nonatomic,copy)NSString           *title;              //评论对象标题
@property(nonatomic,copy)NSString           *cid;                //评论ID
@property(nonatomic,copy)NSString           *layer;                         //层级数
@property(nonatomic,copy)NSString           *isread;                        //判断是否已读
@property(nonatomic,retain)UserModel        *userModel;          //评论者的身份信息





@end
