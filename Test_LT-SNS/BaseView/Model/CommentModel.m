//
//  CommentModel.m
//  LeTuo_SNS
//
//  Created by lovelydd on 13-12-13.
//  Copyright (c) 2013年 GoodIdea. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

-(NSDictionary *)attributeMapDictionary{
    
    NSDictionary *mapAtt = @{
                             
                             @"total_count":@"total_count",
                             @"children":@"children",
                             @"commentText":@"ctext",
                             @"type":@"obj_type",
                             @"obj_content":@"obj_cont",
                             @"comment_time":@"update_time",
                             @"title":@"obj_title",
                             @"object_ID":@"obj_id",
                             @"remindid" : @"remindid",@"isread":@"isread",
                             @"cid" :@"cid",
                             @"pcid":@"pcid",@"layer":@"layer",@"reply_cont":@"reply_cont",@"reply_name":@"reply_name",@"reply_homeid":@"reply_homeid"
                             };
    return mapAtt;
}



-(void)setAttributes:(NSDictionary *)dataDic{
    
    //将字典的映射关系填充到当前的对象属性上
    [super setAttributes:dataDic];
    
    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    
    if (userDic != nil) {
        UserModel *userModel = [[UserModel alloc] initWithDataDic:userDic];
        self.userModel = userModel;
//        NSLog(@"userModel is :%@",self.userModel);
    }
    
}
@end
