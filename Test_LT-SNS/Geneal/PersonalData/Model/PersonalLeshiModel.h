//
//  PersonalLeshiModel.h
//  Test_LT-SNS
//
//  Created by Dev on 15/5/4.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonalLeshiModel : NSObject

@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *sendDateString;
@property(nonatomic,copy)NSString *pinglunCountString;
@property(nonatomic,copy)NSString *leshiContent;
@property(nonatomic,copy)NSString *imageURLString;

-(id)initWithDictionary:(NSDictionary *)dict;

@end
