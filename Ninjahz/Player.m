//
//  Player.m
//  DueL
//
//  Created by Calvin Cheng on 2013-08-27.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "CharacterClass.h"


@implementation Player

-(id) initWithCharacter:(CharacterClass *)character{
    if(self = [super initWithSpriteFrameName:character.equippedSkin.image])
    {
        _equippedSkills = character.equippedSkills;
        _equippedSkin = character.equippedSkin;
        _currHp = character.maxHp;
        _speed = character.speed;
        _velocity = character.velocity;
        _attacking = NO;
        
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
    ProjectileSkill *skill = [_equippedSkills objectAtIndex:skillNum - 1];
    [skill setOwner: self];
    [skill shootFrom:self.position atTarget:target];
    _attacking = NO;
    
}


@end
