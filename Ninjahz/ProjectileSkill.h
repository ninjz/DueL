//
//  ProjectileSkill.h
//  elevatorAction
//
//  Created by Calvin Cheng on 2013-08-26.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Skill.h"

@interface ProjectileSkill : Skill {
    int dmg;
    int speed;
    CGPoint *vector;
}

@property (nonatomic,assign) int dmg;
@property (nonatomic,assign) int speed;
@property (nonatomic,assign) CGPoint *vector;


-(void) target:(CGPoint*)coord;

@end
