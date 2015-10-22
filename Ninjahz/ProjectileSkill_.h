//
//  ProjectileSkill_.h
//  DueL
//
//  Created by Calvin Cheng on 2013-10-12.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum Projectile_State : NSUInteger {
    P_Flying,
    P_Impact,
    P_Negate
} P_State;

@interface ProjectileSkill_ : Skill {
    
}

@property(nonatomic,readonly)int damage;
@property(nonatomic,readonly)int speed;
@property(nonatomic,readonly)CGPoint vector;
@property(nonatomic,readonly)P_State state;
@property(nonatomic,readonly)BOOL is_selected;

-(void) Hit;

@end