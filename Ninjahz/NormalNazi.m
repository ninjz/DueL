//
//  NormalNazi.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-27.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "NormalNazi.h"
#import "CCAnimation+Helper.h"


@implementation NormalNazi

-(id)init
{
    if(self = [super init])
    {
        self.image = @"nazi_back1.png";
        
        // Back Animations
        CCAnimation *nazi_back_walk = [CCAnimation animationWithFrame:@"nazi_back"
                                                 frameCount:6
                                                      delay:0.15f];
        
        self.backWalking = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:nazi_back_walk]];
        
        CCAnimation *nazi_idle = [CCAnimation animationWithFrame:@"nazi_back"
                                                           frameCount:1
                                                                delay:0.1f];
        
        self.backIdle = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:nazi_idle]];
        
        // Front Animations
        
    }
    
    return self;
}




@end
