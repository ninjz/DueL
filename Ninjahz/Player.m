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
        
    }
    return self;

}
@end
