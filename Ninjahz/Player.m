//
//  Player.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-27.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "CharacterClass.h"
#import "ProjectileCache.h"
#import "ProjectileSkill.h"
#import "Skill.h"
#import "TargetCast.h"


@implementation Player

-(id) initWithCharacter:(CharacterClass *)character
               asPlayer:(int)playerNum
               withName:(NSString*)name
             atPosition:(CGPoint)position{
    if(self = [super initWithSpriteFrameName:character.equippedSkin.image])
    {
        _playerNumber = playerNum;
        _equippedSkills = character.equippedSkills;
        _equippedSkin = character.equippedSkin;
        _currHp = character.maxHp;
        _speed = character.speed;
        _velocity = character.velocity;
        _targeting = NO;
        _selectedSkill = 0;
        _desiredTarget = position;
        self.position = position;
        _name = name;
        
        
        
        // initialize skills
        
        
        
        
        
        [self scheduleUpdate];
        
    }
    return self;

}

-(void)backWalk
{
    if (_actionState != kActionStateWalkForward){
        [self stopAllActions];
        [self runAction:_equippedSkin.backWalking];
        _actionState = kActionStateWalkForward;
    }
}


-(void)backIdle
{
    if (_actionState != kActionStateIdle){
        [self stopAllActions];
        [self runAction:_equippedSkin.backIdle];
        _actionState = kActionStateIdle;
    }
}


-(void)frontWalk
{
    if (_actionState != kActionStateWalkForward){
        [self stopAllActions];
        [self runAction:_equippedSkin.frontWalking];
        _actionState = kActionStateWalkForward;
    }
}


-(void)frontIdle
{
    if (_actionState != kActionStateIdle){
        [self stopAllActions];
        [self runAction:_equippedSkin.frontIdle];
        _actionState = kActionStateIdle;
    }
}


-(void)damage:(int)dmg
{
    [self setCurrHp:_currHp - dmg];
    if (_currHp < 0){
        _currHp = 0;
    }
    [[[GameScene sharedGameScene] hudLayer_1] updateHealthBar];
    [[[GameScene sharedGameScene] hudLayer_2] updateHealthBar];
    
}

-(void)useSkill:(int)skillNum
       atTarget:(CGPoint)target
{
    NSLog(@"use skill:%i", skillNum);
//    NSLog(@"%@", (ProjectileSkill*)[[_equippedSkills objectAtIndex:0] cache] );
    ProjectileSkill *proj = (ProjectileSkill*)[self.equippedSkills objectAtIndex:skillNum-1];
    ProjectileCache *skill = proj.cache;
    NSLog(@"owner:%@", skill.owner.name);
    [skill shootFrom:self.position atTarget:target];
    _targeting = NO;
    
}


-(void)useTargetSkill:(int)skillNum
       atTarget:(CGPoint)target
{
    
    TargetCast *skill = (TargetCast*)[self.equippedSkills objectAtIndex:skillNum-1];
    [skill activateAtTarget:target];
    _targeting = NO;
    
}




-(void) movePlayer:(CGPoint) target
{
    if([self actionState] != kActionStateStunned){
        _desiredTarget = target;
        CGPoint vector = ccpSub(target, self.position);
        vector = ccpNormalize(vector);
        desiredDirection = vector;
    }
    
}
-(void) specialmovePlayer:(CGPoint) target
{
        _desiredTarget = target;
        CGPoint vector = ccpSub(target, self.position);
        vector = ccpNormalize(vector);
        desiredDirection = vector;
}


-(void)initSkills
{
    int i = 1;
    for(Skill *skill in self.equippedSkills){
        if([skill skillType] == kProjectile){
            ProjectileSkill *temp;
            temp = (ProjectileSkill *)skill;

            ProjectileCache *cache = [[ProjectileCache alloc] initWithProjectile:temp.projectile];
            
            [temp setCache:cache];
            [skill setOwner:self];
            
        } else {
            [skill setOwner:self];
        }
        [skill setSkillNumber:i];
        i++;
        
    }
    

    
}


-(void)update:(ccTime)dt
{
//    NSLog(@"desired pos: x:%f y:%f position: x:%f y:%f", desiredDirection.x, desiredDirection.y, self.position.x, self.position.y);
    if (ccpDistance(_desiredTarget, self.position) > 1){
        self.position = ccpAdd(self.position, ccpMult(desiredDirection, self.speed * dt));
        
        if(self.playerNumber == 1){
            [self backWalk];
        } else{
            [self frontWalk];
        }
    } else {
        if(self.playerNumber == 1){
            [self backIdle];
        } else{
            [self frontIdle];
        }
        
    }
}


@end
