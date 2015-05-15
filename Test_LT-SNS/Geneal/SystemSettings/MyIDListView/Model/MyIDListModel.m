//
//  MyIDListModel.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/14.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "MyIDListModel.h"

@implementation MyIDListModel

//@property(nonatomic,copy)NSString *avatarString;
//@property(nonatomic,copy)NSString *userName;
//@property(nonatomic,copy)NSString *fansCountString;
//@property(nonatomic,copy)NSString *concernCountString;
//
//@property(nonatomic,assign)BOOL isCurrentIdentity;


-(id)initWithDictionary:(NSDictionary *)dict andRow:(NSNumber *)rowNumber{
    self = [super init];
    if (self) {
        self.avatarString = [dict valueForKey:@"curr_head"];
        self.userName = [dict valueForKey:@"nick"];
        self.fansCountString = [dict valueForKey:@"fan_num"];
        self.concernCountString = [dict valueForKey:@"follow_num"];
        self.rowNumber = rowNumber;
    }
    return self;
}

+(id)myIDListModelWithDictionary:(NSDictionary *)dict andRow:(NSNumber *)rowNumber{
    return [[self alloc] initWithDictionary:dict andRow:rowNumber];
}


@end
