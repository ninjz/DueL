//
//  CharacterClass.h
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-25.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Skill.h"
#import "Skin.h"

@interface CharacterClass : CCNode {

}

@property(nonatomic,assign) int startingHp;
@property(nonatomic,assign) int maxHp;
@property(nonatomic,assign) NSString *name;
@property(nonatomic,assign) int speed;
@property (readwrite, nonatomic) CGPoint velocity;


@property(nonatomic,assign) BOOL mainPlayer;


@property(nonatomic,assign) int maxLevel;
@property(nonatomic,assign) int skillPoints;
@property(nonatomic,assign) NSMutableArray *allSkins;
@property(nonatomic,assign) NSMutableArray *allSkills;
@property(nonatomic,assign) NSMutableArray *ownedSkins;
@property(nonatomic,assign) NSMutableArray *skillsKnown;
@property(strong) NSMutableArray *equippedSkills;
@property(nonatomic,assign) Skin *equippedSkin;


-(void) addSkill:(Skill*)skill;
-(void) equipSkill:(Skill*)skill;
-(void) unequipSkill:(Skill*)skill;
-(void) useSkill:(int)skillNum;


@end
