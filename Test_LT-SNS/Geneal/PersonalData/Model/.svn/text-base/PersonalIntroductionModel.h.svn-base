//
//  PersonalIntroductionModel.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 AccessToken = 636E095816C7F9AEF19036D0D360BE6B;
 HomeLabel = "\U5bb6\U4eba";
 PassWord = 12345678;
 User = goodidea;
 city = "\U4f5b\U5c71";
 "curr_head" = "http://119.147.171.25:8083/Resources/uploadFile/SnsHeadImg/635645440793818047.png";
 homeid = 10001840;
 index = 0;
 nick = "\U5c0f\U6587\U7ae5\U978b";
 province = "\U5e7f\U4e1c";
 sex = "\U5973";
 xinqing = "\U5973\U795e\U2026\U2026\U2026\U7ecf";
 **/


@interface PersonalIntroductionModel : NSObject

@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *city;
@property(nonatomic,copy)NSString *province;
@property(nonatomic,copy)NSString *currentHead;
@property(nonatomic,copy)NSString *sex;
@property(nonatomic,copy)NSString *xinqing;
@property(nonatomic,copy)NSString *homeId;
@property(nonatomic,copy)NSArray *thumbPhotos;
@property(nonatomic,copy)NSArray *largePhotos;

@property(nonatomic,copy)NSString *fansCountString;
@property(nonatomic,copy)NSString *concernCountString;
@property(nonatomic,assign,getter=isConcerned)BOOL concern;

-(id)initWithDictionary:(NSDictionary *)dict;

@end
