//
//  ProjectileSkill.h
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-26.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "Skill.h"


@class ProjectileCache;
@interface ProjectileSkill : Skill {
    int dmg;
    int speed;
    CGPoint *vector;
    ALuint effect;
}

@property (nonatomic,assign) int dmg;
@property (nonatomic,assign) int speed;
@property (nonatomic,assign) CGPoint vector;
@property (strong) ProjectileCache *cache;
@property (nonatomic,assign) Projectile projectile;


// animations
@property(nonatomic, strong)id firing;

-(void) setCacheOwner:(Player*) player;
-(void) shootAtFrom:(CGPoint)startPosition
         atTarget:(CGPoint)target;

@end
