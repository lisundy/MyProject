//
//  HotPeopleModel.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/23.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GenderType) {
    GenderTypeFemale = 0,
    GenderTypeMale
    
    
};

@interface HotPeopleModel : NSObject

@property(nonatomic,copy)NSString *avatarString;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *homeId;
@property(nonatomic,copy)NSString *fansCountString;
@property(nonatomic,assign)GenderType genderType;
@property(nonatomic,assign)BOOL isConcern;

-(id)initWithDictionary:(NSDictionary *)dict;

@end
