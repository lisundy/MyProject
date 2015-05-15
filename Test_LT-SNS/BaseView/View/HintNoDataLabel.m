//
//  HintNoDataLabel.m
//  Test_LT-SNS
//
//  Created by pactera on 15/5/15.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "HintNoDataLabel.h"

@implementation HintNoDataLabel

- (id)init:(CGRect)rect WithText:(NSString *)text
{
    if (self = [super init]) {
        
        self.font = [UIFont fontWithName:@"Helvetica" size:18];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor grayColor];
        self.text = text;
        self.frame = rect;
    }
    return self;
}
@end
