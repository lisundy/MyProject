//
//  MessageModel.m
//  LeTuo_SNS
//
//  Created by lovelydd on 13-12-24.
//  Copyright (c) 2013年 GoodIdea. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

-(NSDictionary *)attributeMapDictionary{
    
    NSDictionary *mapAtt = @{
                             @"aid" :@"aid",
                             @"check_msg":@"check_msg",
                             @"apply_msg":@"apply_msg",
                             @"invite_head":@"invite_head",
                             @"invite_id":@"invite_id",
                             @"invite_name":@"invite_name",
                             @"isRead" : @"isread",
                             @"status":@"status"
                             };
    return mapAtt;
}



-(void)setAttributes:(NSDictionary *)dataDic{
    
    //将字典的映射关系填充到当前的对象属性上
    [super setAttributes:dataDic];
    
    
}
@end
