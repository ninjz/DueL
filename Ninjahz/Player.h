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
    CGPoint desiredDirection;
    CGPoint desiredTarget;
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
@property(nonatomic,assign) int playerNumber;
@property(nonatomic,assign) int selectedSkill;

//states
@property(nonatomic, assign)ActionState actionState;
@property(nonatomic) BOOL targeting;

-(id) initWithCharacter:(CharacterClass *)character
               asPlayer:(int)playerNum
               withName:(NSString*)name
             atPosition:(CGPoint)position;
-(void)backWalk;
-(void)backIdle;
-(void)frontWalk;
-(void)frontIdle;

-(void)useSkill:(int)skillNum
       atTarget:(CGPoint)target;

-(void)damage:(int)dmg;
-(void) movePlayer:(CGPoint) target;
-(void) specialmovePlayer:(CGPoint) target;
-(void) initSkills;


@end
