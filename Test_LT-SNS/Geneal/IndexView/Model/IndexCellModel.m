//
//  IndexCellModel.m
//  Test_LT-SNS
//
//  Created by pactera on 15/4/10.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "IndexCellModel.h"

@implementation IndexCellModel
-(NSDictionary *)attributeMapDictionary{
    
    NSDictionary *mapAtt = @{
                             @"indexInfoID":@"id",
                             @"address":@"address",
                             @"create_time":@"create_time",
                             @"img_count":@"img_count",
                             @"img_urls":@"img_urls",
                             @"long_text":@"long_text",
                             @"short_text":@"short_text",
                             @"thumbimg_urls":@"thumbimg_urls",
                             @"share_count": @"share_count",
                             @"feedback_count":@"feedback_count",
                             @"type":@"type",
                             @"client":@"client",
                             @"status":@"status",
                             @"from":@"group_name",
                             @"gid":@"group_id",
                             @"title" : @"title",
                             @"ohid":@"ohid",
                             @"ctext":@"ctext",
                             @"obj_id":@"obj_id",
                             @"obj_cont":@"obj_cont",
                             @"obj_type":@"obj_type",
                             @"cid":@"cid",
                             @"remindid":@"remindid",
                             @"isread":@"isread"
                             };
    return mapAtt;
}

-(void)setAttributes:(NSDictionary *)dataDic{
    
    //将字典的映射关系填充到当前的对象属性上
    [super setAttributes:dataDic];
    
    
    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    NSDictionary *repostDic = [dataDic objectForKey:@"repost"];
    
    if (userDic != nil) {
        UserModel *userModel = [[UserModel alloc] initWithDataDic:userDic];
        self.userModel = userModel;
//        NSLog(@"userModel is :%@",self.userModel);
    }
    
    if (repostDic != nil) {
        RepostModel *repostModel = [[RepostModel alloc]initWithDataDic:repostDic];
        self.repostModel = repostModel;
//        NSLog(@"RepostMoel is :%@",self.repostModel);
    }
}

@end
