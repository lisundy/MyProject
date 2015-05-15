//
//  UIAlertView+AlertViewBlock.m
//  Test_LT-SNS
//
//  Created by Dev on 15/4/23.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "UIAlertView+AlertViewBlock.h"
#import <objc/runtime.h>

@implementation UIAlertView (AlertViewBlock)

static char key;

-(void)showAlertViewWithCompleteBlock:(CompleteBlock)completeBlock{
    if (completeBlock) {
        objc_removeAssociatedObjects(self);
        
        objc_setAssociatedObject(self, &key, completeBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
        
        self.delegate = self;
    }
    [self show];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    CompleteBlock block = objc_getAssociatedObject(self, &key);
    
    block(buttonIndex);
}

@end
