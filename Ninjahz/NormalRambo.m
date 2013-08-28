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
        CCAnimation *nazi_back_walk = [CCAnimation animationWithFrame:@"nazi_back"
                                                           frameCount:6
                                                                delay:0.2f];
        
        
        // Front Animations
        
    }
    
    return self;
}


@end
