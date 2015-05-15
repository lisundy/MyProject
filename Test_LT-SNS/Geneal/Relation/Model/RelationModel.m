//
//  RelationModel.m
//  LeTuo_SNS
//
//  Created by lovelydd on 13-11-14.
//  Copyright (c) 2013年 GoodIdea. All rights reserved.
//

#import "RelationModel.h"

@implementation RelationModel

/*
 @property(nonatomic,copy)NSString *city;          //城市
 @property(nonatomic,copy)NSString *homeID;
 @property(nonatomic,copy)NSString *message;       //消息
 @property(nonatomic,copy)NSString *nick;          //昵称
 @property(nonatomic,copy)NSString *province;       //省份
 @property(nonatomic,copy)NSString *xinqing;         //心情
 @property(nonatomic,copy)NSString *sex;             //性别
 */
-(NSDictionary *)attributeMapDictionary{
    
    NSDictionary *mapAtt = @{
                             @"city":@"city",
                             @"homeID":@"homeid",
                             @"message":@"msg",
                             @"nick":@"nick",
                             @"province":@"province",
                             @"xinqing":@"xinqing",
                             @"sex":@"sex",
                             @"headImage": @"curr_head"
                             };
    return mapAtt;
}

-(void)setAttributes:(NSDictionary *)dataDic{
    
    //将字典的映射关系填充到当前的对象属性上
    [super setAttributes:dataDic];
    
}
@end
