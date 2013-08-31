//
//  ProjectileSkill.m
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-26.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ProjectileSkill.h"
#import "GameLayer.h"
#import "Player.h"
#import "ProjectileCache.h"

@implementation ProjectileSkill

-(id)init
{
    if(self = [super init]){
        self.skillType = kProjectile;
        
    }
    
    return self;
}


-(void) shootAtFrom:(CGPoint)startPosition
         atTarget:(CGPoint)target
{
    self.position = startPosition;
    self.visible = YES;
    self.vector = ccpSub(target, startPosition);
    self.vector = ccpNormalize(self.vector);
    
    // sprite rotation calculations
    float theta = atan((self.position.y - target.y)/(self.position.x - target.x)) * 180 * 7 /22;
    
    float calculatedAngle;
    
    if(self.position.y - target.y > 0)
    {
        if(self.position.x - target.x < 0)
        {
            calculatedAngle = (-90-theta);
        }
        else if(self.position.x - target.x > 0)
        {
            calculatedAngle = (90-theta);
        }
    }
    else if(self.position.y - target.y < 0)
    {
        if(self.position.x - target.x < 0)
        {
            calculatedAngle = (270-theta);
        }
        else if(self.position.x - target.x > 0)
        {
            calculatedAngle = (90-theta);
        }
    }
    
    self.rotation = calculatedAngle + 180;
    
    [self runAction:self.firing];
    effect = [[SimpleAudioEngine sharedEngine] playEffect: @"fireBurning.mp3"];
     NSLog(@"SHOOTING");
    [self scheduleUpdate];
    
}



-(void) update:(ccTime)delta
{
    self.position = ccpAdd(self.position,
                           ccpMult(self.vector, self.speed * delta));
    
    
    
    for (Player *player in [GameLayer sharedPlayers]){
        if (self.owner != player){
            if (CGRectIntersectsRect(player.boundingBox, self.boundingBox )){
                [player damage:self.dmg];
                self.visible = NO;
                
                [[SimpleAudioEngine sharedEngine] stopEffect:effect];
                
                // BOOM
                effect = [[SimpleAudioEngine sharedEngine] playEffect:@"boom.mp3"];
                [self stopAllActions];
                [self unscheduleUpdate];
            }
        }
        
    }
   
        
        
        
        // check for projectile out of bounds
        if(self.position.x < 0 || self.position.x > SCREEN.width + 30 ){
            self.visible = NO;
            
            [[SimpleAudioEngine sharedEngine] stopEffect:effect];
            [self stopAllActions];
            [self unscheduleUpdate];
        }
    
    if(self.position.y < 0 || self.position.y > SCREEN.height + 30){
        self.visible = NO;
        
        [[SimpleAudioEngine sharedEngine] stopEffect:effect];
        [self stopAllActions];
        [self unscheduleUpdate];
    }
    
    
}


-(void) setOwner:(Player*)player
{
    [super setOwner:player];
    [self.cache setOwner:player];
    
}

-(void) cast:(id)sender
{
    
    [self.owner setSelectedSkill:self.skillNumber];
    [self.owner setTargeting:YES];
    
}

@end
