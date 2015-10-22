//
//  NormalRambo.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-27.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "NormalRambo.h"
#import "CCAnimation+Helper.h"


@implementation NormalRambo


-(id)init
{
    if(self = [super init])
    {
        self.image = @"guy_front_walk5.png";
        
        // Back Animations
        CCAnimation *back_walk = [CCAnimation animationWithFrame:@"nazi_back"
                                                           frameCount:7
                                                                delay:0.15f];
        
        self.backWalking = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:back_walk]];
        
        CCAnimation *back_idle = [CCAnimation animationWithFrame:@"nazi_back"
                                                      frameCount:1
                                                           delay:0.1f];
        
        self.backIdle = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:back_idle]];
        
        // Front Animations
        
        CCAnimation *front_walk = [CCAnimation animationWithFrame:@"guy_front_walk"
                                                      frameCount:7
                                                           delay:0.15f];
        
        self.frontWalking = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:front_walk]];
        
        CCAnimation *front_idle = [CCAnimation animationWithFrame:@"guy_front_walk"
                                                      frameCount:1
                                                           delay:0.1f];
        
        self.frontIdle = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:front_idle]];
        
        
        [self.backWalking setTag:BackWalk];
        [self.backIdle setTag:BackIdle];
        [self.frontWalking setTag:FrontWalk];
        [self.frontIdle setTag:FrontIdle];
        
    }
    
    return self;
}


@end
