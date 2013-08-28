//
//  Fireball.m
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-26.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Fireball.h"
#import "CCAnimation+Helper.h"

@implementation Fireball

-(id)init {
    if (self = [super initWithSpriteFrameName:@"fireball_up1.png"]){
        
        self.dmg = 25;
        self.speed = 30;
        self.currentCooldown = 0;
        self.cooldownTimeMax = 2;
        self.isReady = YES;
        self.isActive = NO;
        self.hasSecondary = NO;
        self.skillIcon = @"Spell_fire_fireball02.png";
        
        CCAnimation *moving = [CCAnimation animationWithFrame:@"fireball_up"
                                                   frameCount:8
                                                        delay:0.2];
        self.firing = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:moving]];
        
        
    }
    return self;
}

-(void) hit
{
    
}

@end
