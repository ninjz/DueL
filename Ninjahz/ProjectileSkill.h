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
#import "GameLayer.h"
#import "Player.h"

@interface ProjectileSkill : Skill {
    int dmg;
    int speed;
    CGPoint *vector;
    ALuint effect;
}

@property (nonatomic,assign) int dmg;
@property (nonatomic,assign) int speed;
@property (nonatomic,assign) CGPoint vector;


// animations
@property(nonatomic, strong)id firing;

-(void) shootFrom:(CGPoint)startPosition
         atTarget:(CGPoint)target;

@end
