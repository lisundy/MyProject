//
//  RepostVController.h
//  Test_LT-SNS
//
//  Created by pactera on 15/5/5.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseViewController.h"

@interface RepostVController : BaseViewController
@property (copy, nonatomic) NSString *ID;

- (instancetype)initWithID:(NSString *)ID;

@end
