//
//  ProjectileCache.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-29.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ProjectileCache.h"


@implementation ProjectileCache

-(id) initWithProjectile:(Projectile) skill
{
    if(self = [super init]){
        switch (skill) {
            case kFireBall:
                for (int i = 0; i < 10; i++) {
                    Fireball *fireball = [Fireball node];
                    fireball.visible = NO;
                    [bullets addObject:fireball];

                }
                break;
                
            default:
                break;
        }
    }
    return self;
}

-(void) shootFrom:(CGPoint)startPosition
               atTarget:(CGPoint)target
{
    CCNode *node = [bullets objectAtIndex:nextInactiveBullet];
    NSAssert([node isKindOfClass:[ProjectileSkill class]], @"not a Skill");
    
    ProjectileSkill *bullet = (ProjectileSkill *)node;
    [bullet shootFrom:startPosition atTarget:target];
    
    nextInactiveBullet++;
    if (nextInactiveBullet >= bullets.count){
        nextInactiveBullet = 0;
    }
}

@end
