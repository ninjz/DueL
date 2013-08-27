//
//  FrostStorm.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-27.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "FrostStorm.h"


@implementation FrostStorm

-(id)init {
    if (self = [super init]){
        
        self.dmg = 25;
        self.speed = 30;
        self.currentCooldown = 0;
        self.cooldownTimeMax = 2;
        self.isReady = YES;
        self.isActive = NO;
        self.hasSecondary = NO;
        
        self.skillIcon = @"Spell_frost_frostblast.png";
        
        
        
    }
    return self;
}

-(void) hit
{
    
}

@end
