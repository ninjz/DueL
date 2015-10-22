//
//  Teleport.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-30.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Teleport.h"
#import "Player.h"


@implementation Teleport

-(id)init {
    if (self = [super initWithSpriteFrameName:@"fireball_up1.png"]){
        
        self.visible = NO;
        self.currentCooldown = 0;
        self.cooldownTimeMax = 2;
        self.isReady = YES;
        self.isActive = NO;
        self.hasSecondary = NO;
        self.skillIcon = @"Spell_frost_windwalkon.png";
        self.scale = 2;
        
//        CCAnimation *moving = [CCAnimation animationWithFrame:@"fireball_up"
//                                                   frameCount:8
//                                                        delay:0.1];
//        self.firing = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:moving]];
        
        //          cache = [[ProjectileCache alloc] initWithProjectile:kFireBall];
//        [[GameLayer sharedGameLayer] addChild:self];
        
    }
    return self;
}


-(void)activateAtTarget:(CGPoint)target{
    [self.owner setDesiredTarget:target];
    [self.owner setPosition:target];
}

@end
