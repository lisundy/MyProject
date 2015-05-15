//
//  MyIDListModel.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyIDListModel : NSObject

@property(nonatomic,copy)NSString *avatarString;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *fansCountString;
@property(nonatomic,copy)NSString *concernCountString;

@property(nonatomic,strong)NSNumber *rowNumber;

@property(nonatomic,assign)BOOL isCurrentIdentity;


-(id)initWithDictionary:(NSDictionary *)dict andRow:(NSNumber *)rowNumber;

+(id)myIDListModelWithDictionary:(NSDictionary *)dict andRow:(NSNumber *)rowNumber;

@end
