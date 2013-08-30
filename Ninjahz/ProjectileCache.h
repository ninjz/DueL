//
//  ProjectileCache.h
//  DueL
//
//  Created by Calvin Cheng on 2013-08-29.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Cache.h"

@interface ProjectileCache : Cache {
    CCSpriteBatchNode *batch;
    NSUInteger nextInactiveBullet;
}



-(id) initWithProjectile:(Projectile) skill;

-(void) shootFrom:(CGPoint)startPosition
         atTarget:(CGPoint)target;

@end
