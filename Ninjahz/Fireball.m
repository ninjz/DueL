//
//  Fireball.m
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-26.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Fireball.h"


@implementation Fireball

-(id)init {
    if (self = [super init]){
        
        self.dmg = 25;
        self.speed = 30;
        self.currentCooldown = 0;
        self.cooldownTimeMax = 2;
        self.isReady = YES;
        self.isActive = NO;
        self.hasSecondary = NO;
    
        self.skillIcon = @"Spell_fire_fireball02.png";
        
        
        
    }
    return self;
}

-(void) hit
{
    
}

@end
