//
//  Fireball.m
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-26.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Fireball.h"
#import "ProjectileCache.h"
#import "Player.h"


@implementation Fireball

+(id) fireball
{
    return [[self alloc] init];
}

-(id)init {
    if (self = [super initWithSpriteFrameName:@"fireball_up1.png"]){
        
        
        self.dmg = 25;
        self.speed = 500;
        self.currentCooldown = 0;
        self.cooldownTimeMax = 2;
        self.isReady = YES;
        self.isActive = NO;
        self.hasSecondary = NO;
        self.skillIcon = @"Spell_fire_fireball02.png";
        self.scale = 2;
        self.projectile = kFireBall;
        
        CCAnimation *moving = [CCAnimation animationWithFrame:@"fireball_up"
                                                   frameCount:8
                                                        delay:0.1];
        self.firing = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:moving]];
        
//          cache = [[ProjectileCache alloc] initWithProjectile:kFireBall];
        
    }
    return self;
}

-(void) cast:(id)sender
{
     NSLog(@"casted");
     NSLog(@"%@", self.owner.name);
    [self.owner setSelectedSkill:self.skillNumber];
    [self.owner setTargeting:YES];
    
}




@end
