//
//  Player.h
//  DueL
//
//  Created by Calvin Cheng on 2013-08-27.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameScene.h"
#import "CharacterClass.h"
#import "Skill.h"

@interface Player : CCSprite {
    
}

@property(nonatomic, strong) id backWalking;


@property(nonatomic,assign) int currHp;
@property(nonatomic,assign) int maxHp;
@property(nonatomic,assign) NSString *name;
@property(nonatomic,assign) int speed;
@property (readwrite, nonatomic) CGPoint velocity;
@property(nonatomic,assign) BOOL mainPlayer;
@property(strong) NSMutableArray *equippedSkills;
@property(nonatomic,strong) Skin *equippedSkin;

//states
@property(nonatomic, assign)ActionState actionState;
@property(nonatomic) BOOL attacking;

-(id) initWithCharacter:(CharacterClass *)character;
-(void)backWalk;
-(void)backIdle;
-(void)frontWalk;
-(void)frontIdle;

-(void)useSkill:(int)skillNum
       atTarget:(CGPoint)target;

-(void)damage:(int)dmg;


@end
