//
//  Player.h
//  DueL
//
//  Created by Calvin Cheng on 2013-08-27.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CharacterClass.h"

@interface Player : CCSprite {
    
}

@property(nonatomic,assign) int currHp;
@property(nonatomic,assign) int maxHp;
@property(nonatomic,assign) NSString *name;
@property(nonatomic,assign) int speed;
@property (readwrite, nonatomic) CGPoint velocity;
@property(nonatomic,assign) BOOL mainPlayer;
@property(strong) NSMutableArray *equippedSkills;
@property(nonatomic,assign) Skin *equippedSkin;

-(id) initWithCharacter:(CharacterClass *)character;

@end
