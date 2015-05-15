//
//  UserModel.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

/*
 @property(nonatomic,copy)NSString *city;          //城市
 @property(nonatomic,copy)NSString *homeID;
 @property(nonatomic,copy)NSString *message;       //消息
 @property(nonatomic,copy)NSString *nick;          //昵称
 @property(nonatomic,copy)NSString *province;       //省份
 @property(nonatomic,copy)NSString *xinqing;         //心情
 @property(nonatomic,copy)NSString *sex;             //性别
 @property(nonatomic,copy)NSString *curr_head;       //头像
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
                             @"curr_head": @"curr_head",
                             @"isfollow" : @"isfollow",
                             @"fan_num" :@"fan_num",
                             @"follow_num" :@"follow_num",@"img_urls":@"large_photo",@"thumbimg_urls":@"thumb_photo"
                             };
    return mapAtt;
}

-(void)setAttributes:(NSDictionary *)dataDic{
    
    //将字典的映射关系填充到当前的对象属性上
    [super setAttributes:dataDic];
    
}

-(void)reciveHeadImg
{
    NSData *imgUrl = [NSData dataWithContentsOfURL:[NSURL URLWithString:_curr_head]];
    _headImg = [UserModel imageWithImageSimple:[UIImage imageWithData:imgUrl] scaleToSize:CGSizeMake(44, 44)];
}

//调整图片大小
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaleToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

@end
