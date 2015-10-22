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
        
        CCAnimation *front_walk = [CCAnimation animationWithFrame:@"nazi_front"
                                                       frameCount:7
                                                            delay:0.15f];
        
        self.frontWalking = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:front_walk]];
        
        CCAnimation *front_idle = [CCAnimation animationWithFrame:@"nazi_front"
                                                       frameCount:1
                                                            delay:0.1f];
        
        self.frontIdle = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:front_idle]];
        
        CCAnimation *left_walk = [CCAnimation animationWithFrame:@"nazi_left"
                                                      frameCount:7
                                                           delay:0.15f];
        
        self.leftWalking = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:left_walk]];
        
        
        CCAnimation *right_Walk = [CCAnimation animationWithFrame:@"nazi_right"
                                                       frameCount:7
                                                            delay:0.15f];
        
        self.rightWalking = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:right_Walk]];
        
        
        
        [self.backWalking setTag:BackWalk];
        [self.backIdle setTag:BackIdle];
        [self.frontWalking setTag:FrontWalk];
        [self.frontIdle setTag:FrontIdle];
        
        
        
    }
    
    return self;
}




@end
