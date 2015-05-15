//
//  SquareView.h
//  Test_LT-SNS
//
//  Created by Dev on 15/4/22.
//  Copyright (c) 2015年 Mark Lin. All rights reserved.
//

#import "BaseView.h"

typedef void(^Need2PushControllerBlock)(NSString *controllerString);

@interface SquareView : BaseView


-(id)initWithFrame:(CGRect)frame need2PushControllerBlock:(Need2PushControllerBlock)block;

@end
