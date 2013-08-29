//
//  ProjectileCache.h
//  DueL
//
//  Created by Calvin Cheng on 2013-08-29.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Fireball.h"
#import "Iceblast.h"
#import "Pyroblast.h"
#import "FrostStorm.h"
#import "TsunamiBlast.h"
#import "ProjectileSkill.h"

@interface ProjectileCache : ProjectileSkill {
    CCArray *bullets;
    
    NSUInteger nextInactiveBullet;
}

-(id) initWithProjectile:(Projectile) skill;

@end
