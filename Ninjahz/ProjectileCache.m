
//  ProjectileCache.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-29.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ProjectileCache.h"
#import "ProjectileSkill.h"
#import "Fireball.h"
#import "Iceblast.h"
#import "Pyroblast.h"
#import "FrostStorm.h"
#import "TsunamiBlast.h"
#import "GameLayer.h"
#import "Player.h"


@implementation ProjectileCache

-(id) initWithProjectile:(Projectile) skill
{
    if(self = [super init]){
        nextInactiveBullet = 0;
        
        self.bullets = [[CCArray alloc] initWithCapacity:10];
        
        switch (skill) {
            case kFireBall:
                for (int i = 0; i < 10; i++) {
                    Fireball *fireball = [Fireball node];
                    fireball.visible = NO;
                    [self addChild:fireball];
                    [self.bullets addObject:fireball];
                    
                }
                
                break;
                
                
            case kIceBlast:
                for (int i = 0; i < 10; i++) {
                    Iceblast *iceblast = [Iceblast node];
                    iceblast.visible = NO;
                    [self addChild:iceblast];
                    [self.bullets addObject:iceblast];
                    
                }
                
                break;
            case kPyroBlast:
                for (int i = 0; i < 10; i++) {
                    Pyroblast *pyroblast = [Pyroblast node];
                    pyroblast.visible = NO;
                    [self addChild:pyroblast];
                    [self.bullets addObject:pyroblast];
                    
                }
                
                break;
            case kFrostStorm:
                for (int i = 0; i < 10; i++) {
                    FrostStorm *froststorm = [FrostStorm node];
                    froststorm.visible = NO;
                    [self addChild:froststorm];
                    [self.bullets addObject:froststorm];
                    
                }
                
                break;
                
            case kTsunamiBlast:
                for (int i = 0; i < 10; i++) {
                    TsunamiBlast *tsunami = [TsunamiBlast node];
                    tsunami.visible = NO;
                    [self addChild:tsunami];
                    [self.bullets addObject:tsunami];
                    
                }
                
                break;
            default:
                
                break;
        }
        [[GameLayer sharedGameLayer] addChild:self];
    }
    return self;
}

-(void) shootFrom:(CGPoint)startPosition
               atTarget:(CGPoint)target
{
    CCNode *node = [self.bullets objectAtIndex:nextInactiveBullet];
    NSAssert([node isKindOfClass:[ProjectileSkill class]], @"not a Skill");
    
    ProjectileSkill *bullet = (ProjectileSkill *)node;
    [bullet shootAtFrom:startPosition atTarget:target];
    NSLog(@"HEREEEE");
    
    nextInactiveBullet++;
    if (nextInactiveBullet >= self.bullets.count){
        nextInactiveBullet = 0;
    }
    NSLog(@"shoot");
}

-(void) setOwner:(Player *)owner
{
    [super setOwner:owner];
    for (ProjectileSkill *skill in self.bullets){
        [skill setOwner:owner];
        NSLog(@"%@", skill.owner.name);
    }
//
}



@end
